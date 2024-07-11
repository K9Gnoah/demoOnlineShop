package com.hoangmike.service;

import com.hoangmike.entity.Order;
import com.hoangmike.entity.OrderItem;
import com.hoangmike.entity.OrderStatus;
import com.hoangmike.entity.Product;
import com.hoangmike.repository.OrderRepository;
import com.hoangmike.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DeliverService {
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;


    public void updateOrderStatus(Long orderId, OrderStatus status){
        Order order = orderRepository.findById(orderId).orElseThrow(() -> new RuntimeException("Order not found"));
        if(status == OrderStatus.CANCELLED){
            for(OrderItem orderItem : order.getOrderItems()){
                Product product = orderItem.getProduct();
                product.setProductQuantity(product.getProductQuantity() + orderItem.getQuantity());
                productRepository.save(product);
            }
        }
        order.setStatus(status);
        orderRepository.save(order);
    }
}
