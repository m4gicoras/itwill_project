package com.m4gi.service;

import com.m4gi.dto.NotificationDTO;
import java.util.List;

public interface NotificationService {
    List<NotificationDTO> getNotifications(int userId);   // 알림 목록 조회
    int getUnreadCount(int userId);                       // 안 읽은 알림 개수
    void createNotification(int recipientId, String content);
    void markAsRead(int notificationId, int userId);
}
