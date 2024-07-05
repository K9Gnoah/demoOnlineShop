package com.hoangmike.controller;

import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Product;
import com.hoangmike.entity.User;
import com.hoangmike.service.CustomUserDetailsService;
import com.hoangmike.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/common")
public class CommonController {
    private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

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
                              @RequestParam(name= "category", required = false) Integer category,
                              @RequestParam(name = "page", defaultValue = "0") int page,
                              @RequestParam(name = "size", defaultValue = "8") int size
                              ){

        try{
        Page<Product> productPage;
        if(category != null) {
            productPage = productService.findByCategory(category, page, size);
        } else {
            productPage = productService.findActiveProductPag(page, size);
        }
//        Page<Product> productPage = productService.findActiveProductPag(page, size);
        model.addAttribute("listProduct", productPage);
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        model.addAttribute("selectedCategory", category);
        return "showProduct";
        } catch (Exception e) {
            logger.error("Error fetching products", e);
            model.addAttribute("error", "An error occurred while fetching products");
            return "404"; // Ensure you have an errorPage template to display the error
        }
    }

    @GetMapping("/productDetails/{id}")
    public String productDetails(Model model, @PathVariable("id") Integer id) {
        try {
            ProductResponse product = productService.getProductById(id);
            model.addAttribute("product", product);
            return "productDetails";
        } catch (Exception e) {
            logger.error("Error fetching product details", e);
            model.addAttribute("error", "An error occurred while fetching product details");
            return "404"; // Ensure you have an errorPage template to display the error
        }
    }
}
