package com.jwl.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jwl.spring.test.ajax.model.Pension;

@Repository
public interface PensionDAO {
	
	public List<Pension> selectReserveList();
	
	public int deleteReserveList(@Param("id")int id);
}
