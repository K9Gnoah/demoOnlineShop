package com.hoangmike.controllerAPI;

import com.hoangmike.dto.response.ApiResponse;
import com.hoangmike.dto.request.BlogCreationRequest;
import com.hoangmike.dto.response.BlogResponse;
import com.hoangmike.entity.Blog;
import com.hoangmike.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/blogs")
public class BlogController {
    @Autowired
    private BlogService blogService;

    @PostMapping
    public ApiResponse<BlogResponse> createBlog(@RequestBody BlogCreationRequest request){
        ApiResponse<BlogResponse> apiResponse = new ApiResponse();
        BlogResponse response = blogService.createBlog(request);
        apiResponse.setResult(response);
        return apiResponse;
    }

    @GetMapping
    public List<Blog> getAllBlogs(){
        return blogService.getAllBlogs();
    }

    @GetMapping("/{id}")
    public Blog getBlogById(@PathVariable Long id){
        return blogService.getBlogById(id);
    }

    @DeleteMapping("/{id}")
    public String deleteBlog(@PathVariable("id") Long id){
        blogService.deleteBlog(id);
        return "delete blog success";
    }
}
