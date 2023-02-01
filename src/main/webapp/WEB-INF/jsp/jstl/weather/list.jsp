<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 리스트</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/jstl/weather/style.css" type="text/css"> 
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex">
		<nav class="main-menu">
			<div class="d-flex mt-2 justify-content-center">
				<div class="col-2">
					<img width="25" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20100201_49%2Ffuddkdi_1265016788801zYqCq_png%2F%25B1%25E2%25BB%25F3%25C3%25BB_fuddkdi.png&type=a340">
				</div>
				<h4 class="text-white col-7">기상청</h4> 
			</div>
			<%-- 가로 배치를 세로배치로 바꾼다 : flex-column --%>
			<ul class="nav flex-column">
				<li class="nav-item"><a href="/jstl/weather/list" class="nav-link text-white">날씨</a></li>
				<li class="nav-item"><a href="/jstl/weather/input" class="nav-link text-white">날씨입력</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">테마날씨</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">관측기후</a></li>
			</ul>
		</nav>
		<article class="main-contents">
			<h3 class="ml-3">과거 날씨</h3>
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="weather" items="${weatherHistory}">
					<tr>
						<fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd" var="weatherDate"/>
						<td><fmt:formatDate value="${weatherDate}" pattern="yyyy년 MM월dd일"/></td>
						<c:choose>
							<c:when test="${weather.weather eq '맑음'}">
								<td><img src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg"></td>
							</c:when>
							<c:when test="${weather.weather eq '구름조금' }">
								<td><img src="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg"></td>
							</c:when>
							<c:when test="${weather.weather eq '흐림' }">
								<td><img src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg"></td>
							</c:when>
							<c:when test="${weather.weather eq '비' }">
								<td><img src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg"></td>
							</c:when>
							<c:otherwise>
								${weather.weather}
							</c:otherwise>
						</c:choose>
						<td>${weather.temperatures }℃</td>
						<td>${weather.precipitation }mm</td>
						<td>${weather.microDust }</td>
						<td>${weather.windSpeed }km/h</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
		</section>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>