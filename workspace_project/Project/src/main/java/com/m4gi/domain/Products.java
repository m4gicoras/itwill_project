package com.m4gi.domain;

import lombok.Data;
import java.util.Date;

@Data
public class Products {
    private int productId;         // 제품 고유 번호 (PK)
    private int companyId;         // 제품을 등록한 회사의 ID
    private String productName;    // 제품 이름
    private String productDesc;    // 제품 설명
    private String productImg;     // 제품 이미지 URL
    private int productQtty;       // 제품 수량
    private String category;       // 제품 카테고리
    private int price;             // 제품 가격
    private int status;            // 제품 상태 (예: 0=정상, 1=재고없음, 2=단종 등)
    private Date createdAt;        // 제품 등록일자
    private Date updatedAt;        // 제품 수정일자
}

