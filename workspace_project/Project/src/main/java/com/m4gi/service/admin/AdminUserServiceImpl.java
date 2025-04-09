package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminUserListDTO;
import com.m4gi.mapper.admin.AdminUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public Map<String, Object> getPagedCompanyList(int page){
        int pageSize = 12;
        int offset = (page - 1) * pageSize;

        List<AdminUserListDTO> list = adminUserMapper.getCompanyList(offset, pageSize);
        int totalCount = adminUserMapper.getTotalCompanyCount();
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        Map<String, Object> result = new HashMap<>();
        result.put("companyList", list);
        result.put("currentPage", page);
        result.put("totalPage", totalPage);

        return result;
    }
}
