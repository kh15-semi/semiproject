
package com.kh.academy.error;

public class TargetNotFoundException extends RuntimeException {
	public TargetNotFoundException() {
		super();
	}
	public TargetNotFoundException(String message) {
		super(message);
	}
}
