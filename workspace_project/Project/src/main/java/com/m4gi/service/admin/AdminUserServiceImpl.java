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

    //페이징 처리 & 검색창
    @Override
    public Map<String, Object> getPagedCompanyList(int page, String keyword) {
        int pageSize = 12;
        int offset = (page - 1) * pageSize;

        List<AdminUserListDTO> list;
        int totalCount;

        // 검색어 유무
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = adminUserMapper.searchCompanyList(keyword, offset, pageSize);
            totalCount = adminUserMapper.getSearchCompanyCount(keyword);
        } else {
            list = adminUserMapper.getCompanyList(offset, pageSize);
            totalCount = adminUserMapper.getTotalCompanyCount();
        }

        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        // 결과 Map에 담아 반환
        Map<String, Object> result = new HashMap<>();
        result.put("companyList", list);
        result.put("currentPage", page);
        result.put("totalPage", totalPage);

        return result;
    }
}
