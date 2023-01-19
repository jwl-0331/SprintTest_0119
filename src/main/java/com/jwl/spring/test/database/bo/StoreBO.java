package com.jwl.spring.test.database.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.database.dao.StoreDAO;
import com.jwl.spring.test.database.model.Store;

//BO(Service) -> 로직 구성 
// 데이터 (for , if etc) 
// DAO 데이터를 요청한다
@Service
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO;
	public List<Store>getStoreList() {
		
		List<Store> storeList = storeDAO.selectStoreList();
		
		return storeList;
	}
}