package com.m4gi.dto;

public class SiteUser {
    private String username;
    private String password;
    private String passwordCheck;

    private String nickname;
    private String phone1; // 연락처 3개로 전달받음
    private String phone2;
    private String phone3;
    private String email;

    private String bizNum1;  // 사업자등록번호 3개로 전달
    private String bizNum2;
    private String bizNum3;       
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

    public String getPhone1() { return phone1; }
    public void setPhone1(String phone1) { this.phone1 = phone1; }
    public String getPhone2() { return phone2; }
    public void setPhone2(String phone2) { this.phone2 = phone2; }
    public String getPhone3() { return phone3; }
    public void setPhone3(String phone3) { this.phone3 = phone3; }


    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getBizNum1() { return bizNum1; }
    public void setBizNum1(String bizNum1) { this.bizNum1 = bizNum1; }
    public String getBizNum2() { return bizNum2; }
    public void setBizNum2(String bizNum2) { this.bizNum2 = bizNum2; }
    public String getBizNum3() { return bizNum3; }
    public void setBizNum3(String bizNum3) { this.bizNum3 = bizNum3; }

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
