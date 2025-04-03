package com.m4gi.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminNotificationController {
    @GetMapping("/notification")
    public String adminNotification(){
        return "admin/notification";
    }
}
