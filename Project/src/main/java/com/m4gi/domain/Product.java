package com.m4gi.domain;

import lombok.Data;
import java.util.Date;

@Data
public class Product {
    private Integer productId;
    private Integer companyId;
    private String productName;
    private String productDesc;
    private String productImg;
    private Integer productQtty;
    private String category;
    private Integer price;
    private Integer status;
    private String hashId;
    private Date createdAt;
    private Date updatedAt;
}

