package com.hoangmike.service;

import com.hoangmike.dto.ProductCreationRequest;
import com.hoangmike.entity.Product;
import org.springframework.data.domain.Page;


import java.util.List;

public interface ProductService {
    void addProduct (ProductCreationRequest request);
    void updateProduct (int productId, ProductCreationRequest request);
    void deleteProduct (int productId);
    Product getProductById (int productId);
    List<Product> getAllProducts ();
    public Page<Product> findPaginated(int page, int size);
}
