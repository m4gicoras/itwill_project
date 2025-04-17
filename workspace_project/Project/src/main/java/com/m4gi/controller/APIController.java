package com.m4gi.controller;

import com.google.api.HttpProto;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.Message;
import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.domain.Verification;
import com.m4gi.service.GmailService;
import com.m4gi.service.UserService;
import com.m4gi.util.EmailTemplateLoader;
import com.m4gi.util.GoogleAuthorizationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class APIController {

    @Autowired
    private UserService userService;

    @GetMapping("/products")
    public List<Products> getAllProducts(HttpSession session) {
        // 로그인된 사용자의 userId가 세션에 저장되어 있다고 가정
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId == null){
            // 로그인되지 않은 경우 빈 배열을 반환하거나 에러 처리
            return new ArrayList<>();
        }
        // userId를 이용해서 User 객체 생성
        User user = new User();
        user.setUserId(userId);
        return userService.getProductsByUser(user);
    }

    @PostMapping("/sendVerificationEmail")
    public ResponseEntity<Map<String, Object>> sendVerificationEmail(@RequestParam("email") String email, HttpSession session) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 1. OAuth 2.0을 통해 Credential 객체 획득 (GoogleAuthorizationUtil은 직접 구현 필요)
            NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            Credential credential = GoogleAuthorizationUtil.getCredential(HTTP_TRANSPORT);

            // 2. Gmail 서비스 객체 생성
            Gmail service = GmailService.getGmailService(credential);

            // 3. 랜덤 6자리 인증번호 생성
            String verificationCode = String.format("%06d", (int)(Math.random() * 1000000));
            Verification verification = new Verification(email, verificationCode);
            session.setAttribute("verification", verification);
            //System.out.println("세션에 저장된 인증번호: " + session.getAttribute("verificationCode"));
            System.out.println("세션에 저장된 인증 데이터: " + verification.getEmail() + " / " + verification.getCode());

            String htmlTemplate = EmailTemplateLoader.loadTemplate("/templates/email.html");
            String htmlContent = htmlTemplate.replace("{{verificationCode}}", verificationCode);

            // 4. 이메일 메시지 구성
            // from: Gmail API의 OAuth 인증된 계정 (예: "youraccount@gmail.com")
            String fromEmail = "m4gicoras@gmail.com";  // 실제 인증된 이메일 주소
            String fromName = "Sellity";
            String subject = "Sellity 인증번호 안내";
            //MimeMessage emailMessage = GmailService.createEmailWithHtml(email, fromEmail, fromName, subject, bodyText);
            MimeMessage emailMessage = GmailService.createEmailWithHtml(email, fromEmail, fromName, subject, htmlContent);

            // 5. 이메일 전송 (userId 값은 "me" 사용)
            Message sentMessage = GmailService.sendMessage(service, "me", emailMessage);
            result.put("success", true);
            result.put("messageId", sentMessage.getId());
            result.put("verificationCode", verificationCode);
            return ResponseEntity.ok(result);
        } catch (GeneralSecurityException | IOException | MessagingException e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("error", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
        }
    }

    @PostMapping("/verifyCode")
    public ResponseEntity<Map<String, Object>> verifyCode(@RequestParam("email") String email,
                                                          @RequestParam("code") String code,
                                                          HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        Verification storedData = (Verification) session.getAttribute("verification");

        System.out.println("클라이언트에서 입력한 이메일: " + email);
        System.out.println("클라이언트에서 입력한 코드: " + code);
        System.out.println("세션에 저장된 이메일: " + storedData.getEmail());
        System.out.println("세션에 저장된 코드: " + storedData.getCode());

        if (storedData != null && storedData.getEmail().equals(email) && storedData.getCode().equals(code)) {
            result.put("success", true);
            // 성공하면 세션에서 제거할 수도 있음
            session.removeAttribute("verification");
        } else {
            result.put("success", false);
        }
        // 항상 200 OK로 응답
        return ResponseEntity.ok(result);
    }
}
