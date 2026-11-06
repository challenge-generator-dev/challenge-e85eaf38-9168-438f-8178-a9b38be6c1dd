package com.orders.api.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public record OrderResponseDTO(
    UUID id,
    Order.OrderStatus status,
    BigDecimal totalAmount,
    List<OrderItemDTO> items,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public static OrderResponseDTO fromOrder(Order order) {
        List<OrderItemDTO> itemDTOs = order.getItems().stream()
                .map(item -> new OrderItemDTO(
                        item.getProductId(),
                        item.getQuantity(),
                        item.getUnitPrice(),
                        item.getTotalPrice()
                ))
                .toList();

        return new OrderResponseDTO(
                order.getId(),
                order.getStatus(),
                order.getTotalAmount(),
                itemDTOs,
                order.getCreatedAt(),
                order.getUpdatedAt()
        );
    }

    public record OrderItemDTO(
        String productId,
        Integer quantity,
        BigDecimal unitPrice,
        BigDecimal totalPrice
    ) {}
}