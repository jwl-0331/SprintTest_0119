package com.jwl.spring.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jwl.spring.test.lifecycle.model.BoardContent;

@RestController
@RequestMapping("/lifecycle/test02")
public class Test02Controller {

	@RequestMapping("/1")
	public List<Map<String,Object>>movieList() {
		
		List<Map<String,Object>> movieList = new ArrayList<>();
		Map<String, Object> movie = new HashMap<>();
		movie.put("title", "기생충");
		movie.put("director", "봉준호");
		movie.put("time", 131);
		movie.put("rate", 15);
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("title", "인생은 아름다워");
		movie.put("director", "로베르토 베니니");
		movie.put("time", 116);
		movie.put("rate", 0);
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("title", "인셉션");
		movie.put("director", "크리스토퍼 놀란");
		movie.put("time", 147);
		movie.put("rate", 12);
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		movie.put("director", "윤종빈");
		movie.put("time", 133);
		movie.put("rate", 19);
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("title", "헝거게임");
		movie.put("director", "프란시스 로렌스");
		movie.put("time", 137);
		movie.put("rate", 15);
		movieList.add(movie);
		
		return movieList;
	}
	
	@RequestMapping("/2")
	public List<BoardContent> boardList() {
		
		List<BoardContent> boardList = new ArrayList<>();
		
		BoardContent content = new BoardContent();
		content.setTitle("안녕하세요 가입인사 드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		boardList.add(content);
		
		content = new BoardContent();
		content.setTitle("헐 대박");
		content.setUser("bada");
		content.setContent("오늘 목요일이 었어... 금요일인줄");
		boardList.add(content);
		
		content = new BoardContent();
		content.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		content.setUser("dulumary");
		content.setContent("....");
		boardList.add(content);
		
		return boardList;	
	}
	
	@RequestMapping("/3")
	public ResponseEntity<BoardContent> entity() {
		
		BoardContent content = new BoardContent();
		content.setTitle("안녕하세요 가입인사 드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		//RespinseEntity<BoardContent> entity = new ResponseEntity(content, HttpStatus.INTERNAL_SERVER_ERROR);
		//return entitiy;
		return new ResponseEntity<>(content, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
