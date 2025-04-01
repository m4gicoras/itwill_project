package com.m4gi.service;

import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;
import com.m4gi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * [🆕] 회원가입 기능: SiteUser → User 변환 후 DB 저장
     */
    public void register(SiteUser siteUser) {
        User user = new User();

        user.setUsername(siteUser.getUsername());
        user.setUser_pw(siteUser.getPassword()); // password → user_pw
        user.setNickname(siteUser.getNickname());
        user.setEmail(siteUser.getEmail());
        user.setPhone(siteUser.getPhone());

        user.setBreg_num(siteUser.getBizNumber());
        user.setCompany_name(siteUser.getCompanyName());
        user.setMaster_name(siteUser.getCeoName());
        user.setCompany_addr(siteUser.getAddress() + " " + siteUser.getAddressDetail());

        userMapper.insertUser(user); // DB 저장!
        System.out.println("✅ 회원가입 성공! DB 저장 완료됨!");
    }

    // 기존 로그인 로직 그대로 유지
    public boolean login(String username, String password) {
        User user = userMapper.selectUserByUsername(username);
        return user != null && password.equals(user.getUser_pw());
    }
}
