package com.hoangmike.mapper;

import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    void AddOrUpdateProduct(@MappingTarget Product product, ProductCreationRequest request);
    ProductResponse toProductResponse(Product product);
}
