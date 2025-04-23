package com.m4gi.service;

import com.m4gi.dto.SettlementDTO;

import java.util.List;

public interface SettlementService {
    List<SettlementDTO> getSettlementByEstimateId(int estimateId);
    SettlementDTO getSettlementById(int settlementsId);

}
