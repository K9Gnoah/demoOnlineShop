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
    int productId;

    String productName;
    @Column(columnDefinition = "TEXT")
    String productDescription;
    double productPrice;
    String productImage;
    boolean productStatus;
    int productQuantity;

    @ManyToOne
    @JoinColumn(name = "category_id")
    Category category;

    public Product() {
    }


    public Product(int productId,String productName, int quantity) {
        this.productId = productId;
        this.productName = productName;
        this.productQuantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductInfo{" +
                "productName='" + productName + '\'' +
                ", quantity=" + productQuantity +
                '}';
    }
}
