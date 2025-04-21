package com.m4gi.mapper;

import com.m4gi.dto.ShopProductDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ShopProductMapper {
    List<ShopProductDTO> selectProductsExcludeMyCompany(Integer myCompanyId);
    ShopProductDTO selectProductById(int productId);
    List<ShopProductDTO> selectProductsByCategory(@Param("myCompanyId") int myCompanyId,
                                                  @Param("category") String category);
    List<ShopProductDTO> searchProducts(@Param("myCompanyId") Integer myCompanyId,
                                        @Param("keyword") String keyword);



}

