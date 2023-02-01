<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
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
            <section class="contents">
                <article class="main-image">
                    <img id="mainbanner" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg">
                </article>
                <article class="main-content bg-primary d-flex">
                    <div class="reserve-info col-4 d-flex justify-content-center align-items-center">
                        <div class="display-4 text-white">
                            실시간<br>예약 하기
                        </div>
                    </div>
                    <div class="reserve-check col-5 p-4">
                        <div class="d-flex align-items-end text-white">
                            <h3 class="mr-3">예약확인</h3>
                            <label>회원 <input type="radio" name="member" value="member"checked></label>
                            <label class="ml-2">비회원 <input type="radio" name="member" value="nonMember"></label>
                        </div>
                        
                        <div class="text-white mt-3" id="memberInput">
                            <div class="d-flex">
                                <label class="col-3" >아이디 : </label>
                                <input type="text" class="form-control col-9" id="idInput">
                            </div>
                            <div class="d-flex mt-2">
                                <label class="col-3">비밀번호 : </label>
                                <input type="text" class="form-control col-9" id="passwordInput">
                            </div>
                        </div>

                        <div class="text-white mt-3 d-none" id="nonMemberInput">
                            <!-- 비회원선택시 기존에 있던걸 숨겨둔 상태에서 보이게한다-->
                            <div class="d-flex">
                                <label class="col-3">이름 : </label>
                                <input type="text" class="form-control col-9" id="nameInput">
                            </div>
                            <div class="d-flex mt-2">
                                <label class="col-3">전화번호 : </label>
                                <input type="text" class="form-control col-9" id="phoneNumberInput">
                            </div>
                            <div class="d-flex mt-2">
                                <label class="col-3">날짜 : </label>
                                <input type="text" class="form-control col-9" id="date">
                            </div>
                        </div>
                        
                        <div class="d-flex justify-content-end mt-3">
                            <button type="button" class="btn btn-success" id="lookUpBtn">조회하기</button>
                        </div>
                    </div>
                    <div class="reserve-number col-3 d-flex justify-content-center align-items-center">
                        <div class="text-white">
                            <h2>예약문의:</h2>
                            <h1>010-<br>000-0000</h1>
                        </div>
                    </div>
                </article>
            </section>
            <jsp:include page="footer.jsp"/>
        </div>

        <script>
            $(document).ready(function(){
                var imageList = ["http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" 
                	, "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner2.jpg"
                	,"http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner3.jpg"
                	,"http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner4.jpg"];
                var currentIndex = 0;
                setInterval(function(){
                    if(currentIndex == imageList.length){
                        currentIndex = 0;
                    }
                    $("#mainbanner").attr("src",imageList[currentIndex++]);
                }, 3000);
                $("#lookUpBtn").on("click", function(){
                    let id = $("#idInput").val();
                    let password = $("#passwordInput").val();
                    let name = $("#nameInput").val();
                    let phoneNumber = $("#phoneNumberInput").val();
                    let dat = $("#date").val();
                    //회원이 선택된 경우
                    let type = $("input[name='member']:checked").val();
                    if(type == "member"){
                        if(id == ""){
                            alert("아이디를 입력하세요 ");
                            return;
                        }

                        if(password ==""){
                            alert("비밀번호를 입력하세요");
                            return;
                        }
                    }
                    //비회원이 선택된 경우
                    else{
                        if(name==""){
                            alert("이름을 입력하세요");
                            return;
                        }
                        
                        if(phoneNumber ==""){
                            alert("전화번호를 입력하세요");
                            return;
                        }

                        if(!phoneNumber.startsIuth("010")){
                            alert("010으로 시작하는 번호만 입력 가능합니다.");
                            return;
                        }

                        if(date == ""){
                            alert("날짜를 입력하세여");
                            return;
                        }
                    }

                });
                // $( "#datepickerStart" ).datepicker({
                //     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                //     dateFormat:"yyyy년 mm월 dd 일",
                //     showButtonPanel: true,
                //     currentText:"오늘",
                //     minDate:0,
                //     onSelect:function(getDate){
                //         //옵션을 바꾼다, min데이트 옵션을 , 값을 넣는다 
                //         $("#datepickerEnd").datepicker('option','minDate',getDate);
                //     }
                // })

                $("input[name='member']").on("change", function(){
                    //선택된 input 태그 가져오기
                    //이벤트 발생한것을 가져온다 -> this
                    let type = $(this).val();
                    if(type == "member"){
                        //멤버 인풋 보여주기
                        $("#memberInput").removeClass("d-none");
                        //논 멤버 인풋 숨기기
                        $("#nonMemberInput").addClass("d-none");

                    }else{
                        //논 멤버 인풋 보여주기
                        $("#nonMemberInput").removeClass("d-none");
                        $("#memberInput").addClass("d-none");
                    }
                });
            });
        </script>
    </body>
</html>