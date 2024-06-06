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
    @GetMapping("/login")
    public String showLoginForm() {
        return "loginForm";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username, @RequestParam String password) {
        // Use the AuthenticationService to authenticate the user
        boolean isAuthenticated = AuthenticationService.authenticate(username, password);

        // If successful, redirect to a secure page
        if (isAuthenticated) {
            return "redirect:/securePage";
        }

        // If not successful, redirect back to the login page with an error message
        else {
            return "redirect:/login?error=true";
        }
    }

    @GetMapping("/home")
    public String home(Model model) {
        return "homepage";
    }
}
