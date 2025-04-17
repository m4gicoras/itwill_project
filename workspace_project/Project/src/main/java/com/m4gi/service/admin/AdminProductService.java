package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;

import java.util.List;

public interface AdminProductService {

    AdminProductPageDTO getPagedProductList(int page);
    AdminProductPageDTO getProductList(AdminProductSearchCondition condition, int page);
    
    // 물품 삭제
    int deleteProduct(int productId) throws Exception;
    
    // 물품 조정
    int updateProductQtty(int productId, int newQtty) throws Exception;
}

