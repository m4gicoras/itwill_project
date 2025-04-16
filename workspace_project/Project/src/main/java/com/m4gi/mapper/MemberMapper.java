package com.m4gi.mapper;

import com.m4gi.dto.MemberDTO;

public interface MemberMapper {
    MemberDTO findByEmail(String email);
}
