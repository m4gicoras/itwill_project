package com.m4gi.service;

import com.m4gi.dto.EstimateDTO;
import com.m4gi.mapper.EstimateMapper;
import com.m4gi.mapper.SettlementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.m4gi.dto.SettlementDTO;

import java.util.Date;
import java.util.List;

@Service
public class EstimateServiceImpl implements EstimateService {
    @Autowired
    private SettlementMapper settlementMapper;
    @Autowired
    private EstimateMapper estimateMapper;



    @Override
    public List<EstimateDTO> getSentEstimates(Integer companyId) {
        return estimateMapper.selectSentEstimates(companyId);
    }

    @Override
    public List<EstimateDTO> getReceivedEstimates(Integer companyId) {
        return estimateMapper.selectReceivedEstimates(companyId);
    }

    @Override
    public void insertEstimate(EstimateDTO estimate) {
        estimateMapper.insertEstimate(estimate);
    }

    @Override
    public EstimateDTO getEstimateById(int estimateId) {
        return estimateMapper.getEstimateById(estimateId);
    }
    @Override
    public List<EstimateDTO> getAcceptedEstimatesByCompany(int companyId) {
        return estimateMapper.selectAcceptedEstimatesByCompany(companyId);
    }
    @Override
    public List<EstimateDTO> getAcceptedEstimatesByReceiver(int companyId) {
        return estimateMapper.selectAcceptedEstimatesByReceiver(companyId);
    }
    @Override
    public List<EstimateDTO> getAcceptedEstimatesBySender(int companyId) {
        return estimateMapper.selectAcceptedEstimatesBySender(companyId);
    }

    @Override
    @Transactional
    public void updateStatus(int estimateId, int status) {
        // 1. 견적 정보 조회
        EstimateDTO estimate = estimateMapper.getEstimateById(estimateId);

        // 2. 수락(1)일 경우 정산 INSERT
        if (status == 1) {
            Integer reqCost = estimate.getReqCost();       // 요청자가 제안한 단가
            Integer qtty = estimate.getEstimateQtty();     // 수량

            if (reqCost == null || qtty == null) {
                throw new IllegalStateException("reqCost 또는 수량 정보가 누락되었습니다.");
            }

            int totalCost = reqCost * qtty;
            Date now = new Date();

            // 2-1. 지출자
            SettlementDTO expendDto = new SettlementDTO();
            expendDto.setCompanyId(estimate.getReqCompId());
            expendDto.setExpendCost(totalCost);
            expendDto.setIncomeCost(0);
            expendDto.setStatus(0);
            expendDto.setCreatedAt(now);
            expendDto.setEstimateId(estimateId);

            settlementMapper.insertSettlement(expendDto);

// 2-2. 수입자
            SettlementDTO incomeDto = new SettlementDTO();
            incomeDto.setCompanyId(estimate.getResCompId());
            incomeDto.setIncomeCost(totalCost);
            incomeDto.setExpendCost(0);
            incomeDto.setStatus(0);
            incomeDto.setCreatedAt(now);
            incomeDto.setEstimateId(estimateId);

            settlementMapper.insertSettlement(incomeDto);

        }



        // 3. 견적 상태 업데이트
        estimateMapper.updateEstimateStatus(estimateId, status);
    }

}