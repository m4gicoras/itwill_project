package com.m4gi.mapper;

import com.m4gi.dto.OrderDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderMapper {
    List<OrderDTO> selectInboundOrdersByUser(int userId);
    List<OrderDTO> selectOutboundOrdersByUser(int userId);

    void updateOrderToInboundComplete(int orderId);
    void updateOrderToOutboundComplete(int orderId);
    OrderDTO getOrderById(int orderId);
    int checkProductExists(@Param("companyId") int companyId, @Param("productName") String productName);
    void updateProductQuantity(@Param("companyId") int companyId,
                               @Param("productName") String productName,
                               @Param("quantity") int quantity);
    void insertProduct(@Param("companyId") int companyId,
                       @Param("productName") String productName,
                       @Param("quantity") int quantity);
    void updateOutboundToInProgress(int orderId);
    void updateInboundToInProgress(int orderId);
}

