package com.jwl.spring.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jstl")
public class JSTLController {
	
	@GetMapping("/test01")
	public String test01() {
		return "jstl/test01";
	}
}
