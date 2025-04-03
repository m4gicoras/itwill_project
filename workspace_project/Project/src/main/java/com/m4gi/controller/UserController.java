package com.m4gi.controller;

import com.m4gi.dto.SiteUser;
import com.m4gi.service.UserService;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 회원가입 폼 페이지
    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";
    }

    // 회원가입 처리 (SiteUser만 전달)
    @PostMapping("/signup")
    public String handleSignup(@ModelAttribute SiteUser siteUser) {
        userService.register(siteUser);
        return "redirect:/main";
    }
   
    
    // 로그인 처리
    @PostMapping("/main")
    @ResponseBody
    public Map<String, String> login(@RequestParam("username") String username,
                                     @RequestParam("password") String password) {
        Map<String, String> response = new HashMap<>();
        // service의 login 메서드를 호출하여 로그인 여부 판단
        if (userService.login(username, password)) {
            response.put("message", "로그인 성공");
            response.put("messageType", "success-message");
        } else {
            response.put("message", "로그인 실패");
            response.put("messageType", "error-message");
        }
        return response;
    }
    
    @GetMapping("/isDuplicateUsername")
    @ResponseBody
    public String isDuplicateUsername(@RequestParam("username") String username) {
        int count = userService.isDuplicateUsername(username);
        // 로그로 확인
        System.out.println("중복 확인 요청: " + username + ", count: " + count);
        return String.valueOf(count);
    }
}
