package com.m4gi.mapper;

import com.m4gi.domain.Notification;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NotificationMapper {
    void insertNotification(Notification notification); // 수정됨

    void insertRecipient(@Param("notificationId") int notificationId,
                         @Param("recipientId") int recipientId);
}
