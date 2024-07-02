package com.hoangmike.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    Product product;

    int quantity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cart_id")
    @ToString.Exclude
    private Cart cart;
}
