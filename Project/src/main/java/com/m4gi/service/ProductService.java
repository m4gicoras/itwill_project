package com.m4gi.service;

import java.util.List;

import com.m4gi.domain.Product;

public interface ProductService {
    List<Product> getProductsByCompany(Integer companyId);
    List<Product> getProductsByCompanyAndStatus(Integer companyId, Integer status);
}
