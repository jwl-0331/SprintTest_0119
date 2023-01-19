package com.jwl.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jwl.spring.test.mybatis.model.Realestate;

public interface RealestateDAO {
	
	public Realestate selectRealestate(@Param("id")int id);
	
	public List<Realestate> selectRealestateAsRent(@Param("rentPrice")int rentPrice);
	
	public List<Realestate> selectRealestateAsArea(@Param("area") int area, @Param("price") int price);
	
}
