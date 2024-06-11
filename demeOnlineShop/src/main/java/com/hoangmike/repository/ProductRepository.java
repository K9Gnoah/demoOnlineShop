package com.hoangmike.repository;

import com.hoangmike.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    boolean existsByProductName(String productName);

    Page<Product> findAll(Pageable pageable);

    Page<Product> findByProductStatus(Pageable pageable, boolean status);
}
