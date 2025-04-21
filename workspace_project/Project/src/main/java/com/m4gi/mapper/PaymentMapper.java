package com.m4gi.mapper;

import com.m4gi.dto.PaymentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentMapper {

    void insertPayment(PaymentDTO payment);

    List<PaymentDTO> getPaymentsByCompanyId(int companyId);
}
