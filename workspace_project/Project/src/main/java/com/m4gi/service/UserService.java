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
     * 회원가입 기능: SiteUser → User 변환 후 DB 저장
     */
    public void register(SiteUser siteUser) {
        User user = new User();

        // 기본 정보
        user.setUsername(siteUser.getUsername());
        user.setUser_pw(siteUser.getPassword());
        user.setNickname(siteUser.getNickname());
        user.setEmail(siteUser.getEmail());

        // 연락처 조합
        String phone = siteUser.getPhone1() + "-" + siteUser.getPhone2() + "-" + siteUser.getPhone3();
        user.setPhone(phone);

        // 사업자등록번호 조합
        String bizNum = siteUser.getBizNum1() + "-" + siteUser.getBizNum2() + "-" + siteUser.getBizNum3();
        user.setBreg_num(bizNum);

        // 회사 정보
        user.setCompany_name(siteUser.getCompanyName());
        user.setMaster_name(siteUser.getCeoName());
        user.setCompany_addr(siteUser.getAddress() + " " + siteUser.getAddressDetail());

        userMapper.insertUser(user);
        System.out.println("✅ 회원가입 성공! DB 저장 완료됨!");
    }

    // 로그인 로직
    public boolean login(String username, String password) {
        User user = userMapper.selectUserByUsername(username);
        return user != null && password.equals(user.getUser_pw());
    }
}
