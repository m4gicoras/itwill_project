package com.m4gi.domain;

import lombok.Data;

@Data
public class Verification {
    private String email;
    private String code;

    public Verification(String email, String code) {
        this.email = email;
        this.code = code;
    }
}
