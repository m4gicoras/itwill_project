package com.m4gi.service;

import com.m4gi.dto.MemberDTO;
import com.m4gi.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    public boolean checkEmail(String email) {
        return memberMapper.findByEmail(email) != null;

    }
    public MemberDTO findByEmail(String email) {
        return memberMapper.findByEmail(email);
    }
    // 인증번호 검증을 위한 메서드 추가
    public boolean verifyCode(String enteredCode) {
        // 실제로는 인증번호 검증을 위한 로직이 추가되어야 함
        // 예를 들어, 이메일을 통해 발송된 인증번호와 비교하는 로직
        String correctCode = "123456"; // 예시
        return enteredCode.equals(correctCode);
    }

}
