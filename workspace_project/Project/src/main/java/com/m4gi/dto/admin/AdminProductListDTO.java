package com.m4gi.dto.admin;

import lombok.Data;
import java.util.Date;

@Data
public class AdminProductListDTO {
    private int productId;
    private int companyId;
    private String productName;
    private int productQty;
    private Date createdAt;
    private int status;

    private String companyName; //회사명

}


