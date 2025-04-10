package com.m4gi.service;

import java.util.List;

import com.m4gi.domain.Product;

public interface ProductService {
    List<Product> getProductsByCompany(int companyId);
    List<Product> getProductsByCompanyAndStatus(int companyId, int status);
}
