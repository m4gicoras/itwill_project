package com.m4gi.controller;

import com.m4gi.dto.EstimateDTO;
import com.m4gi.service.EstimateService;
import com.m4gi.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EstimateController {

    @Autowired
    private EstimateService estimateService;
    @Autowired
    private NotificationService notificationService;


    @GetMapping("/estimates")
    public String showEstimates(HttpSession session, Model model) {
        Integer myCompanyId = (Integer) session.getAttribute("userId");

        // 내가 보낸 견적 (요청자)
        List<EstimateDTO> sentEstimates = estimateService.getSentEstimates(myCompanyId);
        // 내가 받은 견적 (응답자)
        List<EstimateDTO> receivedEstimates = estimateService.getReceivedEstimates(myCompanyId);

        model.addAttribute("sentEstimates", sentEstimates);
        model.addAttribute("receivedEstimates", receivedEstimates);

        return "estimate";
    }
    @PostMapping("/estimate/send")
    public String sendEstimate(@RequestParam int productId,
                               @RequestParam int resCompanyId,
                               @RequestParam int reqCost,
                               @RequestParam int estimateQtty,
                               HttpSession session) {
        Integer reqCompanyId = (Integer) session.getAttribute("userId");

        EstimateDTO estimate = new EstimateDTO();
        estimate.setReqCompId(reqCompanyId);
        estimate.setResCompId(resCompanyId);
        estimate.setProductId(productId);
        estimate.setReqCost(reqCost);
        estimate.setEstimateQtty(estimateQtty);

        estimateService.insertEstimate(estimate);
        notificationService.createNotification(resCompanyId, "새 견적 요청이 도착했습니다!");

        return "redirect:/shop";
    }



}
