package com.m4gi.dto;

import lombok.Data;

@Data
public class SiteUser {
    private String username;
    private String password;
    private String passwordCheck;

    private String nickname;
    private String phone1;
    private String phone2;
    private String phone3;
    private String email;

    private String bizNum1;
    private String bizNum2;
    private String bizNum3;

    private String companyName;
    private String ceoName;
    private String companyPhone;

    private String address;
    private String addressDetail;

    private String category;
}
