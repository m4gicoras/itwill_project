package com.m4gi.service;

import com.m4gi.dto.SettlementDTO;
import com.m4gi.mapper.SettlementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SettlementServiceImpl implements SettlementService {

    @Autowired
    private SettlementMapper settlementMapper;

    @Override
    public List<SettlementDTO> getSettlementByEstimateId(int estimateId) {
        return settlementMapper.getSettlementByEstimateId(estimateId);
    }
    @Override
    public SettlementDTO getSettlementById(int settlementsId) {
        return settlementMapper.getSettlementById(settlementsId);
    }
}
