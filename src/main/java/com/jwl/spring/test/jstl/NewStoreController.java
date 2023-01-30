package com.jwl.spring.test.jstl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jwl.spring.test.database.model.Store;
import com.jwl.spring.test.jstl.bo.NewStoreBO;
import com.jwl.spring.test.jstl.bo.ReviewBO;

@Controller
@RequestMapping("/jstl/store")
public class NewStoreController {
	
	@Autowired
	private NewStoreBO newStoreBO;
	@Autowired
	private ReviewBO reviewBO;
	@GetMapping("/list")
	public String storeList(Model model) {
		
		//Store 객체로 받아온다 BO
		List<Store> storeList = newStoreBO.getStore();
		model.addAttribute("storeList", storeList);
		return "jstl/store/list";
	}
	
	@GetMapping("/review")
	public String review(
			@RequestParam("storeId") int storeId
			,@RequestParam("storeName") String storeName
			, Model model) {
		model.addAttribute("storeName", storeName);
		model.addAttribute("review", reviewBO.getReviewList(storeId));
		return "jstl/review/list";
	}
}
