package com.m4gi.dto;

public class SiteUser {
    private String username;
    private String password;
    private String passwordCheck;

    private String nickname;
    private String phone;
    private String email;

    private String bizNumber;       // 사업자등록번호
    private String companyName;     // 상호명
    private String ceoName;         // 대표자명
    private String companyPhone;    // 대표 전화
    private String address;         // 기본 주소
    private String addressDetail;   // 상세 주소

    private String category;        // 카테고리 선택

    // Getter & Setter
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPasswordCheck() { return passwordCheck; }
    public void setPasswordCheck(String passwordCheck) { this.passwordCheck = passwordCheck; }

    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getBizNumber() { return bizNumber; }
    public void setBizNumber(String bizNumber) { this.bizNumber = bizNumber; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getCeoName() { return ceoName; }
    public void setCeoName(String ceoName) { this.ceoName = ceoName; }

    public String getCompanyPhone() { return companyPhone; }
    public void setCompanyPhone(String companyPhone) { this.companyPhone = companyPhone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getAddressDetail() { return addressDetail; }
    public void setAddressDetail(String addressDetail) { this.addressDetail = addressDetail; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}
