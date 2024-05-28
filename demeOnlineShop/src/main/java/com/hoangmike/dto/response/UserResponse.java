package com.hoangmike.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserResponse {
    String id;
    String userName;
    String password;
    String email;
    String phone;
    String fullName;
    boolean userStatus;
    int roleId;

}
