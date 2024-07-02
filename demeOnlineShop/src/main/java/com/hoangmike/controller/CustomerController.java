package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.entity.User;
import com.hoangmike.service.CartService;
import com.hoangmike.service.CustomUserDetailsService;
import com.hoangmike.service.impl.ProductServiceImpl;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/customer")
@EnableMethodSecurity
public class CustomerController {
    @Autowired
    private ProductServiceImpl productService;
    @Autowired
    private CartService cartService;

    @GetMapping("/cart")
    public String cart(Model model){
        model.addAttribute("cart", cartService.getCart());
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "cart";
    }

    @GetMapping("/checkout")
    public String checkout(Model model){
        model.addAttribute("cart", cartService.getCart());
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "checkout";
    }

}
