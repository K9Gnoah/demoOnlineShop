package com.hoangmike.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    @GetMapping("/adminDashBoard")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String adminDashBoard() {
        return "adDashBoard";
    }

    @GetMapping("/manageAccount")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String manageAccount() {
        return "manageAccount";
    }
}
