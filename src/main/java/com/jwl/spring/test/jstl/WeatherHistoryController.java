package com.jwl.spring.test.jstl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jwl.spring.test.jstl.bo.WeatherHistoryBO;
import com.jwl.spring.test.jstl.model.Weather;

@Controller
@RequestMapping("/jstl/weather")
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/list")
	public String weatherList(Model model) {
		
		List<Weather> weatherList = weatherHistoryBO.getWeatherHistory();
		
		model.addAttribute("weatherHistory", weatherList);
		
		return "jstl/weather/list";
	}
	@GetMapping("/add")
	public String addWeather(
			@DateTimeFormat(pattern="yyyy년 M월 d일")@RequestParam("date")Date date
			,@RequestParam("weather") String weather
			,@RequestParam("temperatures") double temperatures
			,@RequestParam("precipitation") double precipitation
			,@RequestParam("microDust") String microDust
			,@RequestParam("windSpeed") double windSpeed) {
		int count = weatherHistoryBO.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		return "redirect:/jstl/weather/list";
	}
	
	@GetMapping("/input")
	public String inputWeather() {
		return "jstl/weather/input";
	}
}
