package com.jwl.spring.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jwl.spring.test.mybatis.bo.RealestateBO;
import com.jwl.spring.test.mybatis.model.Realestate;


//컨트롤러 request,respond
@RestController
@RequestMapping("/mybatis/test01")
public class RealestateController {
	
	//id를 리퀘스트파마리터로 전달받고 조회결과 json으로
	@Autowired
	private RealestateBO realestateBO;
	@RequestMapping("/1")
	public Realestate test01(@RequestParam("id")int id) {
		
		Realestate realestate = realestateBO.getRealestate(id);
		
		return realestate;
	}
	
	@RequestMapping("/2")
	public List<Realestate>test01_2(@RequestParam(value="rent")int rentPrice) {
		List<Realestate> realestateList = realestateBO.getRealestateAsRent(rentPrice);
		return realestateList;
	}
	
	@RequestMapping("/3")
	public List<Realestate> test01_3(
			@RequestParam(value="area")int area
			, @RequestParam(value="price")int price) {
		List<Realestate> realestateList = realestateBO.getRealestateAsArea(area, price);
		return realestateList;
	}
}
