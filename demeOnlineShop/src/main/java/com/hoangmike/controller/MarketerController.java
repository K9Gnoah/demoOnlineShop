package com.hoangmike.controller;

import com.hoangmike.entity.Blog;
import com.hoangmike.entity.User;
import com.hoangmike.service.BlogService;
import com.hoangmike.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/marketer")
public class MarketerController {
   @Autowired
    private BlogService blogService;

    @GetMapping("/blogManagement")
    public String blogManagement(Model model){
        List<Blog> blogs = blogService.getAllBlogs();
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        model.addAttribute("blogs", blogs);
        return "blogManagement";
    }
}
