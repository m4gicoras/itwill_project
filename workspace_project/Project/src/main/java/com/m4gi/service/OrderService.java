package com.m4gi.service;

import com.m4gi.dto.OrderDTO;

import java.util.List;

public interface OrderService {
    List<OrderDTO> getInboundOrdersByUser(int userId);
    List<OrderDTO> getOutboundOrdersByUser(int userId);
    void markOutboundInProgress(int orderId);
    void completeInbound(int orderId);
    void completeOutbound(int orderId);
}
