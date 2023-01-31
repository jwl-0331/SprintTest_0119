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
		<input class="form-control" type="text" name = "address" id="addressInput">
		<button class="btn btn-success btn-block mt-3" id="saveBtn" type="submit">추가</button>
	</div>
	<script>
		$(document).ready(function(){
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
				if(address.startsWith("http://")){
					alert("주소를 확인하세요");
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
				});
			});
		});
	</script>
	
</body>
</html>