package com.m4gi.controller;

import com.m4gi.domain.User;
import com.m4gi.dto.EstimateDTO;
import com.m4gi.dto.PaymentDTO;
import com.m4gi.service.EstimateService;
import com.m4gi.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    @Autowired
    private EstimateService estimateService;


    @GetMapping("/settlementStatus")
    public String settlementStatus(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        int companyId = userId;

        // ✅ 받은 견적 = 수입
        List<EstimateDTO> received = estimateService.getAcceptedEstimatesByReceiver(companyId);
        int totalIncome = received.stream()
                .mapToInt(e -> e.getReqCost() * e.getEstimateQtty()) // 요청한 단가 * 수량
                .sum();

        // ✅ 보낸 견적 = 지출
        List<EstimateDTO> sent = estimateService.getAcceptedEstimatesBySender(companyId);
        int totalExpenditure = sent.stream()
                .mapToInt(e -> e.getReqCost() * e.getEstimateQtty()) // 요청한 단가 * 수량
                .sum();

        // 합쳐서 하나의 테이블에 보여주기 위해 리스트 합치기
        List<EstimateDTO> all = new ArrayList<>();
        all.addAll(received);
        all.addAll(sent);

        model.addAttribute("estimateList", all);
        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpenditure", totalExpenditure);
        model.addAttribute("loginUserId", companyId);


        return "settlementStatus";
    }
}