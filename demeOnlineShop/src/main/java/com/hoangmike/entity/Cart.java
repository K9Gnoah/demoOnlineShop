package com.hoangmike.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.FieldDefaults;

import java.util.ArrayList;
import java.util.List;
@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private List<CartItem> items = new ArrayList<>();

    @OneToOne
    User user;

    public void addItem(CartItem item){
        items.add(item);
    }

    public void removeItem(CartItem item){
        items.remove(item);
    }

    public void updateItemQuantity(CartItem item, int quantity){
        int index = items.indexOf(item);
        items.get(index).setQuantity(quantity);
    }

}
