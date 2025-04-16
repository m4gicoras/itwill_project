package com.m4gi.controller;


import com.m4gi.dto.MemberDTO;
import com.m4gi.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FindIdController {

    @Autowired
    public MemberService memberService;

    /*@GetMapping("/find_id")
    public String findIdPage() {
        return "find_id";

    }

    /*
    @PostMapping("/find_id")
    public String findId(@RequestParam("email") String email, Model model) {

        MemberDTO member = memberService.findByEmail(email);

        if(member != null) {
            String userId = member.getUserId();
            String maskedId = userId.substring(0, Math.min(4, userId.length())) + "****";

            model.addAttribute("userName",member.getUserName());
            model.addAttribute("userId", maskedId);

            return "finish_id";

        } else {

            return "find_id";

        }

    }*/

}
