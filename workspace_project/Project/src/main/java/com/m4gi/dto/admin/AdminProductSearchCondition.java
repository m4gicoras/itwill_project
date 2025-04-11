package com.m4gi.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminProductSearchCondition {
    private String productName;
    private String companyName;
    private String productQty;
    private String sort;
    private String startDate;
    private String endDate;
}
