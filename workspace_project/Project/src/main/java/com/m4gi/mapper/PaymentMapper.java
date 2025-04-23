package com.m4gi.mapper;

import com.m4gi.dto.PaymentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
// PaymentMapper.java
public interface PaymentMapper {
    int updateSettlementStatusToPaid(int settlementsId);
    int insertPayment(PaymentDTO payment);

}

