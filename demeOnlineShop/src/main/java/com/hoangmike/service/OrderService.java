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

    public List<Order> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        orders.forEach(order -> order.getOrderItems().size());
        return orders;
    }

    public void createOrder(String address, String name, String phone) {
        // get the cart
        Cart cart = cartService.getCart();

        // create the order
        Order order = new Order();
        order.setUser(cart.getUser());
        order.setOrderDate(new Date());
        order.setStatus(OrderStatus.PENDING);
        order.setAddress(address);
        order.setName(name);
        order.setPhone(phone);

        // convert CartItems to OrderItems and add them to the order
        for (CartItem cartItem : cart.getItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            order.addOrderItem(orderItem); // Use the addOrderItem method
        }

        // save the order (order items will be saved because of cascade)
        orderRepository.save(order);

        // clear the cart
        cart.getItems().clear();
        cartRepository.save(cart);
    }

    public void updateOrderStatus(Long orderId, OrderStatus status){
        Order order = orderRepository.findById(orderId).orElseThrow(()-> new RuntimeException("Order not found"));
        order.setStatus(status);
        orderRepository.save(order);
    }

    public List<Object[]> getProductStatistics(){
        return productRepository.getProductsStatistics();
    }

}
