package com.m4gi.mapper.admin;

import com.m4gi.dto.admin.AdminUserListDTO;

import java.util.List;

public interface AdminUserMapper {
    List<AdminUserListDTO> getAllCompanies();
}