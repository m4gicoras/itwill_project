package com.m4gi.service;

import com.m4gi.dto.ShopProductDTO;

import java.util.List;

public interface ShopProductService {
    List<ShopProductDTO> getOtherCompanyProducts(Integer myCompanyId);  // 기업 제외 상품 조회
    ShopProductDTO getProductById(int productId);
    List<ShopProductDTO> getProductsByCategory(Integer myCompanyId, String category); // 상품 상세 조회
    List<ShopProductDTO> searchProducts(Integer myCompanyId, String keyword);


}
