package com.m4gi.dto;

import lombok.Data;

import java.util.Date;

@Data
public class PaymentDTO {
    private int paymentId;
    private int estimateId;
    private int orderId;         // 추후 주문 연동 시
    private int paymentCost;     // 단가 * 수량
    private int paymentComm;     // 수수료
    private int totalCost;       // 총액 (단가 * 수량 + 수수료)
    private Date paymentDate;
    private int status;          // 0: 결제 대기, 1: 결제 완료
}
