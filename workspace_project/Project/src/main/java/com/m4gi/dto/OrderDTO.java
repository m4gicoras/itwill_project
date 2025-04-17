package com.m4gi.dto;

import lombok.Data;

import java.util.Date;

@Data
public class OrderDTO {
    private int orderId;
    private String productName;
    private int orderQtty;
    private Date orderDate;
    private Date shipCompDate;
    private Date inboundDate; //입고완료일시
    private Date outboundDate; //출고완료일시
    private String companyName;
    private int status;

    private int companyId;
    private int BcompanyId;
}
