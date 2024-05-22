package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import java.util.List;

@Controller("webProductController")
public class ProductController {
    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/addProductForm")
    public String addProductForm() {
        return "addProductForm";
    }

    @GetMapping("/productList")
    public String productList(Model model) {
        List<Product> listProduct = productService.getAllProducts();
        model.addAttribute("listProduct", listProduct);
        return "productList";
    }

    @GetMapping("/updateProduct/{productId}")
    public String updateProduct(@PathVariable int productId, Model model) {
        model.addAttribute("product", productService.getProductById(productId));
        return "updateProduct";
    }

}
