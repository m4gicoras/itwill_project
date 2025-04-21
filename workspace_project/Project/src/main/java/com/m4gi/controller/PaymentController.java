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

        List<EstimateDTO> received = estimateService.getAcceptedEstimatesByReceiver(companyId);
        int totalIncome = received.stream()
                .mapToInt(e -> e.getReqCost() * e.getEstimateQtty())
                .sum();

        List<EstimateDTO> sent = estimateService.getAcceptedEstimatesBySender(companyId);
        int totalExpenditure = sent.stream()
                .mapToInt(e -> e.getReqCost() * e.getEstimateQtty())
                .sum();

        model.addAttribute("estimateList", sent);
        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpenditure", totalExpenditure);

        return "settlementStatus";
    }







}