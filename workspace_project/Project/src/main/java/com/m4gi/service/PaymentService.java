package com.m4gi.service;

import com.m4gi.dto.PaymentDTO;
import com.m4gi.dto.PaymentVerifyDTO;

public interface PaymentService {
    boolean verifyAndSave(PaymentVerifyDTO dto);
}

