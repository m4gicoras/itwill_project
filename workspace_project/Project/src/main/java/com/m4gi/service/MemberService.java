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
        MemberDTO member = memberMapper.findByEmail(email);
        return member != null;

    }
}
