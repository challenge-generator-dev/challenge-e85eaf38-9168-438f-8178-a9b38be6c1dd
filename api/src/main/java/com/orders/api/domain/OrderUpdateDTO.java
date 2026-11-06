package com.orders.api.domain;

import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.List;

public record OrderUpdateDTO(
    @NotNull
    Order.OrderStatus status,

    @NotEmpty
    List<OrderItemUpdateDTO> items
) {
    public record OrderItemUpdateDTO(
        @NotBlank
        @Size(min = 1, max = 255)
        String productId,

        @NotNull
        @Positive
        Integer quantity,

        @NotNull
        @PositiveOrZero
        BigDecimal unitPrice
    ) {
        public BigDecimal getTotalPrice() {
            return unitPrice.multiply(BigDecimal.valueOf(quantity));
        }
    }
}