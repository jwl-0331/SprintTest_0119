package com.jwl.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.database.model.Store;
import com.jwl.spring.test.jstl.dao.NewStoreDAO;

@Service
public class NewStoreBO {
	
	@Autowired
	private NewStoreDAO newStoreDAO;
	public List<Store> getStore(){
		return newStoreDAO.selectStore();
	}
}
