package com.hoangmike.mapper;

import com.hoangmike.dto.request.BlogCreationRequest;
import com.hoangmike.dto.request.BlogUpdateRequest;
import com.hoangmike.dto.response.BlogResponse;
import com.hoangmike.entity.Blog;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface BlogMapper {
    void updateBlog(@MappingTarget Blog blog, BlogUpdateRequest request);
    Blog toBlog(BlogCreationRequest request);
    BlogResponse toBlogResponse(Blog blog);
}
