package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminUserListDTO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminUserService {

    List<AdminUserListDTO> getCompanyList(int offset, int limit);
    int getTotalCompanyCount();
    Map<String, Object> getPagedCompanyList(int page, String keyword);
}
