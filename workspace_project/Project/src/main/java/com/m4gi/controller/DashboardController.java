package com.m4gi.controller;

import com.m4gi.domain.Product;
import com.m4gi.domain.User;
import com.m4gi.mapper.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DashboardController {

	/*
	 * @Autowired private ProductService productService;
	 * 
	 * @Autowired private UserMapper userMapper;
	 * 
	 * @GetMapping("/dashboard") public String dashboardPage(HttpSession session,
	 * Model model) { String username = (String) session.getAttribute("username");
	 * User user = userMapper.checkUsername(username); // 사용자 정보 조회 List<Product>
	 * productList = productService.getProductListByCompany(user.getUserId());
	 * model.addAttribute("productList", productList); return "dashboard"; //
	 * dashboard.jsp }
	 */
}
