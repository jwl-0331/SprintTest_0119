package com.jwl.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jwl.spring.test.ajax.model.Favorite;

@Repository
public interface FavoriteDAO {
	public List<Favorite> selectFavorite();
	
	public int insertFavorite(
			@Param("name")String name
			,@Param("address") String address);
	
	public int selectCountAddress(@Param("address")String address);
}
