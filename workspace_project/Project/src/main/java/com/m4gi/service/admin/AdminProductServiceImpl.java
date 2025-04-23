package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;
import com.m4gi.mapper.admin.AdminProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminProductServiceImpl implements AdminProductService {

    @Autowired
    private AdminProductMapper adminProductMapper;

    @Override
    public AdminProductPageDTO getPagedProductList(int page) {
        int limit = 12;
        int offset = (page - 1) * limit;
        List<AdminProductListDTO> list = adminProductMapper.getProductList(limit, offset);
        int total = adminProductMapper.getProductCount();
        int totalPages = (int) Math.ceil(total / (double) limit);

        return new AdminProductPageDTO(list, totalPages);


    }
    @Override
    public AdminProductPageDTO getProductList(AdminProductSearchCondition condition, int page) {
        int limit = 10;
        int offset = (page - 1) * limit;

        // 기본 정렬 설정
        if (condition.getSort() == null || condition.getSort().isBlank()) {
            condition.setSort("product_name_desc");
        }

        List<AdminProductListDTO> list = adminProductMapper.searchProductList(condition, limit, offset);
        int total = adminProductMapper.countProductList(condition);
        int totalPages = (int) Math.ceil(total / (double) limit);

        return new AdminProductPageDTO(list, totalPages);
    }
    
    // 물품 상태 변경
    @Override
    public void updateProductStatus(List<Integer> productIds, int newStatus) {
    	adminProductMapper.updateProductStatus(productIds, newStatus);
    }
}




