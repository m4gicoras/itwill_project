package com.m4gi.controller;

import com.m4gi.dto.OrderDTO;
import com.m4gi.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderController {

    @Autowired

    private OrderService orderService;

    // 입고 현황 페이지
    @GetMapping("/inbound")
    public String showInboundList(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        List<OrderDTO> inboundList = orderService.getInboundOrdersByUser(userId);
        model.addAttribute("inboundList", inboundList);
        return "inbound";
    }
    //입고완료버튼
    @PostMapping("/inbound/complete")
    public String completeInbound(@RequestParam("orderId") int orderId, Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        try {
            orderService.completeInbound(orderId); // 정상 처리
        } catch (IllegalStateException e) {
            // 에러 메시지를 model에 담아서 다시 입고 페이지로
            model.addAttribute("errorMessage", e.getMessage());

            // 로그인한 리스트 다시 불러오기
            List<OrderDTO> inboundList = orderService.getInboundOrdersByUser(userId);
            model.addAttribute("inboundList", inboundList);

            return "inbound"; // inbound.jsp로 에러 메시지와 함께 이동
        }
        return "redirect:/inbound";
    }

    //출고
    @GetMapping("/outbound")
    public String showOutboundList(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        List<OrderDTO> outboundList = orderService.getOutboundOrdersByUser(userId);
        model.addAttribute("outboundList", outboundList);
        return "outbound";
    }
    //출고 준비->진행
    @PostMapping("/outbound/start")
    public String startOutbound(@RequestParam int orderId, Model model) {
        orderService.markOutboundInProgress(orderId); // 출고 상태 변경 + 입고 상태도 동기화
        return "redirect:/outbound";
    }

    //출고완료버튼
    @PostMapping("/outbound/complete")
    public String completeOutbound(@RequestParam("orderId") int orderId, Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        try {
            orderService.completeOutbound(orderId); // 정상 처리
        } catch (IllegalStateException e) {
            // 에러 메시지를 model에 담아서 다시 입고 페이지로
            model.addAttribute("errorMessage", e.getMessage());

            // 리스트 다시 불러오기
            List<OrderDTO> outboundList = orderService.getOutboundOrdersByUser(userId);
            model.addAttribute("outboundList", outboundList);

            return "outbound"; // inbound.jsp로 에러 메시지와 함께 이동
        }
        return "redirect:/outbound";
    }



}

