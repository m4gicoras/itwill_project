package com.m4gi.controller;

import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;
import com.m4gi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService; // ✅ 필드 주입 추가

    // [GET] 회원가입 폼 페이지 요청 시
    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";  // → signup.jsp 페이지 반환
    }

    // [POST] 회원가입 폼 제출 시
    @PostMapping("/signup")
    public String handleSignup(@ModelAttribute SiteUser siteUser,
                               @RequestParam("phone1") String phone1,
                               @RequestParam("phone2") String phone2,
                               @RequestParam("phone3") String phone3,
                               @RequestParam("bizNum1") String bizNum1,
                               @RequestParam("bizNum2") String bizNum2,
                               @RequestParam("bizNum3") String bizNum3) {

        // 👇 연락처와 사업자번호 합치기
        siteUser.setPhone(phone1 + "-" + phone2 + "-" + phone3);
        siteUser.setBizNumber(bizNum1 + "-" + bizNum2 + "-" + bizNum3);

        // 📌 디버깅 출력
        System.out.println("아이디: " + siteUser.getUsername());
        System.out.println("이메일: " + siteUser.getEmail());
        System.out.println("주소: " + siteUser.getAddress() + " " + siteUser.getAddressDetail());
        System.out.println("연락처: " + siteUser.getPhone());
        System.out.println("사업자번호: " + siteUser.getBizNumber());

        // 회원가입 처리
        userService.register(siteUser);

        return "redirect:/main";
    }

    /*
    @GetMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(@RequestParam String username) {
        User user = userService.getUserByUsername(username);
        return (user != null) ? "duplicate" : "available";
    }
    */
}
