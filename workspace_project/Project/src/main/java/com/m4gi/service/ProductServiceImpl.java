package com.m4gi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m4gi.domain.Product;
import com.m4gi.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> getProductsByCompany(int companyId) {
        return productMapper.selectProductsByCompany(companyId);
    }

    @Override
    public List<Product> getProductsByCompanyAndStatus(int companyId, int status) {
        return productMapper.selectProductsByCompanyAndStatus(companyId, status);
    }
    
   
}
