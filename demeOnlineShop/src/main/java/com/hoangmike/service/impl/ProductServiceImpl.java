package com.hoangmike.service.impl;

import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import com.hoangmike.exception.AppException;
import com.hoangmike.exception.ErrorCode;
import com.hoangmike.mapper.ProductMapper;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.service.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.util.List;
@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductServiceImpl implements ProductService {
    ProductRepository productRepository;
    ProductMapper productMapper;


    @Override
    public ProductResponse addProduct(ProductCreationRequest request) {
        Product product = new Product();
        if(productRepository.existsByProductName(request.getProductName()))
            throw new AppException(ErrorCode.PRODUCT_EXISTED);
        productMapper.AddOrUpdateProduct(product, request);
        return productMapper.toProductResponse(productRepository.save(product));
    }

    @Override
    public ProductResponse updateProduct(int productId, ProductCreationRequest request) {
        Product product = productRepository.findById(Long.valueOf(productId)).orElseThrow(()->new AppException(ErrorCode.PRODUCT_NOT_FOUND));
        if(product.getProductName().equals(request.getProductName())){
            productMapper.AddOrUpdateProduct(product, request);
        }
        else if(productRepository.existsByProductName(request.getProductName())) {
            throw new AppException(ErrorCode.PRODUCT_EXISTED);
        }
        else  productMapper.AddOrUpdateProduct(product, request);
        return productMapper.toProductResponse(productRepository.save(product));
    }



    @Override
    public void deleteProduct(int productId) {
        if(getProductById(productId) != null) {
            productRepository.deleteById((long) productId);
        }
        else{
            throw new AppException(ErrorCode.PRODUCT_NOT_FOUND);
        }
    }

    @Override
    public ProductResponse getProductById(int productId) {
        return productMapper.toProductResponse(productRepository.findById((long) productId)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_FOUND)));
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

    @Override
    public Page<Product> findActiveProductPag(int page, int size) {
        return productRepository.findByProductStatus(PageRequest.of(page, size), true);
    }


}
