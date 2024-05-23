package com.hoangmike.service;

import com.hoangmike.dto.UserCreationRequest;
import com.hoangmike.entity.User;

import java.util.List;

public interface UserService {
    public User createUser(UserCreationRequest request);
    public List<User> getAllUser();
    public User getUserById(String id);
    public User updateUserById(String userId, UserCreationRequest request);
    public void deleteUserById(String id);
}
