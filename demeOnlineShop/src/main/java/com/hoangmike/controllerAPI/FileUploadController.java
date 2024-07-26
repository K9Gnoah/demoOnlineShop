package com.hoangmike.controllerAPI;

import com.hoangmike.entity.Blog;
import com.hoangmike.entity.User;
import com.hoangmike.repository.BlogRepository;
import com.hoangmike.repository.UserRepository;
import com.hoangmike.service.BlogService;
import com.hoangmike.service.CustomUserDetailsService;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api/files")
public class FileUploadController {
    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
    //    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private ServletContext servletContext;
//
//    @Value("${file.upload-dir}")
//    private String uploadDir;
//
//    @PostMapping("/upload")
//    public String uploadFile(@RequestParam("file") MultipartFile file) {
//        if (file.isEmpty()) {
//            return "Please select a file to upload.";
//        }
//
//        try {
//            byte[] bytes = file.getBytes();
//
//            // Get the absolute path to the upload directory in the webapp context
//            String realPath = servletContext.getRealPath(uploadDir);
//            Path uploadPath = Paths.get(realPath);
//
//            if (!Files.exists(uploadPath)) {
//                Files.createDirectories(uploadPath);
//            }
//            Path filePath = uploadPath.resolve(file.getOriginalFilename());
//            Files.write(filePath, bytes);
//
//            // Debug log
//            System.out.println("File saved at: " + filePath.toString());
//
//            User user = CustomUserDetailsService.getCurrentUserEntity();
//            user.setAvatar("/imagesUpload/" + file.getOriginalFilename());
//            userRepository.save(user);
//
//            return "File uploaded successfully: " + filePath.toString();
//        } catch (IOException e) {
//            e.printStackTrace();
//            return "Failed to upload file.";
//        }
//    }
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BlogRepository blogRepository;

    @Value("${file.upload-dir}")
    private String uploadDir;
    @Autowired
    private BlogService blogService;

    @PostMapping("/uploadAvatar")
    public String uploadAvatar(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "Please select a file to upload.";
        }

        try {
            byte[] bytes = file.getBytes();

            // Get the absolute path to the upload directory in the project context
            Path projectDir = Paths.get("").toAbsolutePath();
            Path uploadPath = projectDir.resolve(uploadDir);

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

    @PostMapping("/uploadBlogImg/{id}")
    public String uploadBlogImg(@RequestParam("file") MultipartFile file, @PathVariable Long id) {
        logger.info("Attempting to upload file for blog ID: {}", id);

        if (file.isEmpty()) {
            logger.warn("Failed to upload file for blog ID {}: File is empty", id);
            return "Please select a file to upload.";
        }

        try {
            byte[] bytes = file.getBytes();
            Path projectDir = Paths.get("").toAbsolutePath();
            Path uploadPath = projectDir.resolve(uploadDir);

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            Path filePath = uploadPath.resolve(file.getOriginalFilename());
            Files.write(filePath, bytes);

            System.out.println("File saved at: " + filePath.toString());

            Blog blog = blogService.getBlogById(id);
            if (blog != null) {
                blog.setImage("/imagesUpload/" + file.getOriginalFilename());
                blogRepository.save(blog);
                logger.info("Blog updated successfully with image path: {}", blog.getImage());
                return"File uploaded successfully: " + filePath.toString();
            } else {
                logger.warn("Blog not found with ID: {}", id);
                return "Blog not found.";
            }
        } catch (IOException e) {
            logger.error("Failed to upload file for blog ID {}: ", id, e);
            return "Failed to upload file.";
        }
    }
}
