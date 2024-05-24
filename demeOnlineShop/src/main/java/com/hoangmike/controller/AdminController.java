package com.hoangmike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    @GetMapping("adminDashBoard")
    public String adminDashBoard() {
        return "adDashBoard";
    }
}
