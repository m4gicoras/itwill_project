package com.m4gi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.m4gi.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    @Autowired
    private UserService userService;
    
    //http://localhost:8088/web/main
    @GetMapping("/main")
    public String main(HttpSession session, Model model) {
        String savedUsername = (String) session.getAttribute("savedUsername");
        if (savedUsername != null) {
            model.addAttribute("savedUsername", savedUsername);
        }
        return "main";
    }
    
    // GET 방식으로 로그인 페이지 요청 시
    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "main";
    }

    // POST 방식으로 로그인 페이지 요청 시
    // 사용자 로그인
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestParam("username") String username,
                                         @RequestParam("password") String password,
                                         HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        boolean authenticated = userService.login(username, password);
        if (authenticated) {
            session.setAttribute("username", username);
            result.put("success", true);
            // 필요에 따라 redirect할 페이지 URL을 지정
            result.put("redirect", "dashboard");
        } else {
            result.put("success", false);
        }
        return result;
    }
}
