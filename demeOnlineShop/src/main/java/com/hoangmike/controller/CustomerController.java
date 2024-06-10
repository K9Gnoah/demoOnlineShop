package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/customer")
@EnableMethodSecurity
public class CustomerController {
    @Autowired
    private ProductServiceImpl productService;


    @GetMapping("/showProduct")
    @PreAuthorize("hasAuthority('USER')")
    public String showProduct(Model model,
                              @RequestParam(name = "page", defaultValue = "0") int page,
                              @RequestParam(name = "size", defaultValue = "8") int size) {
        Page<Product> productPage = productService.findActiveProductPag(page, size);
        model.addAttribute("listProduct", productPage);
        return "showProduct";
    }
}
