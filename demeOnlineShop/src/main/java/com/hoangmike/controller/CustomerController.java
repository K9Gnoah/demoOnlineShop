package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.core.parameters.P;
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

    @GetMapping("/addToCart")
    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    public String addToCart() {
        return "addToCart";
    }

    @GetMapping("/buyNow")
    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    public String buyNow() {
        return "buyNow";
    }

    @GetMapping("/voteHeart")
    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    public String voteHeart() {
        return "voteHeart";
    }
}
