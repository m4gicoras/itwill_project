package com.m4gi.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.m4gi.domain.Product;
import com.m4gi.service.ProductService;

@RestController
public class ProductApiController {
	
    @Autowired
    private ProductService productService;

    @GetMapping("/api/products")
    @ResponseBody
    public List<Product> getProductList(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
//        if (userId == null) { 
//        	// 로그인X -> 빈목록
//        	System.out.println("세션에 userId 없음");
//        	return Collections.emptyList();
//        }
        
        // 로그 확인용
        List<Product> list = productService.getProductsByCompany(userId);
        System.out.println("상품 개수: " + list.size());
        // 회사id == userId
        return productService.getProductsByCompany(userId);
    }
}
