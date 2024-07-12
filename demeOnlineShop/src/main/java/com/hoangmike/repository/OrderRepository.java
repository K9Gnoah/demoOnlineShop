package com.hoangmike.repository;

import com.hoangmike.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserId(Long userId);

    @Query("SELECT o FROM Order o ORDER BY o.orderDate DESC")
    List<Order> findAllOrdersSortedByDate();

    @Query("SELECT o FROM Order o WHERE o.deliveryPerson.id = :deliveryPersonId ORDER BY o.orderDate DESC")
    List<Order> findOrdersByDeliveryPersonIdOrderByOrderDateDesc(@Param("deliveryPersonId") Long deliveryPersonId);
}
