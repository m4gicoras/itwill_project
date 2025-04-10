package com.m4gi.mapper;

import java.util.List;

import com.m4gi.domain.Product;

public interface ProductMapper {
    List<Product> selectProductsByCompany(Integer companyId);
    List<Product> selectProductsByCompanyAndStatus(Integer companyId, Integer status);
}
