package com.m4gi.mapper;

import java.util.List;

import com.m4gi.domain.Product;

public interface ProductMapper {
    List<Product> selectProductsByCompany(int companyId);
    List<Product> selectProductsByCompanyAndStatus(int companyId, int status);
}
