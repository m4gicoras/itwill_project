package com.m4gi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.m4gi.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserService userService;

    // 메인 페이지 또는 로그인 페이지 요청 시
    // 이미 로그인되어 있다면 test 페이지로 리다이렉트합니다.
    @GetMapping("/main")
    public String showMainPage(HttpSession session, HttpServletRequest request) {
        // 세션에 로그인 정보가 있으면 바로 test 페이지로 이동
        if (session.getAttribute("username") != null) {
            return "redirect:/test";
        }

        // 세션에 정보가 없으면 쿠키에서 'username'을 확인하여 세션 복원 시도
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    String username = cookie.getValue();
                    session.setAttribute("username", username);
                    logger.info("Session restored from cookie for user '{}'", username);
                    // 복원된 경우 바로 test 페이지로 리다이렉트
                    return "redirect:/test";
                }
            }
        }
        // 로그인되지 않은 상태면 로그인 폼(예: main 페이지)를 보여줌
        return "main";
    }

    // 로그인 POST 요청 : 로그인 처리 후 세션 생성 및 필요한 경우 쿠키 발급
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestParam("username") String username,
                                     @RequestParam("password") String password,
                                     HttpSession session,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        boolean authenticated = userService.login(username, password);

        // 로그인 유지 체크박스("keep-id")가 선택되었는지 확인
        boolean isKeep = request.getParameter("keep-id") != null;
        if (authenticated) {
            // 인증 성공: 세션에 사용자 정보 저장
            session.setAttribute("username", username);

            // 로그인 유지 옵션이 있으면 쿠키 발급 (예제에서는 3분 동안 유지)
            if (isKeep) {
                int maxAge = 60 * 3;  // 3분, 초 단위
                Cookie cookie = new Cookie("username", username);
                cookie.setMaxAge(maxAge);
                // 보안을 위해 HttpOnly true로 설정하여 클라이언트 스크립트에서 접근하지 못하게 함
                cookie.setHttpOnly(true);
                cookie.setPath("/");
                response.addCookie(cookie);
                logger.info("Cookie set for user '{}' with maxAge {} sec;", username, Integer.valueOf(maxAge));
            }

            result.put("success", true);
            // 인증 성공 후 이동할 페이지 URL (예: test)
            result.put("redirect", "test");
        } else {
            result.put("success", false);
        }
        return result;
    }

    @PostMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        // 세션 무효화
        session.invalidate();

        // "username" 쿠키를 삭제 (maxAge를 0으로 설정)
        Cookie cookie = new Cookie("username", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        // 로그아웃 후 로그인 페이지로 리다이렉트
        return "redirect:/main";
    }
}
