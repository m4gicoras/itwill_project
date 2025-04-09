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
        int pageSize = 12; //기업 12개씩 보여주기
        int offset = (page - 1) * pageSize;

        List<AdminUserListDTO> list = adminUserService.getCompanyList(offset, pageSize);
        int totalCount = adminUserService.getTotalCompanyCount();

        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        model.addAttribute("companyList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", totalPage);

        return "admin/member";
    }
}
