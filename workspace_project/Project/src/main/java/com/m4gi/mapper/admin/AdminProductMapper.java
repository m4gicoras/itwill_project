package com.m4gi.mapper.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminProductMapper {
    List<AdminProductListDTO> searchProductList(@Param("condition") AdminProductSearchCondition condition,
                                                @Param("limit") int limit,
                                                @Param("offset") int offset);

    int countProductList(@Param("condition") AdminProductSearchCondition condition);

    int getProductCount();
    List<AdminProductListDTO> getProductList(@Param("limit") int limit, @Param("offset") int offset);
    
    // 물품 상태 수정
    void updateProductStatus(@Param("list") List<Integer> productIds, @Param("status") int status);
}


