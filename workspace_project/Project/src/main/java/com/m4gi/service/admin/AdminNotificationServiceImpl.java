package com.m4gi.service.admin;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m4gi.domain.admin.AdminNotification;
import com.m4gi.dto.admin.AdminNotificationListDTO;
import com.m4gi.mapper.admin.AdminNotificationMapper;

@Service
public class AdminNotificationServiceImpl implements AdminNotificationService{
	
    @Autowired
    private AdminNotificationMapper notiMapper;
	
    // 전체 알림 기록 조회
    @Override
    public List<AdminNotificationListDTO> getNotificationList() {
    	List<AdminNotification> rawList = notiMapper.getNotificationList();
    	
    	Map<Integer, AdminNotificationListDTO> groupedMap = new LinkedHashMap<Integer, AdminNotificationListDTO>();
    	
    	for(AdminNotification raw : rawList) {
    		AdminNotificationListDTO dto = groupedMap.computeIfAbsent(raw.getNotification_id(), id -> {
    			AdminNotificationListDTO newDTO = new AdminNotificationListDTO();
    			newDTO.setNotification_id(id);
    			newDTO.setContent(raw.getContent());
    			newDTO.setCompany_names(new ArrayList<>());
    			newDTO.setCreated_at(raw.getCreated_at());
    			return newDTO;
    		});
    		
    		dto.getCompany_names().add(raw.getCompany_name());
  
    	}
    	
    	return new ArrayList<>(groupedMap.values());
    }
}
