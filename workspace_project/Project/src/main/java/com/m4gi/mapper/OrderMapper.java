package com.m4gi.mapper;

import com.m4gi.dto.OrderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    List<OrderDTO> selectInboundOrders();
    List<OrderDTO> selectOutboundOrders();

}

