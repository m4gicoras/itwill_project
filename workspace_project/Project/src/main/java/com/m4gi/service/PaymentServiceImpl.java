package com.m4gi.service;

import com.m4gi.dto.PaymentVerifyDTO;
import com.m4gi.mapper.SettlementMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

    private final SettlementMapper settlementMapper;

    @Override
    public boolean verifyAndSave(PaymentVerifyDTO dto) {
        System.out.println("✅ 받은 settlementsId: " + dto.getSettlementsId());
        System.out.println("✅ 받은 estimateId: " + dto.getEstimateId());

        // 정확하게 settlements_id 기준으로 결제 상태 변경
        int result = settlementMapper.updateSettlementStatusById(dto.getSettlementsId());
        System.out.println("🔥 Settlement 상태 업데이트 결과: " + result);


        return result > 0;
    }

}
