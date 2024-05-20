package com.hoangmike.api;

import com.hoangmike.dto.EmailDTO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmailAPI {

    @PostMapping("/api/email")
    public void sendEmail(@RequestBody EmailDTO emailDTO) {
        System.out.println("emailDTO");
    }

}
