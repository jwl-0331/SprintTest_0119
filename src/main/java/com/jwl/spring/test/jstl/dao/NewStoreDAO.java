package com.jwl.spring.test.jstl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jwl.spring.test.database.model.Store;

@Repository
public interface NewStoreDAO {
	
	public List<Store> selectStore();
}
