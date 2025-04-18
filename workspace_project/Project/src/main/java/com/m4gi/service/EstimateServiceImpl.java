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

}