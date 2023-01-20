package com.jwl.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jwl.spring.test.mybatis.model.Realestate;

public interface RealestateDAO {
	
	public Realestate selectRealestate(@Param("id")int id);
	
	public List<Realestate> selectRealestateAsRent(@Param("rentPrice")int rentPrice);
	
	public List<Realestate> selectRealestateAsArea(
			@Param("area") int area
			, @Param("price") int price);
	public int insertRealestateByObject(Realestate realestate);
	
	public int insertRealestateByField(
			@Param("realtorId")int realtorId
			,@Param("address") String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") int rentPrice
			);
	
	public int updateRealestate(@Param("id")int id,@Param("type")String type,@Param("price")int price);
	
	public int deleteRealestate(@Param("id")int id);
}
