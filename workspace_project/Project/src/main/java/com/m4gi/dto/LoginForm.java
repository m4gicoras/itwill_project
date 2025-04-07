package com.m4gi.dto;

import lombok.Data;

/*
 * DTO for MainController
 * */
@Data
public class LoginForm {
    private String username;
    private String password;
    private String saveId;
}
