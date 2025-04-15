package com.m4gi.dto;

import java.util.Date;

// Data 안돼서 게터세터적음
public class OrderDTO {
    private int orderId;
    private String productName;
    private int orderQtty;
    private Date orderDate;
    private Date shipCompDate;
    private String companyName;
    private int status;

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getOrderQtty() { return orderQtty; }
    public void setOrderQtty(int orderQtty) { this.orderQtty = orderQtty; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public Date getShipCompDate() { return shipCompDate; }
    public void setShipCompDate(Date shipCompDate) { this.shipCompDate = shipCompDate; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
}
