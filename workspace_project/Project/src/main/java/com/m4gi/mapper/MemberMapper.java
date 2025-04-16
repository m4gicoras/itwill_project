package com.m4gi.mapper;

import persistence.MemberDTO;

public interface MemberMapper {
    MemberDTO findByEmail(String email);
}
