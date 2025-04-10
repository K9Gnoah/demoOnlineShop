package com.hoangmike.service;

import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.request.ProductUpdateStockIn;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;


import java.util.List;

public interface ProductService {
    ProductResponse addProduct (ProductCreationRequest request);
    ProductResponse updateProduct (int productId, ProductCreationRequest request);
    void deleteProduct (int productId);
    ProductResponse getProductById (int productId);
    List<ProductResponse> getAllProducts ();
    Product findProductById (int productId);
    public Page<Product> findPaginated(int page, int size);
    public Page<Product> findActiveProductPag(int page, int size);
    public Page<Product> findByCategory(Integer category, int page, int size);
}
