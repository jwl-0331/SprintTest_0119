<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<label>제목</label> 
		<input class="form-control" type="text" name ="name" id="nameInput">
		 
		<label class="mt-3">주소</label> 
		
		<div class="d-flex">
			<input class="form-control col-11" type="text" name ="address" id="addressInput">
			<button class="btn btn-info btn-block text-center ml-3" id="duplicateBtn">중복확인</button>
		</div>
		<div class= "small text-danger d-none" id="duplicateDiv">중복된 url 입니다.</div>
		<div class= "small text-info d-none" id="availableDiv">저장 가능한 url 입니다.</div>
		<button class="btn btn-success btn-block mt-3" id="saveBtn" type="submit">추가</button>
	</div>
	<script>
		$(document).ready(function(){
			//중복 체크 여부 확인 변수
			var isChecked = false;
			
			//url 중복 상태 저장변수 - 중복되어있다 초기 상태
			var isDuplicate = true;
			
			//해당 input의 수정이 생길떄마다 발생
			$("#addressInput").on("input", function(){
				// 중복체크 여부 과정을 모두 취소한다.
				isChecked = false;
				isDuplicate = true;
				
				$("#duplicateDiv").addClass("d-none");
				$("#availableDiv").addClass("d-none");
			});
			
			$("#duplicateBtn").on("click",function(){
				let address = $("#addressInput").val();
				
				if(address == ""){
					alert("주소를 입력하세요");
					return;
				}
				if(!(address.startsWith("http://") || address.startsWith("https://"))){
					alert("주소 형식을 확인하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/ajax/favorite/is_duplicate"
					, data:{"address":address}
					, success:function(data){
						//true -> 중복이다
						isChecked = true;
						if(data.is_duplicate == true){ //중복되었다
							$("#duplicateDiv").removeClass("d-none");
							$("#availableDiv").addClass("d-none");
							isDuplicate = true;
						}else{
							$("#availableDiv").removeClass("d-none");
							$("#duplicateDiv").addClass("d-none");
							isDuplicate = false;
						}
					}
					, error:function(){
						alert("추가 에러");
					}
					
				});
				
			});
			
			$("#saveBtn").on("click",function(){
				let name = $("#nameInput").val();
				let address = $("#addressInput").val();
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				if(address == ""){
					alert("주소를 입력하세요");
					return;
				
				}
				
				//https:// , http://  두가지만 통과
				if(!(address.startsWith("http://") || address.startsWith("https://"))){
					alert("주소 형식을 확인하세요");
					return;
				}
				
				// is checked -> false 이면 중복확인 alert
				// url 중복체크 했는지 유효성 검사
				if(!isChecked){
					alert("중복을 확인하세요");
					return;
				}
				
				//url이 중복되었는지 유효성검사
				if(isDuplicate){
					alert("url 중복되었습니다.");
					return;
				}
				
			
			
				$.ajax({
					type:"post"
					, url:"/ajax/favorite/add"
					, data:{"name": name, "address":address}
					, success:function(data){
						if(data.result == "success"){
							location.href = "/ajax/favorite/list";
						}else{
							alert("저장실패");
						}
					}
					, error:function(){
						alert("추가 에러");
					}
				});
			});
		});
	</script>
	
</body>
</html>