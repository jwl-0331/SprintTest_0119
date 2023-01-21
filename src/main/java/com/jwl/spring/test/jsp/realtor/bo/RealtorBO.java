package com.jwl.spring.test.jsp.realtor.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.jsp.realtor.dao.RealtorDAO;
import com.jwl.spring.test.jsp.realtor.model.Realtor;

@Service
public class RealtorBO {
	
	@Autowired
	private RealtorDAO realtorDAO;
	public int addRealtorByObject(Realtor realtor) {
		return realtorDAO.insertRealtorByObject(realtor);
	}
}
