package com.m4gi.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.m4gi.dto.PaymentDTO;
import com.m4gi.dto.PaymentVerifyDTO;
import com.m4gi.mapper.PaymentMapper;
import com.m4gi.service.PaymentService;
import lombok.RequiredArgsConstructor;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;

@Service
@RequiredArgsConstructor
@Transactional
@PropertySource("classpath:application.properties")
public class PaymentServiceImpl implements PaymentService {

    private final PaymentMapper paymentMapper;

    @Value("${iamport.api.key}")
    private String apiKey;

    @Value("${iamport.api.secret}")
    private String apiSecret;

    private final OkHttpClient client = new OkHttpClient();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean verifyAndSave(PaymentVerifyDTO dto) {
        try {
            String token = getToken();
            if (token == null || dto.getImpUid() == null || dto.getImpUid().isEmpty()) {
                System.out.println("토큰 없음 또는 imp_uid 누락");
                return false;
            }

            Request request = new Request.Builder()
                    .url("https://api.iamport.kr/payments/" + dto.getImpUid())
                    .addHeader("Authorization", token)
                    .get()
                    .build();

            Response response = client.newCall(request).execute();
            String responseBody = response.body().string();
            JsonNode rootNode = objectMapper.readTree(responseBody);

            String status = rootNode.path("response").path("status").asText();

            // 결제 상태가 paid인 경우에만 정산 상태 변경
            if ("paid".equals(status)) {
                int result = paymentMapper.updateSettlementStatusToPaid(dto.getSettlementsId());

                if (result == 0) {
                    System.out.println("정산 상태 업데이트 실패");
                    return false;
                }

                PaymentDTO payment = new PaymentDTO();
                payment.setEstimateId(dto.getEstimateId());
                payment.setPaymentCost(dto.getAmount());
                payment.setPaymentComm(0);
                payment.setTotalCost(dto.getAmount());
                payment.setStatus(1);

                paymentMapper.insertPayment(payment);
                System.out.println("결제 정보 저장 완료");

                return true;
            }
            else {
                System.out.println("⚠️ 결제되지 않은 상태: " + status);
                return false;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }




    private String getToken() throws IOException {
        RequestBody body = new FormBody.Builder()
                .add("imp_key", apiKey)
                .add("imp_secret", apiSecret)
                .build();

        Request request = new Request.Builder()
                .url("https://api.iamport.kr/users/getToken")
                .post(body)
                .build();

        Response response = client.newCall(request).execute();
        String responseBody = response.body().string();
        JsonNode rootNode = objectMapper.readTree(responseBody);

        return rootNode.path("response").path("access_token").asText(null);
    }
}
