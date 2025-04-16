package com.m4gi.mapper.admin;

import java.util.List;

import com.m4gi.domain.admin.AdminNotification;

public interface AdminNotificationMapper {
	// 전체 알림 기록 조회
	List<AdminNotification> getNotificationList();
}
