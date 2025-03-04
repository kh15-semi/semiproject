package com.kh.academy.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "custom.cert")
public class CertProperties {
	private int expireMinutes;//custom.cert.expire-minutes 인증만료시간 (분 단위)
	private int expireAccept;//custom.cert.expire-accept 인증 승인 시간(분 단위)
}