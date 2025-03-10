package com.kh.academy.aop;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import com.kh.academy.error.NoPermissionException;
import com.kh.academy.error.TargetNotFoundException;

@ControllerAdvice(annotations = {Controller.class})
public class ExceptionControllerAdvice {
	//@ExceptionHandler를 만들어서 컨트롤러처럼 구성하면 
	//해당 예외 발생 시 지정한 작업이 자동으로 실행된다
	//매개변수에 예외 객체를 선언하면 해당 예외 정보가 자동으로 들어온다
	
	@ExceptionHandler(NoPermissionException.class)
	public String noPermission(NoPermissionException e, Model model) {
		model.addAttribute("message", e.getMessage());
		return "/WEB-INF/views/error/no-permission.jsp";
	}
	
	@ExceptionHandler(TargetNotFoundException.class)
	public String notFound(TargetNotFoundException e, Model model) {
		model.addAttribute("message", e.getMessage());
		return "/WEB-INF/views/error/notfound.jsp";
	}
	//나머지 전체 예외에 대한 처리
		@ExceptionHandler(Exception.class)
		public String error(Exception e, Model model) {
			e.printStackTrace();
			model.addAttribute("message", e.getMessage());
			return "/WEB-INF/views/error/etc.jsp";
		}
	
	
}
