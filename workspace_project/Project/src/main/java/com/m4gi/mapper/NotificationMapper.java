package com.m4gi.mapper;

import com.m4gi.dto.NotificationDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NotificationMapper {
    List<NotificationDTO> selectNotificationsByUserId(int userId);
    int countUnreadNotifications(int userId);
    void insertNotification(NotificationDTO notification);
    void insertRecipient(@Param("notificationId") int notificationId, @Param("recipientId") int recipientId);
    void markAsRead(@Param("notificationId") int notificationId, @Param("userId") int userId);

}
