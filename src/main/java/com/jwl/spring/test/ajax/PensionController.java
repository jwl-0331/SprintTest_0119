package com.jwl.spring.test.ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ajax/pension")
public class PensionController {
	
	
	@GetMapping("/search")
	public String searchReservation() {
		
		return "ajax/pension/search";
	}
}
