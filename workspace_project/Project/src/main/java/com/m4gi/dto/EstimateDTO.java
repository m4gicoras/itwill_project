// 1. EstimateDTO.java
package com.m4gi.dto;

import lombok.Data;

import java.util.Date;

@Data
public class EstimateDTO {
    private int estimateId;
    private int reqCompId;      // 요청 회사 ID
    private int resCompId;      // 응답 회사 ID
    private int productId;
    private int reqCost;        // 요청 단가
    private Integer offerCost;  // 제시 단가 (nullable)
    private int estimateQtty;
    private int status;
    private Date createdAt;
    private Date updatedAt;

    private String reqCompanyName;

    // 부가정보용 필드
    private String productName;
    private String requesterCompanyName;
    private String responderCompanyName;
}