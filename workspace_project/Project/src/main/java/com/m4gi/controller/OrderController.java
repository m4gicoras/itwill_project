package com.m4gi.controller;

import com.m4gi.dto.OrderDTO;
import com.m4gi.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class OrderController {

    @Autowired

    private OrderService orderService;

    // 입고 현황 페이지
    @GetMapping
            ("/inbound")
    public String showInboundList(Model model) {
        List<OrderDTO> inboundList = orderService.getInboundOrders();
        model.addAttribute("inboundList", inboundList);
        return "inbound"; // inbound.jsp 로 이동
    }

    //출고
    @GetMapping("/outbound")
    public String showOutboundList(Model model) {
        List<OrderDTO> outboundList = orderService.getOutboundOrders();
        model.addAttribute("outboundList", outboundList);
        return "outbound"; // outbound.jsp
    }

}

