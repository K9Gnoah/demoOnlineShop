package com.hoangmike.entity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String tittle;

    @Lob
    String content;

    String author;

    LocalDateTime createAt;

    LocalDateTime updateAt;

    boolean status;





}
