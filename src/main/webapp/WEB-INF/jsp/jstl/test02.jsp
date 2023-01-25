<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 2</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class = "container">
		<h1>HOT 5</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="music" items="${musicRanking}" varStatus="status">
				<tr>
					<td >${status.count}</td>
					<td >${music}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h1>멤버십</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${ membership }">
				<tr>
					<td>${member.name }</td>
					<td>${member.phoneNumber }</td>
					<c:choose>
						<c:when test="${member.grade eq 'VIP'}">
							<td class="text-danger">${member.grade }</td>
						</c:when>
						<c:when test="${member.grade eq 'GOLD' }">
							<td class="text-warning">${member.grade }</td>
						</c:when>						
						<c:otherwise>
							<td>${member.grade }</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${member.point >= 5000}">
							<td class="text-primary">${member.point }</td>
						</c:when>
						<c:otherwise>
							<td>${member.point }</td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>