package com.m4gi.dto;

import lombok.Data;

import java.util.Date;


@Data
public class NotificationDTO {
    private int notificationId;
    private String content;
    private Date createdAt;
    private boolean isRead;
}
