package com.m4gi.mapper;

import java.util.List;

import com.m4gi.domain.Product;

public interface ProductMapper {
    void insertProduct(Product product); // product_id 자동생성
    void updateHashId(int productId, String hashId);
    
    List<Product> selectProductListByCompanyId(Integer companyId);

}
