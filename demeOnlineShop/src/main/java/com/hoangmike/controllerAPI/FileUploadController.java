package com.hoangmike.controllerAPI;

import com.hoangmike.entity.User;
import com.hoangmike.repository.UserRepository;
import com.hoangmike.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api/files")
public class FileUploadController {
    @Autowired
    private UserRepository userRepository;

    @Value("${file.upload-dir}")
    private String uploadDir;

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "Please select a file to upload.";
        }

        try {
            byte[] bytes = file.getBytes();
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            Path filePath = uploadPath.resolve(file.getOriginalFilename());
            Files.write(filePath, bytes);

            // Debug log
            System.out.println("File saved at: " + filePath.toString());

            User user = CustomUserDetailsService.getCurrentUserEntity();
            user.setAvatar("/imagesUpload/" + file.getOriginalFilename());
            userRepository.save(user);

            return "File uploaded successfully: " + filePath.toString();
        } catch (IOException e) {
            e.printStackTrace();
            return "Failed to upload file.";
        }
    }
}
