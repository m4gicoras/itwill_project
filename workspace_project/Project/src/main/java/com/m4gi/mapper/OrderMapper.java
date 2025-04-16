package com.m4gi.mapper;

import com.m4gi.dto.OrderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    List<OrderDTO> selectInboundOrders();
    List<OrderDTO> selectOutboundOrders();

    void updateOrderToInboundComplete(int orderId);
    void updateOrderToOutboundComplete(int orderId);
    OrderDTO getOrderById(int orderId);
    int checkProductExists(int companyId, String productName);
    void updateProductQuantity(int companyId, String productName, int quantity);
    void insertProduct(int companyId, String productName, int quantity);
    void updateOutboundToInProgress(int orderId);
    void updateInboundToInProgress(int orderId);
}

