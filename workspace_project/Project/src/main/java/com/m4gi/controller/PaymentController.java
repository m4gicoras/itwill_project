package com.m4gi.controller;

import com.m4gi.domain.User;
import com.m4gi.dto.EstimateDTO;
import com.m4gi.dto.SettlementDTO;
import com.m4gi.service.EstimateService;
import com.m4gi.service.SettlementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    private EstimateService estimateService;
    @Autowired
    private SettlementService settlementService;



    @GetMapping("/settlementStatus")
    public String settlementStatus(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        int companyId = userId;

        // ✅ 받은 견적 = 수입
        List<EstimateDTO> received = estimateService.getAcceptedEstimatesByReceiver(companyId);
        int totalIncome = received.stream()
                .mapToInt(e -> e.getReqCost() * e.getEstimateQtty()) // 요청한 단가 * 수량
                .sum();

        // ✅ 보낸 견적 = 지출
        List<EstimateDTO> sent = estimateService.getAcceptedEstimatesBySender(companyId);
        int totalExpenditure = sent.stream()
                .mapToInt(e -> e.getReqCost() * e.getEstimateQtty()) // 요청한 단가 * 수량
                .sum();

        // 합쳐서 하나의 테이블에 보여주기 위해 리스트 합치기
        List<EstimateDTO> all = new ArrayList<>();
        all.addAll(received);
        all.addAll(sent);

        // 각 견적에 해당하는 정산 정보 붙이기
        for (EstimateDTO est : all) {
            List<SettlementDTO> settlements = settlementService.getSettlementByEstimateId(est.getEstimateId());

            for (SettlementDTO s : settlements) {
                if (s.getCompanyId() == companyId) {  // 로그인된 회사만 본인의 정산을 est에 연결
                    est.setSettlement(s);
                    break; // 찾았으면 더 볼 필요 없어
                }
            }
        }



        model.addAttribute("estimateList", all);
        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpenditure", totalExpenditure);
        model.addAttribute("loginUserId", companyId);


        return "settlementStatus";
    }
    /*@GetMapping("/payment/ready")
    public String kakaoPayReady(@RequestParam int settlementsId, HttpSession session) {
        // 1. 정산 정보 조회
        SettlementDTO settlement = settlementService.getSettlementById(settlementsId);
        if (settlement == null) return "redirect:/error";

        // 2. 견적 정보 조회
        EstimateDTO estimate = estimateService.getEstimateById(settlement.getEstimateId());
        if (estimate == null) return "redirect:/error";

        // 3. 진짜 값으로 채워넣기
        int totalCost = estimate.getReqCost() * estimate.getEstimateQtty();
        String orderId = "ORD-" + System.currentTimeMillis(); // 주문번호를 유니크하게 생성
        String userId = String.valueOf(session.getAttribute("userId")); // 로그인된 사용자
        String itemName = estimate.getProductName(); // 상품 이름

        if (itemName == null || itemName.trim().isEmpty()) {
            itemName = "상품명없음";}

        // 4. KakaoPay 결제 준비 요청
        String redirectUrl = paymentService.kakaoPayReady(totalCost, orderId, userId, itemName);

        // 5. 리다이렉트
        return "redirect:" + redirectUrl;
    }

    // 결제 성공 처리
    @GetMapping("/payment/success")
    public String paymentSuccess(@RequestParam("pg_token") String pgToken, HttpSession session) {
        // 세션에서 tid, 사용자 ID 가져오기
        String tid = (String) session.getAttribute("tid"); // 결제 준비에서 저장된 결제 고유 번호
        String userId = String.valueOf(session.getAttribute("userId")); // 로그인된 사용자 ID
        String orderId = "ORD-" + System.currentTimeMillis(); // 주문 번호, 실제로는 DB에서 불러오는 게 좋음

        // 결제 승인 요청
        ApproveResponse res = paymentService.kakaoPayApprove(tid, pgToken); // kakaoPayApprove 메서드 호출
        System.out.println("✅ 결제 승인 응답: " + res);

        // 결제 승인 결과에 따라 DB에 결제 상태 저장, 처리 등 추가 작업 가능
        // 예: 결제 성공 처리
        // paymentService.updatePaymentStatus(res.getTid(), "SUCCESS");

        // 결제 완료 페이지로 리다이렉트
        return "paymentCompleted"; // 결제 완료 페이지로 이동 (JSP 파일을 만들었음)
    }*/
}