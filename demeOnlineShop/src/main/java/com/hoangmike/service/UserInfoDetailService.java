package com.hoangmike.service;

import com.hoangmike.entity.User;
import com.hoangmike.mapper.UserToUserDetail;
import com.hoangmike.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class UserInfoDetailService implements UserDetailsService{
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = userRepository.findByUserName(username);
        return user.map(UserToUserDetail::new)
                .orElseThrow(() -> new UsernameNotFoundException("user not found: " + username));
    }
}
