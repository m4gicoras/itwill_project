package com.m4gi.controller.admin;

import com.m4gi.dto.admin.AdminUserListDTO;
import com.m4gi.service.admin.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

    @Autowired
    private AdminUserService adminUserService;

    @GetMapping("/member")
    public String adminMember(@RequestParam(defaultValue = "1") int page, Model model) {
        model.addAllAttributes(adminUserService.getPagedCompanyList(page));
        return "admin/member";
    }
}
