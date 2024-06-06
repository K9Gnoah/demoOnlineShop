package com.hoangmike.controller;

import com.hoangmike.service.AuthenticationService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    private final AuthenticationService authenticationService;

    public AdminController(AuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    @GetMapping("/adminDashBoard")
    public String adminDashBoard(HttpServletRequest request)
    {
        return "adDashBoard";
    }
}
