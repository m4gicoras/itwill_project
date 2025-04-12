package com.m4gi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.m4gi.domain.User;
import com.m4gi.dto.admin.AdminUserListDTO;

public interface UserMapper {
    // 아이디 중복 체크: 반환 값이 0이면 중복 없음, 1 이상이면 중복된 아이디
    int isDuplicateUsername(String username);

    // 사용자 정보를 DB에 저장합니다.
    void insertUser(User user);

	User checkUsername(String username);
	
	User getUserByUsername(String username);
	
    List<AdminUserListDTO> getCompanyList(@Param("offset") int offset, @Param("limit") int limit);
    int getTotalCompanyCount();

    List<AdminUserListDTO> searchCompanyList(@Param("keyword") String keyword, @Param("offset") int offset, @Param("limit") int limit);
    int getSearchCompanyCount(@Param("keyword") String keyword);
    

}
