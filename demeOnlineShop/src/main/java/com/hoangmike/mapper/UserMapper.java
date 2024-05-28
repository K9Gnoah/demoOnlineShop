package com.hoangmike.mapper;

import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.entity.User;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

import java.util.List;

@Mapper(componentModel = "spring")
public interface UserMapper {
    User toUser(UserCreationRequest request);
    UserResponse toUserResponse(User user);
    List<UserResponse> toUserResponses(List<User> users);
    void AddOrUpdateUser(@MappingTarget User user, UserCreationRequest request);
}
