package com.jwl.spring.test.jsp.seller.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jwl.spring.test.jsp.seller.model.Seller;

@Repository
public interface SellerDAO {
	
	public int insertSeller(
			@Param("nickname")String nickname
			,@Param("temperature") double temperature
			,@Param("profileImage") String profileImage);
	
	public Seller selectLastSeller();
	
	public Seller selectSeller(@Param("id")int id);
}
