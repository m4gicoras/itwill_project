package com.m4gi.controller.admin;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.m4gi.dto.admin.AdminNotificationListDTO;
import com.m4gi.service.admin.AdminNotificationService;

@Controller
@RequestMapping("/admin")
public class AdminNotificationController {
	
	@Inject
	private AdminNotificationService notiService;
	
    @GetMapping("/notification")
    public String adminNotification(){
        return "admin/notification";
    }
    
    @GetMapping("/notificationTable")
    public String adminNotificationTable(Model model) {
    	
    	List<AdminNotificationListDTO> notificationList = notiService.getNotificationList();
    	
    	model.addAttribute("notificationList", notificationList);
    	
        return "admin/notificationTable";
    }
}
