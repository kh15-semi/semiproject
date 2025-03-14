package com.kh.academy.service;

import org.springframework.stereotype.Service;


@Service
public class CompanyService {
    // 전화번호 포맷팅 메서드 (10자리)
    public String formatPhoneNumber(String phoneNumber) {
        if (phoneNumber != null && phoneNumber.length() == 10) {
            // 예: 0212341234 -> 02-1234-1234
            return phoneNumber.replaceFirst("(\\d{2})(\\d{4})(\\d+)", "$1-$2-$3");
        }
        return phoneNumber; // 길이가 10자리가 아니면 원본 반환
    }
}
