package com.hoangmike.controller;

import com.hoangmike.dto.request.AuthenticationRequest;
import com.hoangmike.service.AuthenticationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @GetMapping("/showLoginForm")
    public String showLoginForm() {
        return "loginForm";
    }

    @GetMapping("/home")
    public String home(Model model) {
        return "homepage";
    }
}
