package com.m4gi.utill;

import org.hashids.Hashids;

public class HashId {
    public static void main(String[] args) {
    	// NON-NLS-1$ <- 국제화 경고땜에 적어둔거니 지우지마세용
        // 시드값(비밀키), 최소 길이 설정
        Hashids hashids = new Hashids("sellity-secret-key", 8); //$NON-NLS-1$

        // 숫자ID 해시ID로 변환
        String hashId = hashids.encode(123);

        // 다시 숫자로 복호화함
        long[] numbers = hashids.decode(hashId);

        System.out.println("Hash ID: " + hashId); //$NON-NLS-1$
        System.out.println("복호화된 숫자: " + numbers[0]); //$NON-NLS-1$
    }
}
