package com.hoangmike.dto.request;

import jakarta.validation.constraints.*;
import lombok.*;
import lombok.experimental.FieldDefaults;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserCreationRequest {
    @Size(min=3, message = "USERNAME_INVALID")
    String username;
    @Size(min = 6, message = "INVALID_PASSWORD")
    String password;
    @Email(message = "you must input correct email format")
    String email;
    @Size(min=9, message = "phone must be at least 9 numbers")
    String phone;
    @NotNull(message = "full name field can not null")
    String fullName;
    @NotNull(message = "user status field can not null")
    Boolean userStatus;
    @NotNull(message = "role id can not null")
    Integer roleId;



}
