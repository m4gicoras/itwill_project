package com.m4gi.dto;

import lombok.Data;

import java.util.Date;

@Data
public class SettlementDTO {
    private int settlementsId;   // 정산 고유 ID
    private int companyId;       // 기업 ID (정산 대상)
    private Integer incomeCost;  // 수입 금액 (nullable 가능성 있어서 Integer)
    private Integer expendCost;  // 지출 금액 (nullable 가능성 있어서 Integer)
    private int status;          // 0: 예정, 1: 완료
    private Date settlementsDate; // 정산 예정 일시 (결제 완료 후 갱신 가능)
    private Date createdAt;      // 정산 발생 일시

    private int estimateId;

}
