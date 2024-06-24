package com.hoangmike.service.impl;


import com.hoangmike.dto.request.ApiResponse;
import com.hoangmike.dto.request.ChangePasswordRequest;
import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.request.UserDTO;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.entity.Role;
import com.hoangmike.entity.User;
import com.hoangmike.exception.AppException;
import com.hoangmike.exception.ErrorCode;
import com.hoangmike.mapper.UserMapper;
import com.hoangmike.repository.RoleRepository;
import com.hoangmike.repository.UserRepository;
import com.hoangmike.service.UserService;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserServiceImpl implements UserService {
    UserRepository userRepository;
    UserMapper userMapper;
    RoleRepository roleRepository;
    @Autowired
    PasswordEncoder passwordEncoder;
    UserServiceImpl(UserRepository userRepository, UserMapper userMapper, RoleRepository roleRepository, PasswordEncoder passwordEncoder){
        this.userRepository = userRepository;
        this.userMapper = userMapper;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserResponse createUser(UserCreationRequest request) {

        User user = new User();
        if(userRepository.existsByUsername(request.getUsername())) {
            throw new AppException(ErrorCode.USER_EXISTED);
        }
        else {
            userMapper.AddOrUpdateUser(user,request);
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
            user.setPassword(passwordEncoder.encode(request.getPassword()));
        }

        return userMapper.toUserResponse(userRepository.save(user));
    }


    @Override
    public List<UserDTO> getAllUser() {
        List<User> users = userRepository.findAll();
//        return userRepository.findAll();
        return users.stream().map((user) -> convertEntityToDto(user))
                .collect(Collectors.toList());
    }
    private UserDTO convertEntityToDto(User user){
        UserDTO userDto = new UserDTO();
        String[] name = user.getUsername().split(" ");
        userDto.setFirstName(name[0]);
        userDto.setLastName(name[1]);
        userDto.setEmail(user.getEmail());
        return userDto;
    }
    @Override
    public UserResponse getUserById(String id) {

        return userMapper.toUserResponse(userRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND)));
    }

    @Override
    public UserResponse updateUserById(String userId, UserCreationRequest request) {
        User user = userRepository.findById(userId).orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        if(userRepository.existsByUsername(request.getUsername()))
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

    @Override
    public Page<User> findPaginated(int page, int size) {
        return userRepository.findAll(PageRequest.of(page, size));
    }

    @Override
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(UserDTO userDto) {
        User user = new User();
        user.setUsername(userDto.getFirstName() + " " + userDto.getLastName());
        user.setEmail(userDto.getEmail());
        // encrypt the password using spring security
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));

        Role role = roleRepository.findByName("ROLE_CUSTOMER");
        if(role == null){
            role = checkRoleExist();
        }
        user.setRoles(Arrays.asList(role));
        userRepository.save(user);
    }

    @Override
    public UserResponse changePassword(String Id, ChangePasswordRequest request) {
        ApiResponse<UserResponse> apiResponse = new ApiResponse<>();
        User user = userRepository.findById(Id).orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
        if(user == null || !passwordEncoder.matches(request.getPassword(), user.getPassword())){
            throw new AppException(ErrorCode.PASSWORD_INCORRCECT);
        }
        else if(request.getNewPassword().equals(request.getPassword())){
            throw new AppException(ErrorCode.PASSWORD_INVALID);
        }
        else {
            user.setPassword(passwordEncoder.encode(request.getNewPassword()));
            return userMapper.toUserResponse(userRepository.save(user));
        }
    }

    private UserDTO mapToUserDto(User user) {
        UserDTO userDTO = new UserDTO();
        String[] str = user.getUsername().split(" ");
        userDTO.setFirstName(str[0]);
        userDTO.setLastName(str[1]);
        userDTO.setEmail(user.getEmail());
        return userDTO;
    }

    private Role checkRoleExist() {
        Role role = new Role();
        role.setName("ROLE_CUSTOMER");
        return roleRepository.save(role);
    }
}
