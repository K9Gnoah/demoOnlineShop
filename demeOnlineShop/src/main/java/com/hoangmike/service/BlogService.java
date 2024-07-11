package com.hoangmike.service;

import com.hoangmike.entity.Blog;
import com.hoangmike.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {
    @Autowired
    private BlogRepository blogRepository;

    public List<Blog> searchBlogs(String searchTerm) {
        return blogRepository.findByTittleContainingOrContentContaining(searchTerm);
    }

    public List<Blog> getAllBlogs() {
        return blogRepository.findAll();
    }

    public Blog getBlogById(Long id) {
        return blogRepository.findById(id).orElse(null);
    }

    public void addBlog(Blog blog) {
        blogRepository.save(blog);
    }

    public void editBlog(Long id, Blog updatetedBlod) {
        Blog blog = blogRepository.findById(id).orElse(null);
        if (blog != null) {
            blog.setTittle(updatetedBlod.getTittle());
            blog.setContent(updatetedBlod.getContent());
            blog.setAuthor(updatetedBlod.getAuthor());
            blog.setUpdateAt(updatetedBlod.getUpdateAt());
            blog.setStatus(updatetedBlod.isStatus());
            blogRepository.save(blog);
        }
    }

    public void deleteBlog(Long id) {
        blogRepository.deleteById(id);
    }

    public void hideBlog(Long id) {
        Blog blog = blogRepository.findById(id).orElse(null);
        if (blog != null) {
            blog.setStatus(false);
            blogRepository.save(blog);
        }
    }
}
