package com.jwl.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.jwl.spring.test.jstl.dao.WeatherHistoryDAO;
import com.jwl.spring.test.jstl.model.Weather;

@Service
public class WeatherHistoryBO {
	
	@Autowired 
	private WeatherHistoryDAO weatherHistoryDAO;
	 
	public List<Weather> getWeatherHistory() {
		return weatherHistoryDAO.selectWeatherHistory();
	}
	
	public int addWeather(
			String date
			,String weather
			,double temperatures
			, double precipitation
			, String microDust
			, double windSpeed ) {
		return weatherHistoryDAO.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
	}
}
