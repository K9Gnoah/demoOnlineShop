package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller ("webProductController")
public class ProductController {
    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/addProductForm")
    public String addProductForm() {
        return "addProductForm";
    }

    @GetMapping("/saler/productList")
    public String productList(Model model,
                              @RequestParam(name = "page", defaultValue = "0") int page,
                              @RequestParam(name = "size", defaultValue = "4") int size) {
        Page<Product> productPage = productService.findPaginated(page, size);
        model.addAttribute("listProduct", productPage);
        return "productList";
    }

    @GetMapping("/updateProduct/{productId}")
    public String updateProduct(@PathVariable int productId, Model model) {
        model.addAttribute("product", productService.getProductById(productId));
        return "updateProduct";
    }

}
