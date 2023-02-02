package com.jwl.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwl.spring.test.ajax.bo.PensionBO;
import com.jwl.spring.test.ajax.dao.PensionDAO;
import com.jwl.spring.test.ajax.model.Pension;

@Controller
@RequestMapping("/ajax/pension")
public class PensionController {
	
	@Autowired
	private PensionBO pensionBO;
	@GetMapping("/search")
	public String searchReservation() {
		
		return "ajax/pension/search";
	}
	
	@GetMapping("/list")
	public String listReservation(Model model) {
		
		//리스트 목록 보여주기 객체로 전달
		List<Pension> reservationList = pensionBO.getReserveList();
		
		model.addAttribute("reservation", reservationList);
		
		return "ajax/pension/list";
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String>deleteReservation(@RequestParam("id")int id) {
		int count = pensionBO.deleteReserveList(id);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;	
	}
	
	@GetMapping("/input")
	public String inputReservation() {
		
		return "ajax/pension/input";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String>addReservation(
			@RequestParam("name") String name
			,@RequestParam("date") String date
			,@RequestParam("day") int day
			,@RequestParam("headcount") int headcount
			,@RequestParam("phoneNumber") String phoneNumber) {
		int count = pensionBO.addReserve(name, date, day, headcount, phoneNumber);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
	@GetMapping("/find")
	@ResponseBody
	public Map<String, Object> searchReservation(
			@RequestParam("name")String name
			,@RequestParam("phoneNumber") String phoneNumber) {
		Pension reserve = pensionBO.searchReserveList(name, phoneNumber);
		
		//조회 성공하면 "result":"success", "data":booking}
		//조회 실패하면 "result":"fail"
		Map<String, Object> result = new HashMap<>();
		if(reserve != null) {
			result.put("result", "success");
			result.put("booking", reserve);
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
