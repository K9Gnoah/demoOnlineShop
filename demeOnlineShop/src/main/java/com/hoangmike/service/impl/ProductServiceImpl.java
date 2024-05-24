package com.hoangmike.service.impl;

import com.hoangmike.dto.ProductCreationRequest;
import com.hoangmike.entity.Product;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductRepository productRepository;


    @Override
    public void addProduct(ProductCreationRequest request) {
        Product product = new Product();

        product.setProductName(request.getProductName());
        product.setProductDescription(request.getProductDescription());
        product.setProductPrice(request.getProductPrice());
        product.setProductImage(request.getProductImage());
        product.setProductStatus(request.isProductStatus());
        product.setProductQuantity(request.getProductQuantity());
        product.setCategoryId(request.getCategoryId());
        productRepository.save(product);
    }

    @Override
    public void updateProduct(int productId, ProductCreationRequest request) {
        Product product = getProductById(productId);
        product.setProductName(request.getProductName());
        product.setProductDescription(request.getProductDescription());
        product.setProductPrice(request.getProductPrice());
        product.setProductImage(request.getProductImage());
        product.setProductStatus(request.isProductStatus());
        product.setProductQuantity(request.getProductQuantity());
        product.setCategoryId(request.getCategoryId());
        productRepository.save(product);
    }



    @Override
    public void deleteProduct(int productId) {
        if(getProductById(productId) != null) {
            productRepository.deleteById((long) productId);
        }
        else{
            throw new RuntimeException("User not found");
        }
    }

    @Override
    public Product getProductById(int productId) {
        return productRepository.findById((long) productId)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> productsList = productRepository.findAll();
        return (List<Product>)productRepository.findAll();
    }

    @Override
    public Page<Product> findPaginated(int page, int size) {
        return productRepository.findAll(PageRequest.of(page, size));
    }


}
