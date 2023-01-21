package com.jwl.spring.test.jsp.realtor.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jwl.spring.test.jsp.realtor.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public int insertRealtorByObject(Realtor realtor);
}
