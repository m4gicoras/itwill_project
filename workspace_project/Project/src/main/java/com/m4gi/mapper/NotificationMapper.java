package com.m4gi.mapper;

import com.m4gi.dto.NotificationDTO;
import java.util.List;

public interface NotificationMapper {
    List<NotificationDTO> selectNotificationsByUserId(int userId);
    int countUnreadNotifications(int userId);
}
