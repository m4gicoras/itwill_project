package com.m4gi.controller;

import com.m4gi.dto.EstimateDTO;
import com.m4gi.dto.PaymentDTO;
import com.m4gi.dto.ShopProductDTO;
import com.m4gi.service.EstimateService;
import com.m4gi.service.NotificationService;
import com.m4gi.service.PaymentService;
import com.m4gi.service.ShopProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EstimateController {

    @Autowired
    private EstimateService estimateService;
    @Autowired
    private NotificationService notificationService;
    @Autowired
    private ShopProductService shopProductService;
    @Autowired
    private PaymentService paymentService;




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
        notificationService.createNotification(
                estimate.getResCompId(),
                "새 견적 요청이 도착했습니다!"
        );

        return "estimateSendSuccess";
    }

    @PostMapping("/estimates/updateStatus")
    public String updateEstimateStatus(@RequestParam("estimateId") int estimateId,
                                       @RequestParam("status") int status) {
        estimateService.updateStatus(estimateId, status);
        return "redirect:/estimates"; // 또는 다시 목록 페이지로
    }



}
