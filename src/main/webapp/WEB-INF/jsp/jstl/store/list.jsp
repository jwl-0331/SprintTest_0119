<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 가게 리스트 페이지</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/jstl/store/style.css" type="text/css"> 
</head>
<body>
	<div id="wrap">
		<header class="bg-info d-flex align-items-center">
			<h2 class="text-white ml-4">배탈의 민족</h2>
		</header>
		<section class="contents mb-3">
			<div class="display-4 mt-2">
				우리동네 가게
			</div>
			<c:forEach var="store" items="${storeList}">
			<a href="/jstl/store/review?storeId=${store.id}&storeName=${store.name }" class="store-link">
				<div class="border border-info rounded mt-3 p-3">
					<h4>${store.name }</h4>
					<div>전화번호 : ${store.phoneNumber }</div>
					<div>주소 : ${store.address }</div>
				</div>
			</a>
			</c:forEach>
		</section>
		<footer>
			<hr>
            <h5>(주)우와한형제</h5>
            <div class="text-secondary">고객센터 : 1500-1500</div>
		</footer>
	</div>
</body>
</html>