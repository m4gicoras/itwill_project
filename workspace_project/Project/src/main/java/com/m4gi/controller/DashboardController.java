package com.m4gi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.m4gi.domain.Product;
import com.m4gi.service.ProductService;

@Controller
public class DashboardController {

    @Autowired
    private ProductService productService;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
    	System.out.println("대시보드 컨트롤러 호출됨");
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/main";
        }

        List<Product> productList = productService.getProductsByCompany(userId);
        model.addAttribute("productList", productList);

        return "dashboard";
    }
}

