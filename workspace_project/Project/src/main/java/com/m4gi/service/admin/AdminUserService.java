package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminUserListDTO;

import java.util.List;

public interface AdminUserService {
    List<AdminUserListDTO> getCompanyList(int offset, int limit);
    int getTotalCompanyCount();
}
