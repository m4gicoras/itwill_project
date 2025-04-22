package com.m4gi.service;

import com.m4gi.dto.EstimateDTO;
import java.util.List;

public interface EstimateService {
    List<EstimateDTO> getSentEstimates(Integer companyId);
    List<EstimateDTO> getReceivedEstimates(Integer companyId);
    void insertEstimate(EstimateDTO estimate);
    void updateStatus(int estimateId, int status);
    EstimateDTO getEstimateById(int estimateId);
    List<EstimateDTO> getAcceptedEstimatesByCompany(int companyId);
    List<EstimateDTO> getAcceptedEstimatesByReceiver(int companyId);
    List<EstimateDTO> getAcceptedEstimatesBySender(int companyId);
}
