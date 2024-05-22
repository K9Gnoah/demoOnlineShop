package com.hoangmike.controllerAPI;

import com.hoangmike.dto.ProductCreationRequest;
import com.hoangmike.entity.Product;
import com.hoangmike.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("apiProductController")
@RequestMapping("/api/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/{productId}")
    Product getProductById(@PathVariable("productId") int productId) {
        return productService.getProductById(productId);
    }


    @PostMapping
    public String insertProduct(@RequestBody ProductCreationRequest request) {
        productService.addProduct(request);
        return "add product success";
    }

    @PutMapping("/{productId}")
    public String updateProduct(@PathVariable("productId") int productId, @RequestBody ProductCreationRequest request) {
        productService.updateProduct(productId, request);
        return "update product success";
    }

    @DeleteMapping("/{productId}")
    public String deletProductById(@PathVariable("productId") int productId) {
         productService.deleteProduct(productId);
         return "delete product success";
    }

    @GetMapping
    public List<Product> productList() {
        return productService.getAllProducts();
    }
}
