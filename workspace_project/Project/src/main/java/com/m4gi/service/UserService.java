package com.m4gi.service;

import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;

import java.util.List;

public interface UserService {
    // 회원가입 기능
    public void register(SiteUser siteUser);
    // 로그인 로직
    public boolean login(String username, String password);
    
    public int isDuplicateUsername(String username);

    public User checkUsername(String username);

    public User findByEmail(String email);

    public int isExistEmail(String email);

    public List<Products> getProductsByUser(User user);

    public boolean resetPassword(String username, String password);
}
