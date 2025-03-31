package com.m4gi.domain;

import java.util.Date;

public class User {
    private Integer userId;
    private String username;
    private String user_pw;
    private String nickname;
    private String user_img;
    private String email;
    private String phone;
    private String breg_num;
    private String company_name;
    private String master_name;
    private String company_addr;
    private Date reg_date;

    public User() {}

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getUser_pw() {
        return user_pw;
    }
    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }

    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUser_img() {
        return user_img;
    }
    public void setUser_img(String user_img) {
        this.user_img = user_img;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBreg_num() {
        return breg_num;
    }
    public void setBreg_num(String breg_num) {
        this.breg_num = breg_num;
    }

    public String getCompany_name() {
        return company_name;
    }
    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getMaster_name() {
        return master_name;
    }
    public void setMaster_name(String master_name) {
        this.master_name = master_name;
    }

    public String getCompany_addr() {
        return company_addr;
    }
    public void setCompany_addr(String company_addr) {
        this.company_addr = company_addr;
    }

    public Date getReg_date() {
        return reg_date;
    }
    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
