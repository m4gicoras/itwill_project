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
    public List<OrderDTO> getInboundOrdersByUser(int userId) {
        return orderMapper.selectInboundOrdersByUser(userId);
    }

    //수령완료 버튼누르면 일어나는일
    @Override
    public void completeInbound(int orderId) {
        // 1. 주문 상태를 12로 변경하고, 입고 완료일을 now()로 업데이트
        orderMapper.updateOrderToInboundComplete(orderId);

        // 2. 해당 주문 정보를 가져옴 (상품명, 수량 등)
        OrderDTO order = orderMapper.getOrderById(orderId);
        // Null 체크
        // DB에서 주문을 가져오는데, 해당 주문이 없으면 아무것도 못 받아오는 상황
        // null 값을 쓰면 바로 에러가 나서 서버가 죽게돼서 null 체크 하는 것
        if (order == null) {
            throw new IllegalStateException("주문 정보가 없습니다. orderId = " + orderId);
        }

        // 3. 기업이 보유한 products에 등록 or 수량 업데이트
        // (이미 있으면 수량만 추가, 없으면 새로 insert)
        int count = orderMapper.checkProductExists(order.getCompanyId(), order.getProductName());

        if (count > 0) {
            orderMapper.updateProductQuantity(order.getCompanyId(), order.getProductName(), order.getOrderQtty());
        } else {
            orderMapper.insertProduct(order.getCompanyId(), order.getProductName(), order.getOrderQtty());
        }
    }

    @Override
    public List<OrderDTO> getOutboundOrdersByUser(int userId) {
        return orderMapper.selectOutboundOrdersByUser(userId);
    }

    // 출고 준비 -> 진행
    @Override
    public void markOutboundInProgress(int orderId) {
        // 1. 출고 상태 20 → 21
        orderMapper.updateOutboundToInProgress(orderId);

        // 2. 입고 상태 10 → 11 (자동 동기화)
        orderMapper.updateInboundToInProgress(orderId);
    }

    //출고완료 버튼누르면 일어나는일
    @Override
    public void completeOutbound(int orderId) {
        // 1. 주문 상태를 22로 변경하고, 출고 완료일을 now()로 업데이트
        orderMapper.updateOrderToOutboundComplete(orderId);

        // 2. 해당 주문 정보를 가져옴 (상품명, 수량 등)
        OrderDTO order = orderMapper.getOrderById(orderId);
        // Null 체크
        // DB에서 주문을 가져오는데, 해당 주문이 없으면 아무것도 못 받아오는 상황
        // null 값을 쓰면 바로 에러가 나서 서버가 죽게돼서 null 체크 하는 것
        if (order == null) {
            throw new IllegalStateException("주문 정보가 없습니다. orderId = " + orderId);
        }

        // 3. 기업이 보유한 products에 등록 or 수량 업데이트
        // (이미 있으면 수량만 추가, 없으면 새로 insert)
        int count = orderMapper.checkProductExists(order.getCompanyId(), order.getProductName());

        if (count > 0) {
            orderMapper.updateProductQuantity(order.getCompanyId(), order.getProductName(), order.getOrderQtty());
        } else {
            orderMapper.insertProduct(order.getCompanyId(), order.getProductName(), order.getOrderQtty());
        }
    }




}
