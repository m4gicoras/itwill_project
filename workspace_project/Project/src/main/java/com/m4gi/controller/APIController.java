package com.m4gi.controller;

import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class APIController {

    @Autowired
    private UserService userService;

    @GetMapping("/products")
    public List<Products> getAllProducts(HttpSession session) {
        // 로그인된 사용자의 userId가 세션에 저장되어 있다고 가정
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId == null){
            // 로그인되지 않은 경우 빈 배열을 반환하거나 에러 처리
            return new ArrayList<>();
        }
        // userId를 이용해서 User 객체 생성
        User user = new User();
        user.setUserId(userId);
        return userService.getProductsByUser(user);
    }
}
