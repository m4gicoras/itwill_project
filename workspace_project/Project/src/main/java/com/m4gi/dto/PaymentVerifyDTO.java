package com.m4gi.dto;

import lombok.Data;

@Data
public class PaymentVerifyDTO {
    private String impUid;
    private String merchantUid;
    private int amount;
    private String productName;
    private int settlementsId;
    private int estimateId;
}

