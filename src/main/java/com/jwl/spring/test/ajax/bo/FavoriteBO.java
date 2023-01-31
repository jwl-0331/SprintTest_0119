package com.jwl.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.ajax.dao.FavoriteDAO;
import com.jwl.spring.test.ajax.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	public List<Favorite> getFavorite(){
		return favoriteDAO.selectFavorite();
	}
	
	public int addFavoriteList(
			String name
			, String address) {
		return favoriteDAO.insertFavorite(name, address);
	}
}
