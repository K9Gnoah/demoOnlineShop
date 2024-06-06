package com.hoangmike.service.impl;

import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.entity.User;
import com.hoangmike.enums.Role;
import com.hoangmike.exception.AppException;
import com.hoangmike.exception.ErrorCode;
import com.hoangmike.mapper.UserMapper;
import com.hoangmike.repository.UserRepository;
import com.hoangmike.service.UserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserServiceImpl implements UserService {
    UserRepository userRepository;
    UserMapper userMapper;
    PasswordEncoder passwordEncoder;

    @Override
    public UserResponse createUser(UserCreationRequest request) {

        User user = new User();
        if(userRepository.existsByUserName(request.getUserName())) {
            throw new AppException(ErrorCode.USER_EXISTED);
        }
        else {
            userMapper.AddOrUpdateUser(user,request);
            user.setPassword(passwordEncoder.encode(request.getPassword()));
        }

        HashSet<String> roles = new HashSet<>();
        roles.add(Role.USER.name());
//        user.setRoles(roles);

        return userMapper.toUserResponse(userRepository.save(user));
    }
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public List<UserResponse> getAllUser() {
        log.info("in getalluser method");
        return userMapper.toUserResponses(userRepository.findAll());
    }

    @Override
    public UserResponse getUserById(String id) {

        return userMapper.toUserResponse(userRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND)));
    }

    @Override
    public UserResponse updateUserById(String userId, UserCreationRequest request) {
        User user = userRepository.findById(userId).orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        if(userRepository.existsByUserName(request.getUserName()))
            throw new AppException(ErrorCode.USER_EXISTED);
        else userMapper.AddOrUpdateUser(user, request);

        return userMapper.toUserResponse(userRepository.save(user));
    }

    @Override
    public void deleteUserById(String id) {
        if(userRepository.existsById(id))
            userRepository.deleteById(id);
        else throw new AppException(ErrorCode.USER_NOT_FOUND);
    }
}
