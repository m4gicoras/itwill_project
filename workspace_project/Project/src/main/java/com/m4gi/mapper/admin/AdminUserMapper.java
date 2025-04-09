package com.m4gi.mapper.admin;

import com.m4gi.dto.admin.AdminUserListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminUserMapper {
    List<AdminUserListDTO> getAllCompanies();


    List<AdminUserListDTO> getCompanyList(@Param("offset") int offset, @Param("limit") int limit);
    int getTotalCompanyCount();
}