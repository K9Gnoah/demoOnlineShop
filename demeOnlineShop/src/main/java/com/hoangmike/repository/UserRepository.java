package com.hoangmike.repository;

import aj.org.objectweb.asm.commons.Remapper;
import com.hoangmike.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    boolean existsByUserName(String userName);
    Optional<User> findByUserName(String userName);

//    User findByUserName(String username);
}
