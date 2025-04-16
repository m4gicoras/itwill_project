package com.m4gi.dto.admin;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AdminNotificationListDTO {
	private int notification_id;			// 알림 ID
	private String content;					// 알림 내용
	private List<String> company_names;		// 받은 기업 이름들
	private Date created_at;				// 생성 일자
}	
