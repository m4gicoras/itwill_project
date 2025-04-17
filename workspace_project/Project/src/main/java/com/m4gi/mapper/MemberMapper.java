package com.m4gi.mapper;

import com.m4gi.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    MemberDTO findByEmail(String email);


}
