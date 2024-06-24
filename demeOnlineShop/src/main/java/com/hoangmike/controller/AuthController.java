package com.hoangmike.controller;

import com.hoangmike.dto.request.UserDTO;
import com.hoangmike.entity.User;
import com.hoangmike.service.impl.UserServiceImpl;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AuthController {
    private final UserServiceImpl userServiceImpl;

    public AuthController(UserServiceImpl userServiceImpl) {
        this.userServiceImpl = userServiceImpl;
    }

    @GetMapping("/home")
    public String home(Model model) {
        return "homepage";
    }

    //handler method to handle user registration form submit request
    @PostMapping("/register/save")
    public String registration(@Valid @ModelAttribute("user") UserDTO userDto,
                               BindingResult result,
                               Model model){
        User existingUser = userServiceImpl.findUserByEmail(userDto.getEmail());

        if(existingUser != null && existingUser.getEmail() != null && !existingUser.getEmail().isEmpty()){
            result.rejectValue("email", null,
                    "There is already an account registered with that email");
        }

        if(result.hasErrors()){
            model.addAttribute("user", userDto);
            return "/register";
        }

        userServiceImpl.saveUser(userDto);
        return "redirect:/login?success";

    }

    @GetMapping("/users")
    public String users(Model model){
        List<UserDTO> users = userServiceImpl.getAllUser();
        model.addAttribute("users", users);
        return "listUSer";
    }

    @GetMapping("/login")
    public String login(@RequestParam(value="success", required = false) String success, Model model){
        if(success != null){
            model.addAttribute("message", "User registered successfully");
        }
        return "login";
    }

}
