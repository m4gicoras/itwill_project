package com.m4gi.controller;

import com.m4gi.domain.User;
import com.m4gi.dto.EstimateDTO;
import com.m4gi.dto.PaymentVerifyDTO;
import com.m4gi.dto.SettlementDTO;
import com.m4gi.service.EstimateService;
import com.m4gi.service.PaymentService;
import com.m4gi.service.SettlementService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class PaymentController {

    @Autowired
    private EstimateService estimateService;

    @Autowired
    private SettlementService settlementService;

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

        List<EstimateDTO> all = new ArrayList<>();
        all.addAll(received);
        all.addAll(sent);

        for (EstimateDTO est : all) {
            List<SettlementDTO> settlements = settlementService.getSettlementByEstimateId(est.getEstimateId());
            for (SettlementDTO s : settlements) {
                if (s.getCompanyId() == companyId) {
                    est.setSettlement(s);
                    break;
                }
            }
        }

        model.addAttribute("estimateList", all);
        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpenditure", totalExpenditure);
        model.addAttribute("loginUserId", companyId);

        return "settlementStatus";
    }
}

@RestController
@RequiredArgsConstructor
@RequestMapping("/payment")
class PaymentApiController {

    private final PaymentService paymentService;

    @PostMapping("/verify")
    @ResponseBody
    public Map<String, String> verifyPayment(@RequestBody PaymentVerifyDTO paymentDTO) {
        boolean result = paymentService.verifyAndSave(paymentDTO);
        Map<String, String> response = new HashMap<>();
        response.put("result", result ? "ok" : "fail");
        return response;
    }
}