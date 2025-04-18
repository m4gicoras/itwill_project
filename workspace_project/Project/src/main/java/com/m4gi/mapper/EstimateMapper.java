package com.m4gi.mapper;

import com.m4gi.dto.EstimateDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface EstimateMapper {
    List<EstimateDTO> selectSentEstimates(Integer companyId); // 내가 요청한 견적
    List<EstimateDTO> selectReceivedEstimates(Integer companyId); // 내가 받은 견적
    void insertEstimate(EstimateDTO estimate);

}
