package com.m4gi.domain;

import lombok.Data;
import java.util.Date;

@Data
public class Product {
    private int product_id;       // 물품 고유번호
    private int company_id;		  // 회사(기업) id
    private String product_name;  // 물품명
    private String product_desc;  // 물품 설명
    private String product_img;   // 물품에 연결된 이미지url
    private int product_qtty;	  // 물품 수량
    private String category;	  // 물품의 카테고리
    private int price;			  // 물품의 단가
    private int status;			  // 물품 상태
    private Date created_at;	  // 물품 등록일시
    private Date updated_at;	  // 물품 마지막 업데이트 일시
}

