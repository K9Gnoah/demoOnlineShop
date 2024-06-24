package com.hoangmike.controller;

import com.hoangmike.entity.User;
import com.hoangmike.service.CustomUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
    @GetMapping("/profile")
    public String profile(Model model) {
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "userProfile";
    }

    @GetMapping("/changepass/{userId}")
    public String changepass(Model model){
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "changePassword";
    }
}
