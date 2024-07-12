package com.hoangmike.service;

import com.hoangmike.entity.*;
import com.hoangmike.exception.AppException;
import com.hoangmike.exception.ErrorCode;
import com.hoangmike.repository.CartRepository;
import com.hoangmike.repository.OrderRepository;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

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
    @Autowired
    private UserRepository userRepository;

    public List<Order> getOrdersByDeliveryPersonId(Long deliveryPersonId) {
        return orderRepository.findOrdersByDeliveryPersonIdOrderByOrderDateDesc(deliveryPersonId);
    }

    public List<Order> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        orders.forEach(order -> order.getOrderItems().size());
        return orders;
    }

    public List<Order> getAllOrdersSortedByDate() {
        List<Order> orders = orderRepository.findAllOrdersSortedByDate();
        orders.forEach(order -> order.getOrderItems().size());
        return orders;
    }

    public List<Order> getOrdersByUserId(Long userId) {
        return orderRepository.findByUserId(userId);
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
            int currentProductId = cartItem.getProduct().getProductId();
            Optional<Product> currentProduct = productRepository.findById(Long.valueOf(currentProductId));
            int quantityProductInCart = cartItem.getQuantity();
            int quantityProductInStock = currentProduct.get().getProductQuantity();
            if (quantityProductInStock < quantityProductInCart) {
                throw new AppException(ErrorCode.PRODUCT_QUANTITY_EXCEED);
            }

            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            order.addOrderItem(orderItem);
        }

        // save the order (order items will be saved because of cascade)
        orderRepository.save(order);

        // clear the cart
        cart.getItems().clear();
        cartRepository.save(cart);
    }

//    public void updateOrderStatus(Long orderId, OrderStatus status) {
//        Order order = orderRepository.findById(orderId).orElseThrow(() -> new RuntimeException("Order not found"));
//        if (status == OrderStatus.DELIVERING && order.getStatus() == OrderStatus.PENDING) {
//            for (OrderItem item : order.getOrderItems()) {
//                Product product = item.getProduct();
//                int newQuantity = product.getProductQuantity() - item.getQuantity();
//                if (newQuantity < 0) {
//                    throw new AppException(ErrorCode.PRODUCT_QUANTITY_EXCEED);
//                }
//
//            }
//            for (OrderItem item : order.getOrderItems()) {
//                Product product = item.getProduct();
//                int newQuantity = product.getProductQuantity() - item.getQuantity();
//                product.setProductQuantity(newQuantity);
//                productRepository.save(product);
//            }
//            order.setStatus(status);
//            orderRepository.save(order);
//        }
//    }

    public void updateOrderStatus(Long orderId, OrderStatus status, Long deliveryPersonId) {
        Order order = orderRepository.findById(orderId).orElseThrow(() -> new AppException(ErrorCode.ORDER_NOT_FOUND));
        User deliveryPerson = userRepository.findById(String.valueOf(deliveryPersonId)).orElseThrow(() -> new AppException(ErrorCode.DELIVERY_PERSON_NOT_FOUND));

        if (status == OrderStatus.DELIVERING && order.getStatus() == OrderStatus.PENDING) {
            for (OrderItem item : order.getOrderItems()) {
                Product product = item.getProduct();
                int newQuantity = product.getProductQuantity() - item.getQuantity();
                if (newQuantity < 0) {
                    throw new AppException(ErrorCode.PRODUCT_QUANTITY_EXCEED);
                }

            }
            for (OrderItem item : order.getOrderItems()) {
                Product product = item.getProduct();
                int newQuantity = product.getProductQuantity() - item.getQuantity();
                product.setProductQuantity(newQuantity);
                productRepository.save(product);
            }
            order.setStatus(status);
            order.setDeliveryPerson(deliveryPerson);
            orderRepository.save(order);
        }
    }

    public List<Object[]> getProductStatistics() {
        return productRepository.getProductsStatistics();
    }



}
