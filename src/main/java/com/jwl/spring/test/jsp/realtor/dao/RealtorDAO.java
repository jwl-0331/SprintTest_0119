package com.jwl.spring.test.jsp.realtor.dao;


import org.springframework.stereotype.Repository;

import com.jwl.spring.test.jsp.realtor.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public int insertRealtorByObject(Realtor realtor);
}
