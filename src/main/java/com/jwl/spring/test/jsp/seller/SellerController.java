package com.jwl.spring.test.jsp.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwl.spring.test.jsp.seller.bo.SellerBO;
import com.jwl.spring.test.jsp.seller.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	@PostMapping("/add")
	@ResponseBody
	public String addSeller(
			@RequestParam("nickname")String nickname
			,@RequestParam("temperature") double temperature
			,@RequestParam("profileImage") String profileImage) {
		int count = sellerBO.addSeller(nickname, temperature, profileImage);
		return "추가 완료 : " + count;
	}
	
	@GetMapping("/input")
	public String sellerInput() {
		return "jsp/sellerinput";
	}
	
	@GetMapping("/info")
	// int id 는 null 저장 불가  따라서 Integer id 로 파라미터가없을떄 id 에 null 이라고 저장
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id
			, Model model) {
		Seller seller = null;
		if(id == null) {
			seller = sellerBO.getLastSeller();
	
		}else {
			 seller = sellerBO.getSeller(id);
		}
		model.addAttribute("seller", seller);
		return "jsp/selleroutput";
	}
}
