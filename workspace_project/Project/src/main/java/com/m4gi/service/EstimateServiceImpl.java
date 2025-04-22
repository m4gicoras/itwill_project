package com.m4gi.service;

import com.m4gi.dto.EstimateDTO;
import com.m4gi.mapper.EstimateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstimateServiceImpl implements EstimateService {

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
    public void updateStatus(int estimateId, int status) {
        estimateMapper.updateEstimateStatus(estimateId, status);
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

}