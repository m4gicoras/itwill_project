package com.m4gi.controller;

import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;
import com.m4gi.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

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

    // 대시보드 페이지
    @GetMapping("/dashboard")
    public String showDashBoard(Model model, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");

        User user = new User();
        user.setUserId(userId);

        List<Products> productList = userService.getProductsByUser(user);
        model.addAttribute("productList", productList);

        return "dashboard";
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
