package com.m4gi.service;

import com.m4gi.dto.OrderDTO;
import com.m4gi.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<OrderDTO> getInboundOrders() {
        return orderMapper.selectInboundOrders();
    }
    @Override
    public List<OrderDTO> getOutboundOrders() {
        return orderMapper.selectOutboundOrders();
    }

}
