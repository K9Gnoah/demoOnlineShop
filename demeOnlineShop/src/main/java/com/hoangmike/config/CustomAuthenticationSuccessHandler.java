package com.hoangmike.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;
import java.util.Collection;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        authorities.forEach(authority -> {
            if (authority.getAuthority().equals("ROLE_ADMIN")){
                try {
                    redirectStrategy.sendRedirect(request, response, "/adminDashBoard");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if(authority.getAuthority().equals("ROLE_CUSTOMER")) {
                try {
                    redirectStrategy.sendRedirect(request, response, "/common/showProduct");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if(authority.getAuthority().equals("ROLE_DELIVER")){
                try {
                    redirectStrategy.sendRedirect(request, response, "/deliver/listOrder");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if(authority.getAuthority().equals("ROLE_SALER")) {
                try {
                    redirectStrategy.sendRedirect(request, response, "/saler/productList");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if (authority.getAuthority().equals("ROLE_MARKETERS")) {
                try {
                    redirectStrategy.sendRedirect(request, response, "/marketer/blogManagement");
                } catch (IOException e) {
                    e.printStackTrace();
                }
        } else{
                    throw new IllegalStateException();
            }

        });
    }
}
