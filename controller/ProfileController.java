package com.m4gi.controller;

import java.io.IOException;

import javax.inject.Inject;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.m4gi.service.GCSUploadService;

@Controller
public class ProfileController {

    @Inject
    private GCSUploadService gcsUploadService;

    // 프로필 페이지 진입
    @GetMapping("/profile")
    public String profile(Model model) {

        // 기본 이미지  세팅
        model.addAttribute("profileImageUrl", "/resources/images/default-profile.png");
        return "profile";
    }

    // 프로필 이미지 업로드 처리
    @PostMapping("/profile/upload")
    public String uploadProfileImage(@RequestParam("file") MultipartFile file, Model model) {
        if (!file.isEmpty()) {
            try {
                // 업로드할 파일 이름 설정 (예: profile/유저ID/파일명) 예정
                String fileName = "profile_images/" + 
                					//System.currentTimeMillis() + "_" + 
                		file.getOriginalFilename();

                // GCS 업로드
                String imageUrl = gcsUploadService.uploadFile(file, fileName);

                // 업로드된 이미지 URL을 모델에 담아서 JSP에 전달
                model.addAttribute("profileImageUrl", imageUrl);

            } catch (IOException e) {
                e.printStackTrace();
                // 에러 처리
                model.addAttribute("message", "업로드 중 오류가 발생했습니다.");
                return "profile";
            }
        } else {
            // 파일이 없을 경우 처리
            model.addAttribute("message", "업로드할 파일을 선택해주세요.");
        }
        return "profile";
    }
}
