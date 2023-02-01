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
		
		result.put("is_duplicate", favoriteBO.isDuplicateAddress(address));
		
		return result;
	}
	@GetMapping("/input")
	public String favoriteInput() {
		return "ajax/favorite/input";
	}
	
	//삭제 API  (링크 삭제 방법도 있음)
	//id 를 전달받고 , 해당 행을 삭제하는 API
	@GetMapping("/delete")
	public Map<String, String>deleteFavorite(
			@RequestParam("id")int id) {
		
		int count = favoriteBO.deleteFavorite(id);
		Map<String, String> map = new HashMap<>();
		//삭제 성공시 {"result":"success"}
		//실패시 {"result":"fail"}
		
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
		
	}
}
