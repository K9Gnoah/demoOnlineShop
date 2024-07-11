package com.hoangmike.repository;

import com.hoangmike.entity.Product;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    boolean existsByProductName(String productName);

    Page<Product> findAll(Pageable pageable);

    Page<Product> findByProductStatus(Pageable pageable, boolean status);

    @Query("SELECT p FROM Product p WHERE p.category.id = :categoryId")
    Page<Product> findByCategoryId(Pageable pageable, @Param("categoryId") Integer categoryId);

    @Query(value = "SELECT \n" +
            "\tb.product_id,\n" +
            "    b.product_name,\n" +
            "    COALESCE(a.TOTAL_SOLD, 0) AS TOTAL_SOLD,\n" +
            "    COALESCE(a.CANCELLED, 0) AS CANCELLED,\n" +
            "    COALESCE(a.PENDING, 0) AS PENDING,\n" +
            "    b.product_quantity as TOTAL_IN_STOCK\n" +
            "FROM(\n" +
            "SELECT \n" +
            "    oi.product_id,\n" +
            "    SUM(CASE WHEN o.status = 'DELIVERED' THEN oi.quantity ELSE 0 END) AS TOTAL_SOLD,\n" +
            "    SUM(CASE WHEN o.status = 'CANCELLED' THEN oi.quantity ELSE 0 END) AS CANCELLED,\n" +
            "    SUM(CASE WHEN o.status = 'PENDING' THEN oi.quantity ELSE 0 END) AS PENDING\n" +
            "FROM \n" +
            "    order_items oi\n" +
            "LEFT JOIN \n" +
            "    orders o ON o.id = oi.order_id\n" +
            "GROUP BY \n" +
            "    oi.product_id\n" +
            ") a\n" +
            "RIGHT JOIN (\n" +
            "SELECT product_id, product_name, product_quantity\n" +
            "FROM product) b\n" +
            "ON a.product_id = b.product_id\n" +
            "ORDER BY b.product_id", nativeQuery = true)
    List<Object[]> getProductsStatistics();

    @Modifying
    @Query("UPDATE Product p SET p.productQuantity = p.productQuantity + :quantity WHERE p.productId = :productId")
    void updateProductQuantity(@Param("productId") Long productId, @Param("quantity") int quantity);
}
