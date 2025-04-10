package com.m4gi.controller.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.service.admin.AdminProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    private AdminProductService adminProductService;

    @GetMapping("/product")
    public String adminProduct(@RequestParam(defaultValue = "1") int page, Model model) {
        AdminProductPageDTO result = adminProductService.getPagedProductList(page);
        model.addAttribute("productList", result.getProductList());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", result.getTotalPages());
        return "admin/product";
    }

}

