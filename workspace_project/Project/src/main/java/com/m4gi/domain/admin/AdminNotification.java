package com.m4gi.domain.admin;

import java.util.Date;

import lombok.Data;

@Data
public class AdminNotification {
	private int notification_id;     // 알림 ID
    private int recipient_id;        // 알림 받는 기업의 유저 ID (recipients 테이블)
    private String content;          // 알림 내용
    private String company_name;     // 받은 기업 이름 (users 테이블에서 join)
    private Date created_at;         // 생성 일자
}
