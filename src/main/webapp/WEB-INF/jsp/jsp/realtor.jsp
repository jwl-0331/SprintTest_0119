<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 추가</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<form method="get" action="/jsp/realtor/add">
		<div class="container">
			<h1>공인중개사 추가</h1>
			<label>상호명</label> <br>
			<input type="text" class="form-control col-6" name="office"> <br>
			<label>전화번호</label>
			<input type="text" class="form-control col-6" name="phoneNumber"> <br>
			<label>주소</label>
			<input type="text" class="form-control col-6" name="address"> <br>
			<label>등급</label>
			<input type="text" class="form-control col-6" placeholder="안심중개사, 일반중개사, 프리미엄중개사 " name="grade"> <br>
			<Button type="submit" class="btn btn-primary">추가</Button>
		</div>
	</form>
</body>
</html>