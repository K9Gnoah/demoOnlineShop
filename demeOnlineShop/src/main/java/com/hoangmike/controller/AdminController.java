package com.hoangmike.controller;

import com.hoangmike.entity.User;
import com.hoangmike.service.CustomUserDetailsService;
import com.hoangmike.service.OrderService;
import com.hoangmike.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private OrderService orderService;

    @GetMapping("/adminDashBoard")
    public String adminDashBoard(Model model)  {
        model.addAttribute("statistics", orderService.getProductStatistics());
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "adDashBoard";
    }

    @GetMapping("/manageAccount")
    public String manageAccount(Model model,
                                @RequestParam(name = "page", defaultValue = "0") int page,
                                @RequestParam(name = "size", defaultValue = "4") int size){
        Page<User> userPage = userService.findPaginated(page, size);
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        model.addAttribute("listUser", userPage);
        return "manageAccount";
    }

    @GetMapping("/updateAdmin/{id}")
    public String updateAccount(@PathVariable String id, Model model) {
        model.addAttribute("userUpd", userService.getUserById(id));
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        return "updateAdmin";
    }}
