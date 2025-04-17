package com.m4gi.service.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;
import com.m4gi.mapper.admin.AdminProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminProductServiceImpl implements AdminProductService {

    @Autowired
    private AdminProductMapper adminProductMapper;

    @Override
    public AdminProductPageDTO getPagedProductList(int page) {
        int limit = 12;
        int offset = (page - 1) * limit;
        List<AdminProductListDTO> list = adminProductMapper.getProductList(limit, offset);
        int total = adminProductMapper.getProductCount();
        int totalPages = (int) Math.ceil(total / (double) limit);

        return new AdminProductPageDTO(list, totalPages);


    }
    @Override
    public AdminProductPageDTO getProductList(AdminProductSearchCondition condition, int page) {
        int limit = 10;
        int offset = (page - 1) * limit;

        // 기본 정렬 설정
        if (condition.getSort() == null || condition.getSort().isBlank()) {
            condition.setSort("product_name_desc");
        }

        List<AdminProductListDTO> list = adminProductMapper.searchProductList(condition, limit, offset);
        int total = adminProductMapper.countProductList(condition);
        int totalPages = (int) Math.ceil(total / (double) limit);

        return new AdminProductPageDTO(list, totalPages);
    }
    
    // 물품 삭제
    @Override
    public int deleteProduct (int productId) throws Exception {
    	int result = adminProductMapper.deleteProduct(productId);
    	return result; // 삭제된 행 반환 (0:삭제 실패, 1이상:삭제 성공)
    }
    
    // 물품 개수 조정
    @Override
    public int updateProductQtty(int productId, int newQtty) throws Exception {
    	int result = adminProductMapper.updateProductQtty(productId, newQtty);
    	return result; // 수정된 행의 개수 반환
    }
}




