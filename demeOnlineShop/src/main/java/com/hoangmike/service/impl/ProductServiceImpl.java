package com.hoangmike.service.impl;

import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import com.hoangmike.exception.AppException;
import com.hoangmike.exception.ErrorCode;
import com.hoangmike.mapper.ProductMapper;
import com.hoangmike.repository.CartItemRepository;
import com.hoangmike.repository.OrderItemRepository;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.service.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.mapstruct.BeanMapping;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductServiceImpl implements ProductService {
    ProductRepository productRepository;
    ProductMapper productMapper;
    private final CartItemRepository cartItemRepository;
    private final OrderItemRepository orderItemRepository;


    @Override
    public ProductResponse addProduct(ProductCreationRequest request) {
        Product product = new Product();
        if (productRepository.existsByProductName(request.getProductName()))
            throw new AppException(ErrorCode.PRODUCT_EXISTED);

        productMapper.AddOrUpdateProduct(product, request);
        return productMapper.toProductResponse(productRepository.save(product));
    }

    @Override
    public ProductResponse updateProduct(int productId, ProductCreationRequest request) {
        Product product = productRepository.findById(Long.valueOf(productId)).orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_FOUND));
        if (product.getProductName().equals(request.getProductName())) {
            productMapper.AddOrUpdateProduct(product, request);
        } else if (productRepository.existsByProductName(request.getProductName())) {
            throw new AppException(ErrorCode.PRODUCT_EXISTED);
        } else productMapper.AddOrUpdateProduct(product, request);
        return productMapper.toProductResponse(productRepository.save(product));
    }


    @Override
    public void deleteProduct(int productId) {
        Product product = productRepository.findById((long) productId)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_FOUND));
        cartItemRepository.deleteByProductId((long) productId);
        orderItemRepository.deleteByProductId((long) productId);
        productRepository.deleteById((long) productId);
    }

    @Override
    public ProductResponse getProductById(int productId) {
        return productMapper.toProductResponse(productRepository.findById((long) productId)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_FOUND)));
    }

    @Override
    public List<ProductResponse> getAllProducts() {
        List<Product> productsList = productRepository.findAll();
        return productMapper.toProductResponse(productsList);
    }

    @Override
    public Product findProductById(int productId) {
        Product product = new Product();
        product = productRepository.findById((long) productId)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_FOUND));
        return product;
    }

    @Override
    public Page<Product> findPaginated(int page, int size) {
        return productRepository.findAll(PageRequest.of(page, size));
    }

    @Override
    public Page<Product> findActiveProductPag(int page, int size) {
        return productRepository.findByProductStatus(PageRequest.of(page, size), true);
    }

    @Override
    public Page<Product> findByCategory(Integer category, int page, int size) {
        return productRepository.findByCategoryId(PageRequest.of(page, size), category);
    }


}
