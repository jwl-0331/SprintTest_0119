package com.jwl.spring.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.mybatis.dao.RealestateDAO;
import com.jwl.spring.test.mybatis.model.Realestate;

//데이터를 불러와서 데이터 처리
@Service
public class RealestateBO {
	
	@Autowired
	private RealestateDAO realestateDAO;
	public Realestate getRealestate(int id) {
		Realestate realestate = realestateDAO.selectRealestate(id);
		
		return realestate;
	}
	
	public List<Realestate> getRealestateAsRent(int rentprice){
		List<Realestate> realestate = realestateDAO.selectRealestateAsRent(rentprice);
		return realestate;
	}
	
	public List<Realestate> getRealestateAsArea(int area, int price){
		List<Realestate> realestateList = realestateDAO.selectRealestateAsArea(area,price);
		return realestateList;
	}
}
