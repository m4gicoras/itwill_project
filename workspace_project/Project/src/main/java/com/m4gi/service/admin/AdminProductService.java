package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;

public interface AdminProductService {

    AdminProductPageDTO getPagedProductList(int page);
    AdminProductPageDTO getProductList(AdminProductSearchCondition condition, int page);

}
