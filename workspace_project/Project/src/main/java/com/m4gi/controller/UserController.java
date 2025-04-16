package com.m4gi.controller;

import com.m4gi.dto.MemberDTO;
import com.m4gi.dto.SiteUser;
import com.m4gi.service.MemberService;
import com.m4gi.service.UserService;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private MemberService memberService;

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

    @GetMapping("/find_id")
    public String showFindIDForm() {
        return "find_id";
    }

    // 아이디 찾기 처리
    @PostMapping("/find_id")
    public String findId(@RequestParam("email") String email, HttpSession session, Model model) {
        MemberDTO member = memberService.findByEmail(email);

        if (member != null) {
            String userId = member.getUserId();
            String maskedId = userId.substring(0, Math.min(4, userId.length())) + "****";

            session.setAttribute("userId", maskedId);

            return "redirect:/finish_id";
        } else {
            model.addAttribute("errorMessage", "인증에 실패하였습니다.");
            return "find_id";
        }
    }

    @GetMapping("/finish_id")
    public String showFinishid(HttpSession session, Model model) {

        String userId = (String) session.getAttribute("userId");

        if(userId != null) {
            model.addAttribute("userId", userId);
            return "finish_id";
        } else {
            return "redirect:/find_id";
        }
    }

    @GetMapping("/delete")
    public String showDeleteForm() {
        return "delete";
    }

    @GetMapping("/mainTest")
    public String showMainTestForm() {
        return "mainTest";
    }

    @GetMapping("/check")
    public String showCheckForm() {
        return "check";
    }

    @GetMapping("/clear")
    public String showClearForm() {
        return "clear";
    }

    @GetMapping("/find_pw")
    public String showFindPWForm() {
        return "find_pw";
    }

    @GetMapping("/find_pw2")
    public String showFindPW2Form() {
        return "find_pw2";
    }

    @GetMapping("/finish_pw")
    public String showFinishPWForm() {
        return "finish_pw";
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
