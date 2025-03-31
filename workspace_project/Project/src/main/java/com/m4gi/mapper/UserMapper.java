package com.m4gi.mapper;

import com.m4gi.domain.User;

public interface UserMapper {
    // username을 이용해 사용자 정보를 조회합니다.
    User selectUserByUsername(String username);
}
