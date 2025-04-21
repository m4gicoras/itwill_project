package com.m4gi.dto;

import lombok.Data;
import java.util.Date;

@Data
public class ShopProductDTO {
    private int productId;            // 물품 고유번호
    private int companyId;            // 기업 ID (Users.user_id)
    private String productName;       // 상품명
    private String productDesc;       // 상품 설명 (nullable)
    private String productImg;        // 이미지 URL (nullable)
    private int productQtty;          // 수량 (0 이상)
    private String category;          // 카테고리
    private int price;                // 가격 (0 이상)
    private int status;               // 상태 (0~3)
    private Date createdAt;           // 등록 일시
    private Date updatedAt;           // 마지막 수정 일시

    // 추가적으로 쇼핑몰에서 회사 이름 보여주기 위해 join한 필드
    private String companyName;       // 회사 이름 (Users.company_name)
}
