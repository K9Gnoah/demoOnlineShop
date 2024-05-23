package com.hoangmike.dto;

import jakarta.validation.constraints.*;

public class UserCreationRequest {
    @Size(min=5, message = "username must be at least 5 characters")
    private String userName;
    @Size(min = 6, message = "password must be at least 6 characters")
    private String password;
    @Email(message = "you must input correct email format")
    private String email;
    @Size(min=9, message = "phone must be at least 9 numbers")
    private String phone;
    @NotNull(message = "full name field can not null")
    private String fullName;
    @NotNull(message = "user status field can not null")
    private Boolean userStatus;
    @NotNull(message = "role id can not null")
    private Integer roleId;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isUserStatus() {
        return userStatus;
    }

    public void setUserStatus(boolean userStatus) {
        this.userStatus = userStatus;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
