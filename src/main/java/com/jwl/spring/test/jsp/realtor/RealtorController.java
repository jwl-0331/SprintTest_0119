package com.jwl.spring.test.jsp.realtor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jwl.spring.test.jsp.realtor.bo.RealtorBO;
import com.jwl.spring.test.jsp.realtor.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	//인자 받아와서 객체를 넘긴다
	@GetMapping("/add")
	public String addRealtor(
//			@RequestParam("office")String office
//			,@RequestParam("phoneNumber") String phoneNumber
//			,@RequestParam("address") String address
//			,@RequestParam("grade") String grade
			@ModelAttribute Realtor realtor
			, Model model){
//		Realtor realtor = new Realtor();
//		realtor.setOffice(office);
//		realtor.setPhoneNumber(phoneNumber);
//		realtor.setAddress(address);
//		realtor.setGrade(grade);
		
		realtorBO.addRealtorByObject(realtor);
		
		model.addAttribute("realtor", realtor);
		
		return "jsp/realtorinfo";
	}
	
	@GetMapping("/input")
	public String realtorInput() {
		return "jsp/realtor";
	}
}
