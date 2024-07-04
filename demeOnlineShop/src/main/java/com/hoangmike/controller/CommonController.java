package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.entity.User;
import com.hoangmike.service.CustomUserDetailsService;
import com.hoangmike.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/common")
public class CommonController {
    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/aboutPage")
    public String aboutPage() {
        return "aboutPage";
    }

    @GetMapping("/blog")
    public String blog(){return "blog";}

    @GetMapping("/showProduct")
    public String showProduct(Model model,
                              @RequestParam(name = "page", defaultValue = "0") int page,
                              @RequestParam(name = "size", defaultValue = "8") int size) {
        Page<Product> productPage = productService.findActiveProductPag(page, size);
        model.addAttribute("listProduct", productPage);
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "showProduct";
    }
}
