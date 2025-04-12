package com.m4gi.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.m4gi.domain.admin.AdminUser;
import com.m4gi.dto.admin.AdminUserListDTO;

public interface AdminUserMapper {

    List<AdminUserListDTO> getAllCompanies();

    // 검색 리스트
    List<AdminUserListDTO> searchCompanyList(@Param("keyword") String keyword, @Param("offset") int offset, @Param("limit") int limit);

    // 검색 총 개수
    int getSearchCompanyCount(@Param("keyword") String keyword);

    // 일반 리스트 (페이징용)
    List<AdminUserListDTO> getCompanyList(@Param("offset") int offset, @Param("limit") int limit);

    // 일반 총 개수
    int getTotalCompanyCount();

    //같이한날
    AdminUser getUserById(int userId);


}
