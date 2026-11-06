package com.orders.api.application;



import com.orders.api.domain.OrderItemUpdateDTO;
import com.orders.api.domain.OrderStatus;
import com.orders.api.domain.Order;
import com.orders.api.domain.OrderItem;
import com.orders.api.domain.OrderResponseDTO;
import com.orders.api.domain.OrderUpdateDTO;
import com.orders.api.domain.OrderResponseDTO.OrderItemDTO;
import com.orders.api.infrastructure.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponseDTO createOrder(List<OrderItemDTO> itemsDTO) {
        if (itemsDTO == null || itemsDTO.isEmpty()) {
            throw new IllegalArgumentException("La orden debe contener al menos un artículo");
        }

        List<OrderItem> items = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        Order order = new Order();
        order.setId(UUID.randomUUID());
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());
        order.setStatus(Order.OrderStatus.PENDING);

        for (OrderItemDTO itemDTO : itemsDTO) {
            if (itemDTO.productId() == null || itemDTO.productId().isBlank()) {
                throw new IllegalArgumentException("El productId no puede estar vacío");
            }
            if (itemDTO.quantity() == null || itemDTO.quantity() <= 0) {
                throw new IllegalArgumentException("La cantidad debe ser mayor a 0");
            }
            if (itemDTO.unitPrice() == null || itemDTO.unitPrice().compareTo(BigDecimal.ZERO) <= 0) {
                throw new IllegalArgumentException("El precio unitario debe ser mayor a 0");
            }

            BigDecimal itemTotal = itemDTO.unitPrice().multiply(BigDecimal.valueOf(itemDTO.quantity()));
            totalAmount = totalAmount.add(itemTotal);

            OrderItem item = new OrderItem(order, itemDTO.productId(), itemDTO.quantity(), itemDTO.unitPrice());
            items.add(item);
        }

        order.setItems(items);
        order.setTotalAmount(totalAmount);

        Order savedOrder = orderRepository.save(order);
        return OrderResponseDTO.fromOrder(savedOrder);
    }

    @Transactional(readOnly = true)
    public Optional<OrderResponseDTO> getOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        return orderRepository.findById(id).map(OrderResponseDTO::fromOrder);
    }

    public Optional<OrderResponseDTO> updateOrder(UUID id, OrderUpdateDTO updateDTO) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        if (updateDTO == null) {
            throw new IllegalArgumentException("Los datos de actualización no pueden ser nulos");
        }

        return orderRepository.findById(id).map(existingOrder -> {
            if (updateDTO.status() != null) {
                try {
                    existingOrder.setStatus(Order.OrderStatus.valueOf(updateDTO.status()));
                } catch (IllegalArgumentException e) {
                    throw new IllegalArgumentException("Estado de orden inválido: " + updateDTO.status());
                }
            }

            if (updateDTO.items() != null && !updateDTO.items().isEmpty()) {
                List<OrderItem> updatedItems = new ArrayList<>();
                BigDecimal newTotal = BigDecimal.ZERO;

                for (OrderUpdateDTO.OrderItemUpdateDTO itemDTO : updateDTO.items()) {
                    if (itemDTO.productId() == null || itemDTO.productId().isBlank()) {
                        throw new IllegalArgumentException("El productId no puede estar vacío");
                    }
                    if (itemDTO.quantity() == null || itemDTO.quantity() <= 0) {
                        throw new IllegalArgumentException("La cantidad debe ser mayor a 0");
                    }
                    if (itemDTO.unitPrice() == null || itemDTO.unitPrice().compareTo(BigDecimal.ZERO) <= 0) {
                        throw new IllegalArgumentException("El precio unitario debe ser mayor a 0");
                    }

                    BigDecimal itemTotal = itemDTO.unitPrice().multiply(BigDecimal.valueOf(itemDTO.quantity()));
                    newTotal = newTotal.add(itemTotal);

                    OrderItem item = new OrderItem(existingOrder, itemDTO.productId(), itemDTO.quantity(), itemDTO.unitPrice());
                    updatedItems.add(item);
                }

                existingOrder.setItems(updatedItems);
                existingOrder.setTotalAmount(newTotal);
            }

            existingOrder.setUpdatedAt(LocalDateTime.now());
            Order savedOrder = orderRepository.save(existingOrder);
            return OrderResponseDTO.fromOrder(savedOrder);
        });
    }

    public boolean deleteOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> orderOpt = orderRepository.findById(id);
        if (orderOpt.isEmpty()) {
            return false;
        }

        Order order = orderOpt.get();
        if (order.getStatus() == Order.OrderStatus.COMPLETED) {
            throw new IllegalStateException("No se puede eliminar una orden completada");
        }

        orderRepository.delete(order);
        return true;
    }

    @Transactional(readOnly = true)
    public List<OrderResponseDTO> getAllOrders() {
        return orderRepository.findAll().stream()
                .map(OrderResponseDTO::fromOrder)
                .collect(Collectors.toList());
    }
}