package com.hoangmike.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @ManyToOne
    @JoinColumn(name = "productID", referencedColumnName = "productID")
    Product product;

    private int quantity;

    @ManyToOne
    @JoinColumn(name = "cartID", referencedColumnName = "cartID")
    private Cart cart;
}
