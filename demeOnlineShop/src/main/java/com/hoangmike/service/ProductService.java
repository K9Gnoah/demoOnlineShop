package com.hoangmike.service;

import com.hoangmike.dto.ProductCreationRequest;
import com.hoangmike.entity.Product;
import com.hoangmike.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ProductService {
    void addProduct (ProductCreationRequest request);
    void updateProduct (int productId, ProductCreationRequest request);
    void deleteProduct (int productId);
    Product getProductById (int productId);
    List<Product> getAllProducts ();
}
