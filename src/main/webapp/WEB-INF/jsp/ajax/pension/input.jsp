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
        	<div class="d-flex justify-content-center">
        		<div class="w-50">
		        	<label class="mt-3">이름</label> 
		        	<input type="text" class="form-control" id="nameInput">
		        	
		        	<label class="mt-3">예약날짜</label>
		        	<input type="text" class="form-control" id="dateInput">
		        	
		        	<label class="mt-3">숙박일수</label>
		        	<input type="text" class="form-control" id="dayInput">
		        	
		        	<label class="mt-3">숙박인원</label> 
		        	<input type="text" class="form-control" id="headcountInput">
		        	
		        	<label class="mt-3">전화번호</label>
		        	<input type="text" class="form-control" id="phoneNumberInput">
		        	
		        	<button type="submit" class="btn btn-warning btn-block mt-3" id="reserveBtn">예약하기</button>
        		</div>
        	</div>
        </section>
        <jsp:include page="footer.jsp"/>
    </div>
    <script>
    	$(document).ready(function(){
    		$("#reserveBtn").on("click",function(){
    			let name = $("#nameInput").val();
        		let date = $("#dateInput").val();
        		let day = $("#dayInput").val();
        		let headcount = $("#headcountInput").val();
        		let phoneNumber = $("#phoneNumberInput").val();
        		
        		if(name == ""){
        			alert("이름을 입력하세요");
        			return;
        		}
        		if(date == ""){
        			alert("날짜를 입력하세요");
        			return;
        		}
        		if(day == ""){
        			alert("일수를 입력하세요");
        			return;
        		}
        		// day 가 숫자가 아닌경우 유효성 검사
        		// Not a Number
        		if(isNaN(day)){
        			alert("숙박일수는 숫자만 입력하세요");
        			return;
        			
        		}
        		if(headcount == ""){
        			alert("인원수를 입력하세요");
        			return;
        		}
        		if(isNaN(headcount)){
        			alert("인원수는 숫자만 입력하세요");
        			return;
        		}
        		if(phoneNumber == ""){
        			alert("전화번호를 입력하세요");
        			return;
        		}
    		
	    		$.ajax({
	    			type:"post"
	    			, url: "/ajax/pension/add"
	    			, data: {"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
	    			, success:function(data){
	    				if(data.result == "success"){
	    					location.href = "/ajax/pension/list";
	    				}else{
	    					alert("저장실패");
	    				}
	    			}
	    			, error:function(){
	    				alert("예약 실패");
	    			}
	    		 });
    		});
    	});
    </script>
</body>
</html>