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
	
	@RequestMapping("/test02/1")
	public String test02_1() {
		Realestate realestate = new Realestate();
		realestate.setRealtorId(3);
		realestate.setAddress("푸르지용 리버 303동 1104호");
		realestate.setArea(89);
		realestate.setType("매매");
		realestate.setPrice(100000);
		
		int count = realestateBO.addRealestateByObject(realestate);
		
		return "실행결과 : " + count; 
	}
	
	@RequestMapping("/test02/2")
	public String test02_2(@RequestParam(value="id")int realtorId) {
		
		int count = realestateBO.addRealestateByField(realtorId, "샹떼빌리버 오피스텔 814호",45,"월세",100000,120);
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/test03")
	public String test03(@RequestParam(value="id") int id
			, @RequestParam(value="type") String type
			, @RequestParam(value="price") int price) {
		int count = realestateBO.changeRealestate(id, type, price);
		return "수정 성공 : " + count;
	}
	
	@RequestMapping("/test04")
	public String test04(@RequestParam(value="id") int id) {
		int row = realestateBO.deleteRealestate(id);
		return "삭제 성공 : " + row;
	}
	
	
}
