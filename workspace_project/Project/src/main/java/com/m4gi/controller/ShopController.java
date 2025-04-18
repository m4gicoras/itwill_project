package com.m4gi.controller;

import com.m4gi.dto.ShopProductDTO;
import com.m4gi.service.ShopProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShopController {

    @Autowired
    private ShopProductService shopProductService;

    @GetMapping("/shop")
    public String showShopProducts(
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            HttpSession session, Model model) {

        Integer myCompanyId = (Integer) session.getAttribute("userId");
        List<ShopProductDTO> productList;

        if (keyword != null && !keyword.isEmpty()) {
            productList = shopProductService.searchProducts(myCompanyId, keyword);
        } else if (category != null && !category.isEmpty()) {
            productList = shopProductService.getProductsByCategory(myCompanyId, category);
        } else {
            productList = shopProductService.getOtherCompanyProducts(myCompanyId);
        }

        model.addAttribute("productList", productList);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("keyword", keyword);

        return "shop";
    }


    @GetMapping("/productDetail")
    public String showProductDetail(@RequestParam("productId") int productId, Model model) {
        ShopProductDTO product = shopProductService.getProductById(productId);
        model.addAttribute("product", product);
        return "productDetail"; // => /WEB-INF/views/productDetail.jsp
    }

}
