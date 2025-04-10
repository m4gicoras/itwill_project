package com.m4gi.service;

import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;

public interface UserService {

    // 회원가입 기능
    public void register(SiteUser siteUser);

    // 로그인 로직
    public boolean login(String username, String password);
    
    public int isDuplicateUsername(String username);
    
    // 객체 조회용
    User getUserByUsername(String username);
}
