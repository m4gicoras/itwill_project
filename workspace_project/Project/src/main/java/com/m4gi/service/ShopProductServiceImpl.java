package com.m4gi.service;

import com.m4gi.dto.ShopProductDTO;
import com.m4gi.mapper.ShopProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopProductServiceImpl implements ShopProductService {

    @Autowired
    private ShopProductMapper shopProductMapper;

    @Override
    public List<ShopProductDTO> getOtherCompanyProducts(Integer myCompanyId) {
        return shopProductMapper.selectProductsExcludeMyCompany(myCompanyId);
    }
    @Override
    public ShopProductDTO getProductById(int productId) {
        return shopProductMapper.selectProductById(productId);
    }

    @Override
    public List<ShopProductDTO> getProductsByCategory(Integer myCompanyId, String category) {
        return shopProductMapper.selectProductsByCategory(myCompanyId, category);
    }
    @Override
    public List<ShopProductDTO> searchProducts(Integer myCompanyId, String keyword) {
        return shopProductMapper.searchProducts(myCompanyId, "%" + keyword + "%");
    }

}
