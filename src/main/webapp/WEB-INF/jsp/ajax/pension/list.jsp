<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/ajax/pension/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp"/>
        <jsp:include page="nav.jsp"/>
        <section>
        	<div class="text-center">
        		<h3 class="font-weight-bold mt-4 mb-4">예약 목록 보기</h3>
        	</div>
        	<table class="table">
        		<thead>
        			<tr>
        				<th>이름</th>
        				<th>예약날짜</th>
        				<th>숙박일수</th>
        				<th>숙박인원</th>
        				<th>전화번호</th>
        				<th>예약상태</th>
        				<th></th>
        			</tr>
        		</thead>
        		<tbody>
        			<c:forEach var="reservation" items="${reservation}">
        			<tr>
        				<td>${reservation.name}</td>
        				<fmt:parseDate value="${reservation.date }" pattern="yyyy-MM-dd" var="reservationDate"/>
        				<td><fmt:formatDate value="${reservationDate}" pattern="yyyy년 MM월dd일"/></td>
        				<td>${reservation.day }</td>
        				<td>${reservation.headcount }</td>
        				<td>${reservation.phoneNumber }</td>
        				<c:choose>
	        				<c:when test="${reservation.state  eq '대기중'}">
	        					<td class="text-info">${reservation.state }</td>
	        				</c:when>
	        				<c:when test="${reservation.state  eq '확정'}">
	        					<td class="text-success">${reservation.state }</td>
	        				</c:when>
	        				<c:otherwise>
	        					<td>${reservation.state }</td>
	        				</c:otherwise>
        				</c:choose>
        				<td><button type="button" data-reservation-id="${reservation.id }" class="btn btn-danger btn-sm deleteBtn">삭제</button></td>
        			</tr>
        			</c:forEach>
        		</tbody>
        	</table>
        </section>
        <jsp:include page="footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			$(".deleteBtn").on("click",function(){
				
				let id = $(this).data("reservation-id");
				$.ajax({
					type:"get"
					, url:"/ajax/pension/delete"
					, data:{"id":id}
					, success:function(data){
						if(data.result=="success"){
							location.reload();
						}else{
							alert("삭제 실패");
						}
					}
					, error:function(){
						alert("삭제 오류 발생");
					}
				});
			});
		});
	</script>
</body>
</html>