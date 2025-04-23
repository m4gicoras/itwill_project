/*
package com.m4gi.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.m4gi.dto.ApproveResponse;
import com.m4gi.dto.PaymentDTO;
import com.m4gi.mapper.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.annotation.PostConstruct;
import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;


    @Override
    public void insertPayment(PaymentDTO payment) {
        paymentMapper.insertPayment(payment);
    }

    // ✅ 카카오페이 secret key (테스트용)
    private final String secretKey = "SECRET_KEY_여기에_넣기"; // Secret Key로 교체하세요

    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public String kakaoPayReady(int totalCost, String orderId, String userId, String itemName) {
        System.out.println("💬 [카카오페이 요청 파라미터]");
        System.out.println("📦 totalCost: " + totalCost);
        System.out.println("📦 orderId: " + orderId);
        System.out.println("📦 userId: " + userId);
        System.out.println("📦 itemName: " + itemName);

        String requestUrl = "https://open-api.kakaopay.com/online/v1/payment/ready"; // ✅ 변경된 URL

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "SecretKey " + secretKey); // ✅ SecretKey 헤더로 변경

        Map<String, String> params = new HashMap<>();
        params.put("cid", "TC0ONETIME");
        params.put("partner_order_id", orderId);
        params.put("partner_user_id", userId);
        params.put("item_name", itemName == null || itemName.trim().isEmpty() ? "상품명없음" : itemName);
        params.put("quantity", "1");
        params.put("total_amount", String.valueOf(totalCost));
        params.put("tax_free_amount", "0");
        params.put("approval_url", "http://localhost:8080/payment/success");
        params.put("cancel_url", "http://localhost:8080/payment/cancel");
        params.put("fail_url", "http://localhost:8080/payment/fail");

        HttpEntity<Map<String, String>> body = new HttpEntity<>(params, headers);

        ResponseEntity<String> response = restTemplate.exchange(
                URI.create(requestUrl),
                HttpMethod.POST,
                body,
                String.class
        );

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            System.out.println("✅ 카카오 응답 Raw JSON: " + response.getBody());
            JsonNode jsonNode = objectMapper.readTree(response.getBody());
            return jsonNode.get("next_redirect_pc_url").asText();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("카카오페이 준비 요청 실패", e);
        }
    }

    @Override
    public List<PaymentDTO> getPaymentsByCompanyId(int companyId) {
        return paymentMapper.getPaymentsByCompanyId(companyId);
    }

    @PostConstruct
    public void checkAdminKey() {
        System.out.println("🔍 secretKey 체크: " + secretKey);
    }
    @Override
    public ApproveResponse kakaoPayApprove(String tid, String pgToken) {
        String url = "https://open-api.kakaopay.com/online/v1/payment/approve"; // ✅ 최신 URL

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "SecretKey " + secretKey); // ✅ SecretKey 사용

        Map<String, String> params = new HashMap<>();
        params.put("cid", "TC0ONETIME");
        params.put("tid", tid);  // 결제 준비 응답에서 받은 고유번호
        params.put("partner_order_id", "ORDER1234"); // 테스트용 주문번호
        params.put("partner_user_id", "USER1234");   // 테스트용 사용자 ID
        params.put("pg_token", pgToken); // 결제 승인 토큰

        HttpEntity<Map<String, String>> body = new HttpEntity<>(params, headers);

        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<ApproveResponse> response = restTemplate.postForEntity(
                    url,
                    body,
                    ApproveResponse.class
            );
            System.out.println("✅ 결제 승인 응답: " + response.getBody());
            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("카카오페이 승인 요청 실패", e);
        }
    }

}*/
