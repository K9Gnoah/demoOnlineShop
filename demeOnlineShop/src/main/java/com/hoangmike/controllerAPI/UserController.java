package com.hoangmike.controllerAPI;

import com.hoangmike.dto.UserCreationRequest;
import com.hoangmike.entity.User;
import com.hoangmike.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController("apiUserController")
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping
    User createUser(@RequestBody @Valid UserCreationRequest request) {
        return userService.createUser(request);
    }

    @GetMapping
    List<User> getUsers() {
        return userService.getAllUser();
    }

    @GetMapping("/{userId}")
    User getUserByID(@PathVariable("userId") String userId) {
        return userService.getUserById(userId);
    }

    @PutMapping("/{userId}")
    User updateUserByID(@PathVariable String userId, @RequestBody @Valid UserCreationRequest request) {
        return userService.updateUserById(userId, request);
    }

    @DeleteMapping("/{userId}")
    String deleteUserByID(@PathVariable String userId) {
        userService.deleteUserById(userId);
        return "User has been deleted";
    }
}
