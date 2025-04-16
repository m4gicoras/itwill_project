package com.m4gi.service.admin;

import java.util.List;

import com.m4gi.dto.admin.AdminNotificationListDTO;

public interface AdminNotificationService {
    public List<AdminNotificationListDTO> getNotificationList();
}
