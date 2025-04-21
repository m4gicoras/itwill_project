package com.m4gi.domain;

import lombok.Data;
import java.util.Date;

@Data
public class User {
    private Integer userId;
    private String username;
    private String userPw;
    private String nickname;
    private String userImg;
    private String email;
    private String phone;
    private String bregNum;
    private String companyName;
    private String masterName;
    private String companyAddr;
    private String companyPhone;
    private String productCategory;
    private Date regDate;
}
