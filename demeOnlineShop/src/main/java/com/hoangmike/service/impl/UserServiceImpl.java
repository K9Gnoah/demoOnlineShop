package com.hoangmike.service.impl;

import com.hoangmike.dto.UserCreationRequest;
import com.hoangmike.entity.User;
import com.hoangmike.repository.UserRepository;
import com.hoangmike.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User createUser(UserCreationRequest request) {
        User user = new User();
        user.setUserName(request.getUserName());
        user.setPassword(request.getPassword());
        user.setEmail(request.getEmail());
        user.setPhone(request.getPhone());
        user.setFullName(request.getFullName());
        user.setUserStatus(request.isUserStatus());
        user.setRoleId(request.getRoleId());
        return userRepository.save(user);
    }
}
