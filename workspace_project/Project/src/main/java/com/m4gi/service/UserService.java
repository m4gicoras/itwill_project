package com.m4gi.service;

import com.m4gi.domain.User;
import com.m4gi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 로그인 기능: 사용자 아이디로 조회한 후 입력받은 비밀번호와 DB에 저장된 평문 비밀번호를 비교
     * @param username 사용자가 입력한 아이디
     * @param password 사용자가 입력한 비밀번호
     * @return 인증 성공 시 true, 실패 시 false
     */
    public boolean login(String username, String password) {
        User user = userMapper.selectUserByUsername(username);
        if (user != null) {
            return password.equals(user.getUser_pw());
        }
        return false;
    }
}
