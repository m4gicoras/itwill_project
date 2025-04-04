package com.m4gi.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
    @GetMapping("/member")
    public String adminMember(){
        return "admin/member";
    }

}
