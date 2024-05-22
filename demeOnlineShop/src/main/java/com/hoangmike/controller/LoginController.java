package com.hoangmike.controller;

import com.hoangmike.dto.LoginDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class LoginController {
    @GetMapping("/showLoginForm")
    public String showLoginForm(Model model) {
        model.addAttribute("loginDTO", new LoginDTO());
        return "loginForm";
    }

    @PostMapping("/submitLoginForm")
    public String submitLogin(@RequestBody LoginDTO loginDTO, Model model) {
        loginDTO.setUsername("username");
        loginDTO.setPassword("password");
        model.addAttribute("loginDTO", loginDTO);
        if(loginDTO.getUsername().equals("admin") && loginDTO.getPassword().equals("123")) {
            return "redirect:/email";
        }
        else return "404";
    }
}
