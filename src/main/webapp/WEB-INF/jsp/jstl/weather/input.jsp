<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨입력</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="crossorigin="anonymous"></script>        
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
				<ul class="nav flex-column">
					<li class="nav-item"><a href="/jstl/weather/list" class="nav-link text-white">날씨</a></li>
					<li class="nav-item"><a href="/jstl/weather/input" class="nav-link text-white">날씨입력</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white">테마날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white">관측기후</a></li>
				</ul>
			</nav>
			<article class="main-contents">
				<h3 class="ml-4 mt-5">날씨 입력</h3>
				<form method="get" action="/jstl/weather/add">
				<div class="d-flex ml-3 mt-5">
					<div class="d-flex align-itmes-center col-4">
						<label class="input-label col-3">날짜</label>
						<input type="text" class="form-control" id="date" name="date">
					</div>
					<div class="d-flex align-itmes-center col-4">
						<label class="input-label ml-5">날씨</label>
						<select class="form-control col-4 ml-4" name="weather">
							<option>맑음</option>
							<option>구름조금</option>
							<option>흐림</option>
							<option>비</option> 
						</select>
					</div>
					<div class="d-flex align-itmes-center col-4">
						<label class="input-label">미세먼지</label>
						<select class="form-control col-4 ml-4" name="microDust">
							<option>좋음</option>
							<option>보통</option>
							<option>나쁨</option>
							<option>최악</option>
						</select>
					</div>
				</div>
				<div class="d-flex justify-content-between mt-5">
	                        <div class="d-flex align-items-center">
	                            <label class="col-3">기온</label>
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="temperatures">
	                                <div class="input-group-append">
	                                    <span class="input-group-text">℃</span>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="d-flex align-items-center">
	                            <label class="col-3">강수량</label> 
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="precipitation">
	                                    <div class="input-group-append">
	                                        <span class="input-group-text">mm</span>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="d-flex align-items-center">
	                            <label class="col-3">풍속</label>
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="windSpeed">
	                                    <div class="input-group-append">
	                                        <span class="input-group-text">km/h</span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="text-right mt-4 mb-5">
	                        <input type="submit" class="btn btn-success" value="저장">
	                    </div>
	        	</form>
			</article>
		</section>
		<jsp:include page="footer.jsp"/>
	</div>
	<script>
    	// ready 함수: DOM tree가 모두 구성된 후 불려지는 함수
        $(document).ready(function() {

        $('#date').datepicker({
        	changeMonth: true,  // 월 셀렉트 박스 
            changeYear: true,   // 년 셀렉트 박스 
            dateFormat:"yy-mm-dd",  // 표시 포멧 
        	});
        });
    </script>
</body>
</html>