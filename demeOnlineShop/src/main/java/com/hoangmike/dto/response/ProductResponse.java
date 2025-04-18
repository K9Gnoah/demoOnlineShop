package com.hoangmike.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductResponse {
    String productId;
    String productName;
    String productDescription;
    double productPrice;
    String productImage;
    boolean productStatus;
    int productQuantity;
    int categoryId;
}
