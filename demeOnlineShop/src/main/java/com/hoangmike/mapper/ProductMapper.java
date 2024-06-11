package com.hoangmike.mapper;

import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface ProductMapper {
    void AddOrUpdateProduct(@MappingTarget Product product, ProductCreationRequest request);
    @Mapping(source = "category.categoryId", target = "categoryId")
    ProductResponse toProductResponse(Product product);
    List<ProductResponse> toProductResponse(List<Product> products);
}
