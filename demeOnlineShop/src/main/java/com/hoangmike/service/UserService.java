package com.hoangmike.service;

import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.entity.User;

import java.util.List;

public interface UserService {
    public UserResponse createUser(UserCreationRequest request);
    public List<User> getAllUser();
    public UserResponse getUserById(String id);
    public UserResponse updateUserById(String userId, UserCreationRequest request);
    public void deleteUserById(String id);
}
