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
	
	public List<Realestate> getRealestateAsRent(int rentPrice){
		List<Realestate> realestate = realestateDAO.selectRealestateAsRent(rentPrice);
		return realestate;
	}
	
	public List<Realestate> getRealestateAsArea(int area, int price){
		List<Realestate> realestateList = realestateDAO.selectRealestateAsArea(area,price);
		return realestateList;
	}
	
	//DAO 객체 넘겨서 INSERT
	public int addRealestateByObject(Realestate realestate) {
		int count = realestateDAO.insertRealestateByObject(realestate);
		return count;
	}
	
	public int addRealestateByField(int realtorId,String address,int area,String type,int price,int rentPrice) {
		int count = realestateDAO.insertRealestateByField(realtorId,address,area,type,price,rentPrice);
		return count;
	}
	
	public int changeRealestate(int id,String type, int price) {
		int count = realestateDAO.updateRealestate(id, type, price);
		return count;
	}
	
	public int deleteRealestate(int id) {
		int count = realestateDAO.deleteRealestate(id);
		return count;
	}
}
