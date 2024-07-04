package com.hoangmike.dto.response;

import com.hoangmike.entity.Role;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserResponse {
    String id;
    String username;
    String password;
    String email;
    String phone;
    String address;
    String avatar;
    boolean userStatus;
    List<Role> roles = new ArrayList<>();

}
