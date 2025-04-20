package com.m4gi.mapper;

import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.dto.admin.AdminUserListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    // 아이디 중복 체크: 반환 값이 0이면 중복 없음, 1 이상이면 중복된 아이디
    int isDuplicateUsername(String username);

    // 사용자 정보를 DB에 저장합니다.
    void insertUser(User user);
    
    User checkUsername(String username);

    User findByEmail(String username);

    int isExistEmail(String email);

    List<AdminUserListDTO> getCompanyList(@Param("offset") int offset, @Param("limit") int limit);
    int getTotalCompanyCount();

    List<AdminUserListDTO> searchCompanyList(@Param("keyword") String keyword, @Param("offset") int offset, @Param("limit") int limit);
    int getSearchCompanyCount(@Param("keyword") String keyword);

    List<Products> showProductList(User user);

    int updatePassword(@Param("username") String username, @Param("newPassword") String newPassword);

    int insertProduct(Products product);

}
