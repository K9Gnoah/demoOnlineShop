package com.hoangmike.repository;

import com.hoangmike.entity.OrderItem;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    @Transactional
    @Modifying
    @Query("DELETE FROM OrderItem  oi WHERE oi.product.id = :productId")
    void deleteByProductId(Long productId);
}
