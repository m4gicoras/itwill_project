package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminUserListDTO;
import com.m4gi.mapper.admin.AdminUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private AdminUserMapper adminUserMapper;

    @Override
    public List<AdminUserListDTO> getCompanyList(int offset, int limit) {
        return adminUserMapper.getCompanyList(offset, limit);
    }

    @Override
    public int getTotalCompanyCount() {
        return adminUserMapper.getTotalCompanyCount();
    }
}
