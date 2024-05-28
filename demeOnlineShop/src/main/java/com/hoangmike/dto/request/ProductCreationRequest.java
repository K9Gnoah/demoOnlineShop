package com.hoangmike.dto.request;

import lombok.*;
import lombok.experimental.FieldDefaults;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductCreationRequest {
    String productName;
    String productDescription;
    double productPrice;
    String productImage;
    boolean productStatus;
    int productQuantity;
    int categoryId;


}
