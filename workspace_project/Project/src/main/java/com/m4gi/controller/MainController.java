package com.m4gi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.m4gi.domain.Product;
import com.m4gi.dto.LoginForm;
import com.m4gi.service.ProductService;
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
    
    @Autowired
    private ProductService productService;
    
    //http://localhost:8088/web/main
    @GetMapping("/main")
    public String main(HttpSession session, Model model) {
        if (session.getAttribute("username") != null) {
            return "redirect:/dashboard";
        } // 로그인 상태로 main진입시 대시보드로 보냄

        String savedUsername = (String) session.getAttribute("savedUsername");
        if (savedUsername != null) {
            model.addAttribute("savedUsername", savedUsername);
        }
        return "main";
    }

    // 로그인 처리
    @PostMapping("/main")
    public String login(LoginForm form, 
    					HttpSession session, 
    					RedirectAttributes redirectAttributes) {
    	
    	String username = form.getUsername();
    	String password = form.getPassword();
    	String saveId = form.getSaveId();
    	
        boolean authenticated = userService.login(username, password);
        
        // 로그인 시도 로그
        System.out.println("로그인 시도 - 아이디: " + username + " / 결과: " 
        				   + (authenticated ? "성공" : "실패"));
        
        if (authenticated) {
            session.setAttribute("username", username); // 로그인세션 설정

            // 아이디 저장 체크박스용
            if (saveId != null) {
                session.setAttribute("savedUsername", username);
            } else {
                session.removeAttribute("savedUsername");
            }

            return "redirect:/dashboard"; // 로그인 성공시 대시보드로
        } else {
            redirectAttributes.addFlashAttribute("error", "입력하신 정보가 일치하지 않습니다.");
            return "redirect:/main";
        }
    } //login
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/main";

        Integer companyId = 1;
        List<Product> products = productService.getProductListByCompany(companyId);

        model.addAttribute("products", products);
        return "dashboard";
    }



    
} // MainController
