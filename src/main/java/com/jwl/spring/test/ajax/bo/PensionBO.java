package com.jwl.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.ajax.dao.PensionDAO;
import com.jwl.spring.test.ajax.model.Pension;

@Service
public class PensionBO {
	
	@Autowired
	private PensionDAO pensionDAO;
	public List<Pension> getReserveList(){
		return pensionDAO.selectReserveList();
	}
	
	public int deleteReserveList(int id) {
		return pensionDAO.deleteReserveList(id);
	}
}
