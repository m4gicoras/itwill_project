package com.m4gi.mapper.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminProductMapper {
    List<AdminProductListDTO> getProductList(@Param("limit") int limit, @Param("offset") int offset);
    int getProductCount();

}


