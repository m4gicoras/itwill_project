package com.m4gi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	// http://localhost:8088/web/main
	@GetMapping("/main")
	public String main() {
		return "main";
	}
}
