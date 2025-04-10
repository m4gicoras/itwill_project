package com.m4gi.domain.admin;

import lombok.Data;

import java.util.Date;

@Data
public class AdminUser {
    private int userId;
    private String username;
    private String password;
    private String nickname;
    private String userImg;
    private String email;
    private String phone;
    private String bregNum; // 사업자등록번호
    private String companyName;
    private String masterName; // 대표자명
    private String companyAddr;
    private String companyPhone;
    private String productCategory;
    private Date regDate;

}
