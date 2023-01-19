package com.jwl.spring.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwl.spring.test.database.bo.StoreBO;
import com.jwl.spring.test.database.model.Store;

@Controller
//컨트롤러 역할 -> request response 이외 X
//요청해서 보내고 응답 화면을 보여준다
//Controller -> Service(BO),(logic)

public class StoreController {

	@Autowired
	private StoreBO storeBO;
	@ResponseBody
	@RequestMapping("/database/test01")
	public List<Store> test01() {
		List<Store> storeList = storeBO.getStoreList();
		return storeList;
	}
}