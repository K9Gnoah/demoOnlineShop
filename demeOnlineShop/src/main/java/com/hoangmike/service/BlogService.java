package com.hoangmike.service;

import com.hoangmike.dto.request.BlogCreationRequest;
import com.hoangmike.dto.request.BlogUpdateRequest;
import com.hoangmike.dto.response.BlogResponse;
import com.hoangmike.entity.Blog;
import com.hoangmike.entity.User;
import com.hoangmike.exception.AppException;
import com.hoangmike.exception.ErrorCode;
import com.hoangmike.mapper.BlogMapper;
import com.hoangmike.repository.BlogRepository;
import com.hoangmike.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class BlogService {
    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    private ProductRepository productRepository;

    public Blog saveBlog(Blog blog){
        return blogRepository.save(blog);
    }

    public List<Blog> searchBlogs(String searchTerm) {
        return blogRepository.findByTitleContainingOrContentContaining(searchTerm);
    }

    public List<Blog> getAllBlogs() {
        return blogRepository.findAll();
    }

    public Blog getBlogById(Long id) {
        return blogRepository.findById(id).orElse(null);
    }

    public BlogResponse createBlog(BlogCreationRequest request) {
        request.setCreateAt(LocalDateTime.now());
        request.setStatus(false);
        Blog blog = blogMapper.toBlog(request);
        blog = blogRepository.save(blog);
        return blogMapper.toBlogResponse(blog);
    }

    public Blog updateBlog(int blogId, BlogUpdateRequest request) {
        Blog blog = blogRepository.findById(Long.valueOf(blogId)).orElseThrow(() -> new AppException(ErrorCode.BLOG_NOT_FOUND));

        blog.setTitle(request.getTitle());
        blog.setContent(request.getContent());
        blog.setStatus(request.isStatus());
        blog.setUpdateAt(LocalDateTime.now());
        return blogRepository.save(blog);

    }

    public Blog findBlogById(Long id) {
        return blogRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BLOG_NOT_FOUND));
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

    public Blog incrementBlogViews (Long id){
        Blog blog = blogRepository.findById(id).orElse(null);
        if(blog != null){
            blog.setViews(blog.getViews() + 1);
            blogRepository.save(blog);
        }
        return blog;
    }

    public Page<Blog> findActiveBlogPag(int page, int size){
        return blogRepository.findByStatus(PageRequest.of(page, size), true);
    }

    public BlogResponse getBlogById(int id){
        return blogMapper.toBlogResponse(blogRepository.findById((long) id)
                .orElseThrow(() -> new AppException(ErrorCode.BLOG_NOT_FOUND)));
    }

}
