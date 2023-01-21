package com.jwl.spring.test.jsp.seller.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.jsp.seller.dao.SellerDAO;
import com.jwl.spring.test.jsp.seller.model.Seller;

@Service
public class SellerBO {
	//전달 받은 인자 DAO 에게 전달 쿼리로 추가 요청
	@Autowired
	private SellerDAO sellerDAO;
	public int addSeller(String nickname, double temperature, String profileImage) {
		return sellerDAO.insertSeller(nickname, temperature, profileImage);
		
	}
	
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	public Seller getSeller(int id) {
		return sellerDAO.selectSeller(id);
	}
}
