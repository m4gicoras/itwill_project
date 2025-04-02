package com.m4gi.domain;

import lombok.Data;
import java.util.Date;

@Data
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
}
