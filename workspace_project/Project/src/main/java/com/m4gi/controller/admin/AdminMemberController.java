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
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

    @Autowired
    private AdminUserService adminUserService;

    @GetMapping("/member")
    public String adminMember(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "", required = false) String keyword, // 검색어(keyword)도 받을 수 있음, 없으면 빈 문자열
            Model model // 뷰(JSP)로 데이터를 넘길 때 사용
    ) {
        // 서비스에서 페이징 + 검색 결과를 받아옴 (companyList, currentPage, totalPage 포함된 Map)
        Map<String, Object> result = adminUserService.getPagedCompanyList(page, keyword);

        // 받은 결과(Map)를 model에 한꺼번에 담음
        model.addAllAttributes(result);

        return "admin/member";
    }
}
