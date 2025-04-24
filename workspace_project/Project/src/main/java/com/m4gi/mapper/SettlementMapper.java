package com.m4gi.mapper;

import com.m4gi.dto.SettlementDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SettlementMapper {
    void insertSettlement(SettlementDTO settlement);
    List<SettlementDTO> getSettlementByEstimateId(int estimateId);
    SettlementDTO getSettlementById(int settlementsId);
    int updateSettlementStatusById(int settlementsId);
}
