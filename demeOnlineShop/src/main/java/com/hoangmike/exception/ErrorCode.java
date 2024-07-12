package com.hoangmike.exception;

public enum ErrorCode {
    UNCATEGORIZED_EXCEPTION(9999, "Uncategorized error"),
    INVALID_KEY(1001, "Uncategorized error"),
    USER_EXISTED(1002, "Username existed"),
    USERNAME_INVALID(1003, "Username must be at least 3 characters"),
    INVALID_PASSWORD(1004, "Password must be at least 6 characters"),
    PRODUCT_EXISTED(1005, "Product name existed"),
    USER_NOT_FOUND(1006, "User not found"),
    PRODUCT_NOT_FOUND(1007, "Product not found"),
    UNAUTHENTICATED(1008, "Unauthenticated"),
    PASSWORD_INCORRCECT(1009, "Password is incorrect"),
    PASSWORD_INVALID(1010, "New password must be different from the old password"),
    PRODUCT_QUANTITY_EXCEED(1011, "Not enough stock for product"),
    ORDER_NOT_FOUND(1012, "Order not found"),
    DELIVERY_PERSON_NOT_FOUND(1013, "Delivery person not found"),
    ;

    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    private int code;
    private String message;

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
