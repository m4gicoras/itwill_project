package com.m4gi.service;

import java.util.List;

import com.m4gi.domain.Product;
import com.m4gi.dto.ProductDTO;


public interface ProductService {

    // 상품등록 기능(회사ID는 로그인 세션에서 받아옴)
    void registerProduct(ProductDTO productDTO, Integer companyId);
    
    List<Product> getProductListByCompany(Integer companyId);

    
}

