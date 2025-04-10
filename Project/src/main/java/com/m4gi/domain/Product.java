package com.m4gi.domain;

import lombok.Data;
import java.util.Date;

@Data
public class Product {
    private int product_id;
    private int company_id;
    private String product_name;
    private String product_desc;
    private String product_img;
    private int product_qtty;
    private String category;
    private int price;
    private int status;
    private Date created_at;
    private Date updated_at;
}

