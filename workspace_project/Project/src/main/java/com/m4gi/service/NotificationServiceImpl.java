package com.m4gi.service;

import com.m4gi.domain.Notification;
import com.m4gi.mapper.NotificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    private NotificationMapper notificationMapper;

    @Override
    public void createNotification(String content, int recipientId) {
        System.out.println("🔔 알림 생성 요청 들어옴!");
        Notification notification = new Notification();
        notification.setContent(content);

        notificationMapper.insertNotification(notification);
        System.out.println("✅ insert 후 notificationId: " + notification.getNotificationId());
        System.out.println("🟢 새로 생성된 ID: " + notification.getNotificationId());


        int notificationId = notification.getNotificationId();
        notificationMapper.insertRecipient(notificationId, recipientId);
        System.out.println("✅ recipient insert 완료 - recipientId: " + recipientId);
    }

}
