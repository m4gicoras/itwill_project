package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;

import java.util.List;

public interface AdminProductService {

    AdminProductPageDTO getPagedProductList(int page);

}

