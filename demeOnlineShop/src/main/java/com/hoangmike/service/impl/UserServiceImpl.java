package com.hoangmike.service.impl;

import com.hoangmike.dto.UserCreationRequest;
import com.hoangmike.entity.User;
import com.hoangmike.repository.UserRepository;
import com.hoangmike.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User createUser(UserCreationRequest request) {
        User user = new User();
        if(userRepository.existsByUserName(request.getUserName()))
            throw new RuntimeException("Username already exists");
        user.setUserName(request.getUserName());
        user.setPassword(request.getPassword());
        user.setEmail(request.getEmail());
        user.setPhone(request.getPhone());
        user.setFullName(request.getFullName());
        user.setUserStatus(request.isUserStatus());
        user.setRoleId(request.getRoleId());
        return userRepository.save(user);
    }


    @Override
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(String id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found")); 
    }

    @Override
    public User updateUserById(String userId, UserCreationRequest request) {
        User user = getUserById(userId);
        if(userRepository.existsByUserName(request.getUserName()))
            throw new RuntimeException("Username already exists");
        user.setUserName(request.getUserName());
        user.setPassword(request.getPassword());
        user.setEmail(request.getEmail());
        user.setPhone(request.getPhone());
        user.setFullName(request.getFullName());
        user.setUserStatus(request.isUserStatus());
        user.setRoleId(request.getRoleId());
        return userRepository.save(user);
    }

    @Override
    public void deleteUserById(String id) {
        userRepository.deleteById(id);
    }
}
