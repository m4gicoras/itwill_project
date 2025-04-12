package com.m4gi.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;

@Mapper
public interface AdminProductMapper {
    List<AdminProductListDTO> searchProductList(@Param("condition") AdminProductSearchCondition condition,
                                                @Param("limit") int limit,
                                                @Param("offset") int offset);

    int countProductList(@Param("condition") AdminProductSearchCondition condition);

    int getProductCount();
    List<AdminProductListDTO> getProductList(@Param("limit") int limit, @Param("offset") int offset);

}
