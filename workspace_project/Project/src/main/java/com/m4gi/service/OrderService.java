package com.m4gi.service;

import com.m4gi.dto.OrderDTO;

import java.util.List;

public interface OrderService {
    List<OrderDTO> getInboundOrders();
    List<OrderDTO> getOutboundOrders();

}
