package com.m4gi.service;

import com.m4gi.dto.NotificationDTO;
import com.m4gi.mapper.NotificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    private NotificationMapper notificationMapper;

    @Override
    public List<NotificationDTO> getNotifications(int userId) {
        return notificationMapper.selectNotificationsByUserId(userId);
    }

    @Override
    public int getUnreadCount(int userId) {
        return notificationMapper.countUnreadNotifications(userId);
    }

    @Override
    public void createNotification(int recipientId, String content) {
        NotificationDTO noti = new NotificationDTO();
        noti.setContent(content);
        noti.setCreatedAt(new Date()); // java.util.Date로 바꿔줌

        notificationMapper.insertNotification(noti);
        notificationMapper.insertRecipient(noti.getNotificationId(), recipientId);
    }
    @Override
    public void markAsRead(int notificationId, int userId) {
        notificationMapper.markAsRead(notificationId, userId);
    }
}
