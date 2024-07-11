package com.hoangmike.mapper;

import com.hoangmike.dto.request.UserCreationRequest;
import com.hoangmike.dto.response.UserResponse;
import com.hoangmike.entity.Role;
import com.hoangmike.entity.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.Named;

import java.util.List;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public interface UserMapper {
    User toUser(UserCreationRequest request);

    @Mapping(target = "roles", source = "roles", qualifiedByName = "rolesToStringList")
    UserResponse toUserResponse(User user);

    List<UserResponse> toUserResponses(List<User> users);

    void AddOrUpdateUser(@MappingTarget User user, UserCreationRequest request);

    @Named("rolesToStringList")
    default List<String> rolesToStringList(List<Role> roles) {
        return roles.stream().map(Role::getName).collect(Collectors.toList());
    }
}
