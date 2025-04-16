package com.m4gi.mapper;

import com.m4gi.domain.User;

public interface UserMapper {
    // 아이디 중복 체크: 반환 값이 0이면 중복 없음, 1 이상이면 중복된 아이디
    int isDuplicateUsername(String username);

    // 사용자 정보를 DB에 저장합니다.
    void insertUser(User user);
    
    User checkUsername(String username);

    int isExistEmail(String email);
}
