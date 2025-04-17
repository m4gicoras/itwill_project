package com.m4gi.service;

import com.m4gi.dto.NotificationDTO;
import com.m4gi.mapper.NotificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
