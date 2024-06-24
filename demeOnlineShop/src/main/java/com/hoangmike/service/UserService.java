package com.hoangmike.service;

import com.hoangmike.dto.request.ChangePasswordRequest;
import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.request.UserDTO;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.entity.User;
import org.springframework.data.domain.Page;

import java.util.List;

public interface UserService {
    public UserResponse createUser(UserCreationRequest request);
    public List<UserDTO> getAllUser();
    public UserResponse getUserById(String id);
    public UserResponse updateUserById(String userId, UserCreationRequest request);
    public void deleteUserById(String id);
    public Page<User> findPaginated(int page, int size);
    public User findUserByEmail(String email);
    void saveUser(UserDTO userDto);
    UserResponse changePassword(String Id, ChangePasswordRequest request);
}
