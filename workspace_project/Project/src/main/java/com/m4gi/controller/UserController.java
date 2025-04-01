package com.m4gi.controller;

import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;
import com.m4gi.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";  // signup.jsp 뷰 보여줌
    }

    @PostMapping("/signup")
    public String handleSignup(@ModelAttribute SiteUser siteUser) {
        // 1. 값이 잘 들어오는지 로그 확인
        System.out.println("아이디: " + siteUser.getUsername());
        System.out.println("이메일: " + siteUser.getEmail());
        System.out.println("주소: " + siteUser.getAddress() + " " + siteUser.getAddressDetail());

        // 2. TODO: 유효성 검사, DB 저장

        return "redirect:/main";  // 가입 성공 시 로그인완료 페이지가 없어서 일단 main
    }

    // 실제 서비스에서 DB 조회 - 해야하는데 구현하기 어려워서 일단 냅뒀어요
/*    @GetMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(@RequestParam String username) {
        User user = UserService.getUserByUsername(username);
        return (user != null) ? "duplicate" : "available";
    }*/

}
