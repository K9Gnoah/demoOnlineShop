package com.hoangmike.repository;

import com.hoangmike.entity.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {
    @Query("SELECT b FROM Blog b WHERE b.title LIKE %?1% OR b.content LIKE %?1%")
    List<Blog> findByTitleContainingOrContentContaining(String searchTerm);
    Page<Blog> findByStatus(Pageable pageable, boolean status);
}
