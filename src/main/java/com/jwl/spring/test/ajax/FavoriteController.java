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

import com.jwl.spring.test.ajax.bo.FavoriteBO;
import com.jwl.spring.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	@GetMapping("/list")
	public String favoriteList(Model model) {
		
		List<Favorite> favorite = favoriteBO.getFavorite(); 
		
		model.addAttribute("favorite", favorite);
		return "ajax/favorite/list";
	}
	
	//즐겨찾기 추가 api
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> addFavorite(
			@RequestParam("name")String name
			,@RequestParam("address") String address) {
		int count = favoriteBO.addFavoriteList(name, address);
		
		Map<String,String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else{
			result.put("result", "fail");
		}
		
		return result;
	}
	
	//중복확인 API  -> 주소를 전달 받아서 데이터에 있는지 확인하고 JSON 형태로 전달해준다
	@PostMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean>isDuplicateAddress(
			@RequestParam("address") String address) {
		
		Map<String,Boolean> result = new HashMap<>();
		
		 if(favoriteBO.isDuplicateAddress(address)) {
			 result.put("is_duplicate", true);
		 }else {
			 result.put("is_duplicate", false);
		 }
		
		return result;
	}
	@GetMapping("/input")
	public String favoriteInput() {
		return "ajax/favorite/input";
	}
}
