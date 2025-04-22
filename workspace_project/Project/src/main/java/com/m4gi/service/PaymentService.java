package com.m4gi.service;

import com.m4gi.dto.PaymentDTO;

import java.util.List;

public interface PaymentService {
    void insertPayment(PaymentDTO payment);
    List<PaymentDTO> getPaymentsByCompany(int companyId);
    List<PaymentDTO> getPaymentsByCompanyId(int companyId);
}
