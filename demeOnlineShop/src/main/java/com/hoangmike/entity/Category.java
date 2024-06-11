package com.hoangmike.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)

public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int categoryId;

    String categoryName;
    boolean categoryStatus;

    @OneToMany(mappedBy = "category")
    List<Product> products;


}
