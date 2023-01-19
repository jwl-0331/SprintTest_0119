package com.jwl.spring.test.database.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jwl.spring.test.database.model.Store;

//DATABASE -> Repository 에서 데이터 처리문을
//쿼리문을 Mybatis frame work(XML) 을 통해 불러온다
@Repository
public interface StoreDAO {
	public List<Store> selectStoreList();
}