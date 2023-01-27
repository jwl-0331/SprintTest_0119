package com.jwl.spring.test.jstl.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jwl.spring.test.jstl.model.Weather;

@Repository
public interface WeatherHistoryDAO {
	public List<Weather> selectWeatherHistory();
	
	public int insertWeather(
			@Param("date")Date date
			,@Param("weather")String weather
			,@Param("temperatures")double temperatures
			,@Param("precipitation") double precipitation
			,@Param("microDust") String microDust
			,@Param("windSpeed") double windSpeed);
}
