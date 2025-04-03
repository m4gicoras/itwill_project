package com.m4gi.controller;

import javax.servlet.http.HttpSession;

import com.m4gi.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		/* model.addAttribute("videoUrl", "/resources/videos/forest.mp4"); */
        return "main";
    }

    // 로그인 처리
    @PostMapping("/main")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam(value = "saveId", required = false) String saveId,
                        HttpSession session,
                        Model model,
                        RedirectAttributes redirectAttributes) {

        boolean authenticated = userService.login(username, password);

        if (authenticated) {
            session.setAttribute("username", username);  // 로그인세션 설정

            // 아이디 저장 체크박스
            if (saveId != null) {
                session.setAttribute("savedUsername", username);
            } else {
                session.removeAttribute("savedUsername");
            }

            return "redirect:/dashboard"; // 로그인 성공시 대시보드로
        } else {
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/main";
        }
    }
}
