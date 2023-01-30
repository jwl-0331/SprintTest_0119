package com.jwl.spring.test.jstl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jwl.spring.test.jstl.model.Review;

@Repository
public interface ReviewDAO {
	public List<Review> selectReview(@Param("storeId")int storeId);
}
