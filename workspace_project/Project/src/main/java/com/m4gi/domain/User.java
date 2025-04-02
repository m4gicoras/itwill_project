package com.m4gi.domain;

import java.util.Date;

public class User {
    private Integer userId;           // 유저 고유 ID (자동 생성)
    private String username;          // 아이디
    private String user_pw;           // 비밀번호
    private String nickname;          // 닉네임
    private String user_img;          // 프로필 이미지 (선택사항)
    private String email;             // 이메일
    private String phone;             // 연락처 (ex. 010-1234-5678)
    private String breg_num;          // 사업자 등록번호 (ex. 123-45-67890)
    private String company_name;      // 회사명 (상호명)
    private String master_name;       // 대표자 이름
    private String company_addr;      // 회사 주소 (기본 + 상세주소 합친 것)
    private String company_phone;     // 대표 전화 (추가됨)
    private String product_category;  // 상품 카테고리 (추가됨)
    private Date reg_date;            // 가입일 (자동 생성)

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

    public String getCompany_phone() {
        return company_phone;
    }
    public void setCompany_phone(String company_phone) {
        this.company_phone = company_phone;
    }

    public String getProduct_category() {
        return product_category;
    }
    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public Date getReg_date() {
        return reg_date;
    }
    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
