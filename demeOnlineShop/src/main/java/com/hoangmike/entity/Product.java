package com.hoangmike.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)

public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int productID;

    String productName;
    @Column(columnDefinition = "TEXT")
    String productDescription;
    double productPrice;
    String productImage;
    boolean productStatus;
    int productQuantity;
    int categoryId;


}
