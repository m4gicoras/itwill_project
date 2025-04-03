package com.m4gi.controller;

import com.m4gi.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    // GET 방식으로 로그인 페이지 요청 시
    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "main";
    }

    // POST 방식으로 로그인 요청 처리
    @PostMapping("/login")
    public String login(@RequestParam("username") String username, // main.jsp에서 username 받아옴
            @RequestParam("password") String password, // main.jsp에서 password 받아옴
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {

        boolean authenticated = userService.login(username, password);
        if (authenticated) {
            session.setAttribute("username", username);
            model.addAttribute("success", "로그인 성공!");
            return "main"; // 로그인 성공 시 대시보드로 포워드, 대시보드 구현 시 수정 필요
        } else {
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/main";
        }
    }
}
