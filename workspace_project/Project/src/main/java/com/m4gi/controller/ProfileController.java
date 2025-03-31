	package com.m4gi.controller;
	
	import java.io.IOException;
	
	import javax.inject.Inject;
	
	import org.springframework.beans.factory.annotation.Autowired;
	//import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.*;
	import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.m4gi.service.FileUploadService;
	
	@Controller
	public class ProfileController {
	
	    @Autowired
	    private FileUploadService fileUploadService;
	
	    // 기본 프로필 체크
	    @GetMapping("/profile")
	    public String profile(Model model) {
	        if (!model.containsAttribute("profileImageUrl")) {
	            model.addAttribute("profileImageUrl", "/resources/images/default-profile.png");
	        }
	        return "profile";
	    }
	
	    // 프로필 이미지 업로드 처리
	    @PostMapping("/profile/upload")
	    public String uploadProfileImage(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
	        if (!file.isEmpty()) {
	            try {
	                String fileName = "profile_images/" + file.getOriginalFilename();
	                String imageUrl = fileUploadService.uploadFile(file, fileName);
	                // 업로드 성공 시 flash attribute로 저장
	                redirectAttributes.addFlashAttribute("profileImageUrl", imageUrl);
	            } catch (IOException e) {
	                e.printStackTrace();
	                // 에러 발생 시 flash attribute로 메시지 전달
	                redirectAttributes.addFlashAttribute("message", "업로드 중 오류가 발생했습니다.");
	                return "redirect:/profile";
	            }
	        } else {
	            // 파일이 없을 경우 flash attribute로 메시지 전달
	            redirectAttributes.addFlashAttribute("message", "업로드할 파일을 선택해주세요.");
	        }
	        return "redirect:/profile";
	    }
	}
