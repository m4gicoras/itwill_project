package com.m4gi.controller;

import com.m4gi.dto.NotificationDTO;
import com.m4gi.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/notification")
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    @GetMapping("/list")
    public String showNotificationList(HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId"); // 로그인 사용자 ID
        List<NotificationDTO> list = notificationService.getNotifications(userId);
        model.addAttribute("notificationList", list);
        return "notification"; // notification.jsp
    }
    @PostMapping("/read")
    @ResponseBody
    public void markNotificationAsRead(@RequestParam("notificationId") int notificationId, HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        notificationService.markAsRead(notificationId, userId);
    }
}
