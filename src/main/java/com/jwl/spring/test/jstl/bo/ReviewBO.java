package com.jwl.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwl.spring.test.jstl.dao.ReviewDAO;
import com.jwl.spring.test.jstl.model.Review;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	public List<Review> getReviewList(int storeId){
		return reviewDAO.selectReview(storeId);
	}
}
