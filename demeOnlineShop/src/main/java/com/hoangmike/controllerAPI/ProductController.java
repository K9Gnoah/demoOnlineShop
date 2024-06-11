package com.hoangmike.controllerAPI;

import com.hoangmike.dto.request.ApiResponse;
import com.hoangmike.dto.request.ProductCreationRequest;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import com.hoangmike.service.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("apiProductController")
@RequestMapping("/api/products")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE,makeFinal = true)
public class ProductController {
    ProductService productService;

    @GetMapping("/{productId}")
    ApiResponse<Product> getProductById(@PathVariable("productId") int productId) {
        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setResult(productService.getProductById(productId));
        return apiResponse;
    }


    @PostMapping
    ApiResponse<Product> insertProduct(@RequestBody ProductCreationRequest request) {
        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setResult(productService.addProduct(request));
        return apiResponse;
    }

    @PutMapping("/{productId}")
    ApiResponse<ProductResponse> updateProduct(@PathVariable("productId") int productId, @RequestBody ProductCreationRequest request) {
        ApiResponse<ProductResponse> apiResponse = new ApiResponse();
        apiResponse.setResult(productService.updateProduct(productId, request));
        return apiResponse;
    }

    @DeleteMapping("/{productId}")
    public String deletProductById(@PathVariable("productId") int productId) {
         productService.deleteProduct(productId);
         return "delete product success";
    }

    @GetMapping
    public List<ProductResponse> productList() {
        return productService.getAllProducts();
    }
}
