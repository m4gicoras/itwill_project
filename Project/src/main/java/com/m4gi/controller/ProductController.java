package com.m4gi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.m4gi.domain.Product;
import com.m4gi.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/list")
    public String productList(@RequestParam(value = "status", required = false) Integer status, Model model, HttpSession session) {
        Integer companyId = (Integer) session.getAttribute("userId");
        List<Product> productList;

        if (status == null) {
            productList = productService.getProductsByCompany(companyId);
        } else {
            productList = productService.getProductsByCompanyAndStatus(companyId, status);
        }

        model.addAttribute("productList", productList);
        return "product_list";
    }
}
