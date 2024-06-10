package com.hoangmike.controller;

import com.hoangmike.entity.User;
import com.hoangmike.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/adminDashBoard")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String adminDashBoard() {
        return "adDashBoard";
    }

    @GetMapping("/manageAccount")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String manageAccount(Model model,
                                @RequestParam(name = "page", defaultValue = "0") int page,
                                @RequestParam(name = "size", defaultValue = "4") int size){
        Page<User> userPage = userService.findPaginated(page, size);
        model.addAttribute("listUser", userPage);
        return "manageAccount";
    }
}
