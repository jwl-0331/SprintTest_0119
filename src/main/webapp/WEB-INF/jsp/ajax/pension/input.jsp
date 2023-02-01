<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
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
        		<h3 class="font-weight-bold mt-4 mb-4">예약하기</h3>
        	</div>
        	<label class="mt-3">이름</label> <br>
        	<input type="text" class="form-control">
        	<label class="mt-3">예약날짜</label> <br>
        	<input type="text" class="form-control">
        	<label class="mt-3">숙박일수</label> <br>
        	<input type="text" class="form-control">
        	<label class="mt-3">숙박인원</label> <br>
        	<input type="text" class="form-control">
        	<label class="mt-3">전화번호</label> <br>
        	<input type="text" class="form-control">
        	<button type="submit" class="btn form-control">예약하기</button>
        	
        </section>
        <jsp:include page="footer.jsp"/>
    </div>
    <script>
    	
    </script>
</body>
</html>