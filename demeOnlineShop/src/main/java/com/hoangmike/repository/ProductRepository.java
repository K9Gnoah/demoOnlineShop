package com.hoangmike.repository;

import com.hoangmike.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
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
            "\tp.product_id,\n" +
            "    p.product_name,\n" +
            "    COALESCE(SUM(o.quantity), 0) as TOTAL_SOLD,\n" +
            "    SUM(p.product_quantity) as TOTAL_IN_STOCK,\n" +
            "    SUM(p.product_quantity) + COALESCE(SUM(o.quantity), 0) AS TOTAL_RESOURCE\n" +
            "FROM \n" +
            "\tproduct p\n" +
            "LEFT JOIN \n" +
            "\torder_items o \n" +
            "ON \n" +
            "\tp.product_id = o.product_id\n" +
            "GROUP BY\n" +
            "\tp.product_id;", nativeQuery = true)
    List<Object[]> getProductsStatistics();
}
