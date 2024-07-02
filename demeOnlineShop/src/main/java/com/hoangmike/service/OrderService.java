package com.hoangmike.service;

import com.hoangmike.entity.*;
import com.hoangmike.repository.CartRepository;
import com.hoangmike.repository.OrderItemRepository;
import com.hoangmike.repository.OrderRepository;
import com.hoangmike.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderService {
    @Autowired
    private CartService cartService;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartRepository cartRepository;

    public void createOrder() {
        // get the cart
        Cart cart = cartService.getCart();

        // create the order
        Order order = new Order();
        order.setUser(cart.getUser());
        order.setOrderDate(new Date());

        // convert CartItems to OrderItems and add them to the order
        for (CartItem cartItem : cart.getItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            order.addOrderItem(orderItem); // Use the addOrderItem method
        }

        // save the order (order items will be saved because of cascade)
        orderRepository.save(order);

        // update the stock
        for (CartItem item : cart.getItems()) {
            Product product = item.getProduct();
            product.setProductQuantity(product.getProductQuantity() - item.getQuantity());
            productRepository.save(product);
        }

        // clear the cart
        cart.getItems().clear();
        cartRepository.save(cart);
    }

}
