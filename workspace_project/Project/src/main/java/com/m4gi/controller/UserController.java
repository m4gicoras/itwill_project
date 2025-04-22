package com.m4gi.controller;

import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;
import com.m4gi.service.GCSUploadService;
import com.m4gi.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private GCSUploadService gcsUploadService;

    // 회원가입 폼 페이지
    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";
    }

    // 회원가입 처리 (SiteUser만 전달)
    @PostMapping("/signup")
    public String handleSignup(@ModelAttribute SiteUser siteUser) {
        userService.register(siteUser);
        return "redirect:/main";
    }

    // 대시보드 페이지
    @GetMapping("/dashboard")
    public String showDashBoard(Model model, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");

        User user = new User();
        user.setUserId(userId);

        List<Products> productList = userService.getProductsByUser(user);
        model.addAttribute("productList", productList);

        return "dashboard";
    }

    // 대시보드 -> 마이페이지
    @GetMapping("/myPage")
    public String showMyPage(Model model, HttpSession session) {
    	Integer user_id = (Integer) session.getAttribute("userId");

    	User user = userService.getUserById(user_id);
    	model.addAttribute("user", user);

    	return "myPage";
    }

    @PostMapping("/myPage/update")
    @ResponseBody
    public String updateUserInfo(@RequestBody User user, HttpSession session) {
    	Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            user.setUserId(userId);
            return userService.updateUserInfo(user) ? "success" : "fail";
        } else {
            return "fail";
        }
    }
    
    @PostMapping("/myPage/updateImg")
    @ResponseBody
    public String updateUserImg(@RequestParam("file") MultipartFile file, HttpSession session) {
        // 1) 세션에서 로그인한 사용자 ID 가져오기
        Integer userId = (Integer) session.getAttribute("userId");
        
        System.out.println("★★★ [프로필 이미지 업데이트 요청] ★★★");
        System.out.println("userId: " + userId);
        
        if (userId == null) {
            System.out.println("⚠️ userId가 세션에 없습니다.");
            return "fail";
        }
        
        if (file.isEmpty()) {
            System.out.println("⚠️ 파일이 비어 있습니다.");
            return "fail";
        }
        
        try {
            // 2) 파일 업로드 처리
            String originalFilename = file.getOriginalFilename();
            String storedFilename = System.currentTimeMillis() + "_" + originalFilename;
            
            // GCS에 업로드하고 URL 받기
            String imageUrl = gcsUploadService.uploadFile(file, storedFilename);
            
            System.out.println("✅ 업로드된 이미지 URL: " + imageUrl);
            
            // 3) DB에 이미지 URL 업데이트
            boolean result = userService.updateUserImage(userId, imageUrl);
            
            System.out.println("DB 업데이트 결과: " + (result ? "성공" : "실패"));
            return result ? "success" : "fail";
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("⚠️ 파일 업로드 중 오류 발생: " + e.getMessage());
            return "fail";
        }
    }

    @GetMapping("/delete")
    public String showDeleteForm() {
        return "delete";
    }

    @GetMapping("/mainTest")
    public String showMainTestForm() {
        return "mainTest";
    }

    @GetMapping("/check")
    public String showCheckForm() {
        return "check";
    }

    @GetMapping("/clear")
    public String showClearForm() {
        return "clear";
    }

    @GetMapping("/find_id")
    public String showFindIDForm() {
        return "find_id";
    }

    @GetMapping("/find_pw")
    public String showFindPWForm() {
        return "find_pw";
    }

    @GetMapping("/find_pw2")
    public String showFindPW2Form() {
        return "find_pw2";
    }

    @PostMapping("/find_pw2")
    public String showFindPW2Form(
            @RequestParam("username") String username,
            HttpSession session)
    {
        // 세션에 저장
        session.setAttribute("resetUsername", username);
        return "find_pw2";
    }

    @GetMapping("/finish_pw")
    public String showFinishPWForm() {
        return "finish_pw";
    }

    @GetMapping("/finish_id")
    public String showFinishID2Form() {
        return "finish_id";
    }

    @GetMapping("/add_product")
    public String showAddProductForm() {
        return "add_product";
    }

    @PostMapping("/checkEmail")
    @ResponseBody
    public Map<String, Object> checkEmail(@RequestParam("email") String email) {
        int count = userService.isExistEmail(email);
        Map<String, Object> response = new HashMap<>();
        response.put("exists", count); // DB에 이메일이 존재하면 true, 아니면 false
        System.out.println("count: " + count);
        return response;
    }

    @PostMapping("/findId")
    @ResponseBody
    public Map<String, Object> findUserId(@RequestParam("email") String email, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        User user = userService.findByEmail(email);
        if (user != null) {
            String username = user.getUsername();
            String maskedUsername = username.replaceAll("(?<=.{4}).", "*");  // 앞 4글자 제외하고 마스킹
            session.setAttribute("foundUsername", maskedUsername); // 세션에 마스킹된 아이디 저장
            result.put("success", true);
        } else {
            result.put("success", false);
            result.put("error", "해당 이메일로 등록된 아이디가 없습니다.");
        }
        return result;
    }

    @PostMapping("/resetPassword")
    public String resetPassword(
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpSession session,
            Model model
    )
        {
            // 세션에서 userId 꺼내기
            String username = (String) session.getAttribute("resetUsername");

            // 비밀번호 일치 체크
            if (!newPassword.equals(confirmPassword)) {
                model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "find_pw2";
        }

        // 2) 서비스 호출
        boolean success = userService.resetPassword(username, newPassword);

        // 3) 처리 결과에 따라 이동
        if (success) {
            // 로그인 페이지로 리다이렉트
            session.removeAttribute("resetUsername");
            return "redirect:/finish_pw";
        } else {
            model.addAttribute("error", "비밀번호 변경에 실패했습니다.");
            return "find_pw2";
        }
    }
    
    @GetMapping("/isDuplicateUsername")
    @ResponseBody
    public String isDuplicateUsername(@RequestParam("username") String username) {
        int count = userService.isDuplicateUsername(username);
        // 로그로 확인
        System.out.println("중복 확인 요청: " + username + ", count: " + count);
        return String.valueOf(count);
    }

    @GetMapping("/me")
    @ResponseBody
    public User getCurrentUser(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return null;
        }
        return userService.getUserById(userId);
    }

    @PostMapping("/dashboard/product/upload")
    public String uploadProduct(
            @RequestParam("productName") String productName,
            @RequestParam("category") String category,
            @RequestParam("price") int price,
            @RequestParam("quantity") int productQtty,
            @RequestParam("description") String productDesc,
            @RequestParam("imageFile") MultipartFile imageFile,
            HttpSession session,
            HttpServletRequest request
    ) throws IOException {

        // 1) 세션에서 로그인한 사용자 ID 가져오기
        Integer userId = (Integer) session.getAttribute("userId");

        // 2) Products 객체 구성
        Products product = new Products();
        product.setCompanyId(userId);
        product.setProductName(productName);
        product.setCategory(category);
        product.setPrice(price);
        product.setProductQtty(productQtty);
        product.setProductDesc(productDesc);
        product.setStatus(0); // 기본 상태(정상)

        // 3) 파일 저장
        if (!imageFile.isEmpty()) {

            String originalFilename = imageFile.getOriginalFilename();
            String storedFilename = System.currentTimeMillis() + "_" + originalFilename;
            // 2) GCS에 업로드하고 URL 리턴
            String fileUrl = gcsUploadService.uploadFile(imageFile, storedFilename);
            // 3) Products에 URL 세팅
            product.setProductImg(fileUrl);
        }

        // 4) 서비스 호출하여 DB에 insert
        userService.insertProduct(product);

        // 5) 등록 완료 후 대시보드로 리다이렉트
        return "redirect:/dashboard";
    }
}
