package com.m4gi.controller.admin;

import com.m4gi.dto.admin.AdminUserListDTO;
import com.m4gi.service.admin.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

    @Autowired
    private AdminUserService adminUserService;

    @GetMapping("/member")
    public String adminMember(Model model) {

        List<AdminUserListDTO> list = adminUserService.getCompanyList();

        // ✅ 콘솔 로그 찍기
        System.out.println("불러온 기업 수: " + list.size());
        for (AdminUserListDTO user : list) {
            System.out.println("기업명: " + user.getCompanyName());
        }

        model.addAttribute("companyList", list);
        return "admin/member";
    }
}

