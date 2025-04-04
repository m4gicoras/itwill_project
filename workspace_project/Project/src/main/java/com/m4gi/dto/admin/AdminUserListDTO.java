package com.m4gi.dto.admin;

import lombok.Data;

import java.util.Date;

@Data
public class AdminUserListDTO {
    private int userId;
    private String companyName;
    private String ceoName;
    private String phone;
    private String email;
    private Date regDate;
}
