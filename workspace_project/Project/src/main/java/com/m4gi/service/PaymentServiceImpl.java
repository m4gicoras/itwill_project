package com.m4gi.service;

import com.m4gi.dto.PaymentDTO;
import com.m4gi.mapper.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public void insertPayment(PaymentDTO payment) {
        paymentMapper.insertPayment(payment);
    }

    @Override
    public List<PaymentDTO> getPaymentsByCompany(int companyId) {
        return paymentMapper.getPaymentsByCompanyId(companyId);
    }

    @Override
    public List<PaymentDTO> getPaymentsByCompanyId(int companyId) {
        return paymentMapper.getPaymentsByCompanyId(companyId);
    }
}
