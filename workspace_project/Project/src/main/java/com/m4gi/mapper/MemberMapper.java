package com.m4gi.mapper;

import com.m4gi.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
    MemberDTO findByEmail(String email);

    //MemberDTO findByEmail(@Param("name") String name, @Param("email") String email);

}
