package com.hoangmike.service;

import com.hoangmike.dto.UserCreationRequest;
import com.hoangmike.entity.User;

public interface UserService {
    public User createUser(UserCreationRequest user);
}
