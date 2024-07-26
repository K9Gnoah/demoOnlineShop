package com.hoangmike.controller;

import com.hoangmike.dto.response.BlogResponse;
import com.hoangmike.dto.response.ProductResponse;
import com.hoangmike.entity.Blog;
import com.hoangmike.entity.Product;
import com.hoangmike.entity.User;
import com.hoangmike.service.BlogService;
import com.hoangmike.service.CustomUserDetailsService;
import com.hoangmike.service.impl.ProductServiceImpl;
import com.hoangmike.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @Autowired
    private ProductServiceImpl productService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private UserServiceImpl userServiceImpl;

    @GetMapping("/aboutPage")
    public String aboutPage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !(authentication instanceof AnonymousAuthenticationToken)) {
            User currentuser = CustomUserDetailsService.getCurrentUserEntity();
            model.addAttribute("user", currentuser);
        }
        return "aboutPage";
    }

    @GetMapping("/home")
    public String home(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !(authentication instanceof AnonymousAuthenticationToken)) {
            User currentuser = CustomUserDetailsService.getCurrentUserEntity();
            model.addAttribute("user", currentuser);
        }

        return "homepage";
    }

    @GetMapping("/blog")
    public String blog(Model model,
                       @RequestParam(name="page", defaultValue = "0") int page,
                       @RequestParam(name="size", defaultValue = "4") int size){
        Page<Blog> blogPage;
        blogPage = blogService.findActiveBlogPag(page, size);
        model.addAttribute("listBlog", blogPage);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !(authentication instanceof AnonymousAuthenticationToken)) {
            User currentuser = CustomUserDetailsService.getCurrentUserEntity();
            model.addAttribute("user", currentuser);
        }
        return "blog";
    }
    @GetMapping("/blogDetails/{id}")
    public String blogDetails(Model model, @PathVariable("id") Integer id) {
        try {
            BlogResponse blog = blogService.getBlogById(id);
            User author = userServiceImpl.findUserByUsername(blog.getAuthor());
            model.addAttribute("blog", blog);
            model.addAttribute("author", author);
            blogService.incrementBlogViews(Long.valueOf(id));
            return "blogDetails";
        } catch (Exception e) {
            model.addAttribute("error", "An error occurred while fetching blog details");
            return "404"; // Ensure you have an errorPage template to display the error
        }
    }

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
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !(authentication instanceof AnonymousAuthenticationToken)) {
            User currentuser = CustomUserDetailsService.getCurrentUserEntity();
            model.addAttribute("user", currentuser);
        }
        model.addAttribute("selectedCategory", category);
        return "showProduct";
        } catch (Exception e) {
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
            model.addAttribute("error", "An error occurred while fetching product details");
            return "404"; // Ensure you have an errorPage template to display the error
        }
    }
}
