package com.hoangmike.controller;

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

    @PostMapping("/submitLoginForm")
    public String submitLogin(@RequestParam(name="username") String username,
            @RequestParam(name = "password") String password) {

        if(username.equals("admin") && password.equals("123")) {
            return "redirect:/home";
        }
        else return "404";
    }

    @GetMapping("/home")
    public String home(Model model) {
        return "homepage";
    }
}
