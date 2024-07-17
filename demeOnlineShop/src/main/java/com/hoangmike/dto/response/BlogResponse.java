package com.hoangmike.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BlogResponse {
    String title;
    String content;
    String author;
    String image;
    LocalDateTime createAt;
    boolean status;
    Long views = 0L;
}
