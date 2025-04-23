package com.m4gi.controller.admin;

import com.m4gi.dto.admin.AdminProductListDTO;
import com.m4gi.dto.admin.AdminProductPageDTO;
import com.m4gi.dto.admin.AdminProductSearchCondition;
import com.m4gi.service.admin.AdminProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    private AdminProductService adminProductService;

    @GetMapping("/product")
    public String adminProduct(
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) String companyName,
            @RequestParam(required = false) String productQty,
            @RequestParam(required = false, defaultValue = "recent") String sort,
            @RequestParam(defaultValue = "1") int page,
            Model model) {

        AdminProductSearchCondition condition = new AdminProductSearchCondition(
                productName, companyName, productQty, sort, null, null
        );

        AdminProductPageDTO result = adminProductService.getProductList(condition, page);

        // 이전 검색 조건들을 JSP에서 다시 사용하도록 전달
        model.addAttribute("productName", productName);
        model.addAttribute("companyName", companyName);
        model.addAttribute("productQty", productQty);
        model.addAttribute("sort", sort);

        model.addAttribute("productList", result.getProductList());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", result.getTotalPages());

        // 조건이 모두 비어있는 경우 메시지 출력
        boolean noCondition = (productName == null || productName.isBlank()) &&
                (companyName == null || companyName.isBlank()) &&
                (productQty == null || productQty.isBlank());

        if (noCondition && result.getProductList().isEmpty()) {
            model.addAttribute("noCondition", true); // 조건도 없고 결과도 없을 때만 메시지 출력
        }

        model.addAttribute("noResult", result.getProductList().isEmpty());

        return "admin/product";
    }
    
    @PostMapping("/product/updateStatus")
    @ResponseBody
    public ResponseEntity<?> changeProductStatus(@RequestBody Map<String, Object> requestData) {
    	List<Integer> productIds = (List<Integer>) requestData.get("productIds");
    	int newStatus = ((Number) requestData.get("newStatus")).intValue();
    	
    	adminProductService.updateProductStatus(productIds, newStatus);
    	
    	return ResponseEntity.ok().build();
    }

}

