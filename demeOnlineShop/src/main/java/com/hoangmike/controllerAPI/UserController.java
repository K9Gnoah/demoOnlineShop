package com.hoangmike.controllerAPI;

import com.hoangmike.dto.response.ApiResponse;
import com.hoangmike.dto.request.ChangePasswordRequest;
import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.service.UserService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;


@RestController("apiUserController")
@RequestMapping("/api/users")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE,makeFinal = true)
public class UserController {
    UserService userService;

    @PostMapping
    ApiResponse<UserResponse> createUser(@RequestBody @Valid UserCreationRequest request) {
        ApiResponse<UserResponse> apiResponse = new ApiResponse<>();
        apiResponse.setResult(userService.createUser(request));
        return apiResponse;
    }

//    @GetMapping
//    ApiResponse<List<User>> getUsers() {
//        ApiResponse<List<User>> apiResponse = new ApiResponse<>();
//        apiResponse.setResult(userService.getAllUser());
//        return apiResponse;
//    }

    @GetMapping("/{userId}")
    ApiResponse<UserResponse> getUserByID(@PathVariable("userId") String userId) {
        ApiResponse<UserResponse> apiResponse = new ApiResponse<>();
        apiResponse.setResult(userService.getUserById(userId));
        return apiResponse;
    }

    @PutMapping("/{userId}")
    ApiResponse<UserResponse> updateUserByID(@PathVariable String userId, @RequestBody @Valid UserCreationRequest request) {
        ApiResponse<UserResponse> apiResponse = new ApiResponse<>();
        apiResponse.setResult(userService.updateUserById(userId, request));
        return apiResponse;
    }

    @DeleteMapping("/{userId}")
    String deleteUserByID(@PathVariable String userId) {
        userService.deleteUserById(userId);
        return "User has been deleted";
    }

    @PutMapping("/changepass/{userId}")
    public ApiResponse<UserResponse> changePassword(@PathVariable String userId,@RequestBody ChangePasswordRequest request) {
        ApiResponse<UserResponse> apiResponse = new ApiResponse<>();
        apiResponse.setResult(userService.changePassword(userId, request));
        return apiResponse;
    }
}
