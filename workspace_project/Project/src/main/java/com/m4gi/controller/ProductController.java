package com.m4gi.controller;

import com.m4gi.dto.ProductDTO;
import com.m4gi.service.ProductService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    // 등록 폼 페이지
    @GetMapping("/new")
    public String showProductForm() {
        return "product_form";
    }

    // 등록 처리
    @PostMapping("/new")
    public String registerProduct(@ModelAttribute ProductDTO dto,
                                  HttpSession session,
                                  RedirectAttributes redirectAttributes) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/main";
        }

        // 세션에서 company_id를 받아오는 로직 필요(예시)
        Integer companyId = 1; // TODO: 실제 로그인한 사용자의 user_id로 교체
        productService.registerProduct(dto, companyId);

        redirectAttributes.addFlashAttribute("message", "상품이 등록되었습니다.");
        return "redirect:/dashboard";
    }
}
