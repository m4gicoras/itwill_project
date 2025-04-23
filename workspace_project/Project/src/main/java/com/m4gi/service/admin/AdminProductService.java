package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;

import java.util.List;

public interface AdminProductService {

    AdminProductPageDTO getPagedProductList(int page);
    AdminProductPageDTO getProductList(AdminProductSearchCondition condition, int page);
    
    // 물품 상태 변경
    void updateProductStatus(List<Integer> productIds, int newStatus);
}

