package com.m4gi.dto.admin;

import java.util.List;

public class AdminProductPageDTO {
    private List<AdminProductListDTO> productList;
    private int totalPages;

    public AdminProductPageDTO(List<AdminProductListDTO> productList, int totalPages) {
        this.productList = productList;
        this.totalPages = totalPages;
    }

    public List<AdminProductListDTO> getProductList() {
        return productList;
    }

    public int getTotalPages() {
        return totalPages;
    }
}
