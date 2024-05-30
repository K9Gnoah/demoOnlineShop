package com.hoangmike.service;

import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import org.springframework.data.domain.Page;


import java.util.List;

public interface ProductService {
    ProductResponse addProduct (ProductCreationRequest request);
    ProductResponse updateProduct (int productId, ProductCreationRequest request);
    void deleteProduct (int productId);
    ProductResponse getProductById (int productId);
    List<Product> getAllProducts ();
    public Page<Product> findPaginated(int page, int size);
    public Page<Product> findActiveProductPag(int page, int size);
}
