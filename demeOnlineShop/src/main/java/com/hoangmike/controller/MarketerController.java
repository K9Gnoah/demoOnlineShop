package com.hoangmike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/marketer")
public class MarketerController {
    @GetMapping("/blogManagement")
    public String blogManagement(Model model){
        return "blogManagement";
    }
}
