<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<input type="hidden" value="${sessionScope.result}" id="result">

<style>
a {
	color: white;
	background-color: transparent;
}

a:hover {
	color: #555;
	cursor: pointer;
}

a:focus {
	-webkit-box-shadow: none;
	box-shadow: none;
}

.hashTag {
	color: hotpink;
}

.likeModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content */
.likeModal-content {
	background-color: #fefefe;
	margin: auto;
	border: 1px solid #888;
	width: 30%;
	height: 70%;
	overflow: auto;
}
/* The Close Button */
.close {
	color: #fefefe;
	float: right;
	font-size: 50px;
	font-weight: bold;
	right: 1.5%;
	top: 0%;
	cursor: pointer;
	background: 0 0;
	border: 0;
	cursor: pointer;
	height: 36px;
	outline: 0;
	position: absolute;
	z-index: 2;
}

/*id는 스타일 최우선으로 적용됨 그 다음에 class */
#carousel {
	position: relative;
	height: 600px;
	top: 50%;
	/* transform: translateY(-50%); */
	overflow: hidden;
}

#carousel article {
	height: 560px;
	width: 500px;
	position: absolute;
	/*  transition 변경되는 부분 width 1s만 쓰면 어색함 왜냐하면 width랑 height랑 2가지 요소가 바뀜 */
	transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s,
		height 1s;
	opacity: 1;
}

#carousel .imgDiv {
	height: 500px;
	width: 500px;
	transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s,
		height 1s;
}

#carousel .imgDiv img {
	height: 100%;
	width: 100%;
	object-fit: fill;
}

#carousel .hideLeft {
	height: 260px;
	width: 200px;
	left: 0%; /* 왼쪽 0으로 빠지는 애니메이션 효과 */
	opacity: 0; /*투명도 0으로 숨김처리 */
	transform: translateY(75%) translateX(-75%); /*부모기준으로 위치지정 */
}

#carousel .hideLeft header {
	height: 60px;
	width: 200px;
	left: 0%; /* 왼쪽 0으로 빠지는 애니메이션 효과 */
	opacity: 0; /*투명도 0으로 숨김처리 */
}

#carousel .hideLeft .imgDiv {
	height: 200px;
	width: 200px;
	opacity: 0; /*투명도 0으로 숨김처리 */
}

#carousel .hideLeft img {
	height: 170px;
	width: 100%;
	object-fit: fill;
}

#carousel .hideRight {
	height: 260px;
	width: 200px;
	left: 100%;
	opacity: 0;
	transform: translateY(75%) translateX(-75%);
}

#carousel .hideRight header {
	height: 60px;
	width: 200px;
	left: 100%;
	opacity: 0;
}

#carousel .hideRight .imgDiv {
	height: 200px;
	width: 200px;
	opacity: 0;
}

#carousel .hideRight img {
	height: 170px;
	width: 100%;
	object-fit: fill;
}

#carousel .prev {
	height: 460px;
	width: 400px;
	z-index: 5;
	left: 30%;
	transform: translateY(50px) translateX(-50%);
}

#carousel .prev header {
	height: 60px;
	width: 400px;
	z-index: 5;
	left: 30%;
}

#carousel .prev .imgDiv {
	height: 400px;
	width: 400px;
	z-index: 5;
}

#carousel .prev img {
	height: 370px;
	width: 100%;
	object-fit: fill;
}

#carousel .prevLeftSecond {
	height: 360px;
	width: 300px;
	z-index: 4;
	left: 20%;
	opacity: .7;
	transform: translateY(33%) translateX(-50%);
}

#carousel .prevLeftSecond header {
	height: 60px;
	width: 300px;
	z-index: 4;
	left: 20%;
	opacity: .7;
}

#carousel .prevLeftSecond .imgDiv {
	height: 300px;
	width: 300px;
	z-index: 4;
	opacity: .7;
}

#carousel .prevLeftSecond img {
	height: 270px;
	width: 100%;
	object-fit: fill;
}
/*가운데 이미지 */
#carousel .selected {
	height: 560 px;
	width: 500px;
	z-index: 10;
	left: 50%;
	transform: translateY(0px) translateX(-50%);
}

#carousel .selected header {
	height: 60px;
	width: 500px;
	z-index: 10;
	left: 50%;
}

#carousel .selected .imgDiv {
	height: 500px;
	width: 500px;
	z-index: 10;
}

#carousel .selected img {
	height: 470px;
	width: 100%;
	object-fit: fill;
}

#carousel .next {
	height: 460px;
	width: 400px;
	z-index: 5;
	left: 70%;
	transform: translateY(50px) translateX(-50%);
}

#carousel .next header {
	height: 60px;
	width: 400px;
	z-index: 5;
	left: 70%;
}

#carousel .next .imgDiv {
	height: 400px;
	width: 400px;
	z-index: 5;
}

#carousel .next img {
	height: 370px;
	width: 100%;
	object-fit: fill;
}

#carousel .nextRightSecond {
	height: 360px;
	width: 300px;
	z-index: 4;
	left: 80%;
	transform: translateY(33%) translateX(-50%);
	opacity: .7;
}

#carousel .nextRightSecond header {
	height: 60px;
	width: 300px;
	z-index: 4;
	left: 80%;
	opacity: .7;
}

#carousel .nextRightSecond .imgDiv {
	height: 300px;
	width: 300px;
	z-index: 4;
	opacity: .7;
}

#carousel .nextRightSecond img {
	height: 270px;
	width: 100%;
	object-fit: fill;
}
/* 사진 넘기기 버튼 */
.buttons {
	position: absolute;
	left: 47%;
	bottom: 30%;
}

.fa {
	font-size: 19px;
	border: 0;
}

#carousel>article>header {
	height: 60px;
	background-color: white;
	transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s,
		height 1s;
}

a, a:visited {
	text-decoration: none !important;
}

._622au {
	padding: 0
}

._9dpug {
	border-bottom: 1px solid #efefef
}

._9dpug._msz04 {
	height: 76px;
	padding: 0 16px 16px
}

._5mwg7 {
	height: 60px;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	position: absolute
}

._ebcx9 {
	padding: 0 16px
}

._8oo9w {
	margin-top: 4px
}

._nlmjy {
	margin-bottom: 8px
}

._277v9 {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	min-height: 0;
	overflow: auto
}

._277v9, ._6d44r {
	margin-bottom: 4px
}

._ti7l3 {
	margin-top: 4px
}

._e34hf {
	display: none
}

._fsupd ._ti7l3 {
	min-height: 48px
}

._5lms4 ._ti7l3 {
	padding-right: 26px
}

._fsupd ._9dpug {
	padding-right: 40px
}

._fsupd ._5mwg7 {
	right: 10px;
	top: 0
}

._5lms4 ._5mwg7 {
	bottom: 0;
	height: 52px;
	right: 10px;
	top: auto
}

._8n9ix._9445e ._8oo9w {
	margin-top: -34px
}

._4kplh {
	width: 100%
}

._4kplh ._sxolz {
	background-color: #000;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin-right: 335px;
	min-height: 450px
}

._4kplh ._sxolz._mi48x {
	background-color: #fafafa
}

._4kplh ._9dpug {
	border-bottom: 1px solid #efefef;
	height: 78px;
	margin-right: 0;
	padding: 20px 0;
	position: absolute;
	right: 24px;
	top: 0;
	width: 287px
}

._4kplh ._9dpug._msz04 {
	height: 98px;
	padding: 0 0 20px
}

._4kplh ._ebcx9 {
	bottom: 0;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	padding-left: 24px;
	padding-right: 24px;
	position: absolute;
	right: 0;
	top: 78px;
	width: 335px
}

._4kplh ._ebcx9._6zn4x {
	top: 98px
}

._4kplh ._8oo9w {
	border-top: 1px solid #efefef;
	margin: 0;
	-webkit-box-ordinal-group: 3;
	-webkit-order: 2;
	-ms-flex-order: 2;
	order: 2;
	padding-top: 2px
}

._4kplh ._nlmjy {
	margin-bottom: 4px;
	-webkit-box-ordinal-group: 4;
	-webkit-order: 3;
	-ms-flex-order: 3;
	order: 3
}

._4kplh ._277v9 {
	margin: 0 -24px auto;
	-webkit-box-ordinal-group: 2;
	-webkit-order: 1;
	-ms-flex-order: 1;
	order: 1;
	padding: 12px 24px
}

._4kplh ._6d44r {
	margin-bottom: 0;
	-webkit-box-ordinal-group: 5;
	-webkit-order: 4;
	-ms-flex-order: 4;
	order: 4
}

._4kplh ._ti7l3 {
	-webkit-box-ordinal-group: 6;
	-webkit-order: 5;
	-ms-flex-order: 5;
	order: 5
}

._4kplh._5lms4 ._5mwg7 {
	right: 18px
}

@media ( -webkit-min-device-pixel-ratio :2) {
	._8n9ix ._9dpug {
		border-bottom-width: .5px
	}
}

._7b8eu, ._csp04 {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

._7b8eu {
	height: 60px;
	padding: 16px;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center
}

._iuvin button {
	line-height: 18px;
	padding: 0
}

._csp04 {
	-webkit-box-align: baseline;
	-webkit-align-items: baseline;
	-ms-flex-align: baseline;
	align-items: baseline
}

._6y8ij {
	max-width: 100%
}

._s7b66 {
	display: inline
}

._74oom {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-align: baseline;
	-webkit-align-items: baseline;
	-ms-flex-align: baseline;
	align-items: baseline;
	max-width: 240px
}

._j56ec {
	-webkit-box-align: start;
	-webkit-align-items: flex-start;
	-ms-flex-align: start;
	align-items: flex-start;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	margin-left: 12px;
	overflow: hidden
}

._k32zm {
	padding-top: 20px
}

._60iqg {
	display: block;
	max-width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

._eeohz {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	max-width: 100%
}

._iadoq, ._iadoq:visited {
	color: #262626;
	-webkit-box-flex: 0;
	-webkit-flex-grow: 0;
	-ms-flex-positive: 0;
	flex-grow: 0;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1
}

._hz9vr {
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	margin-left: 5px
}

._elp6f {
	color: #999;
	display: inline-block;
	max-width: 100%
}

._82odm {
	-webkit-align-self: center;
	-ms-flex-item-align: center;
	align-self: center;
	display: block;
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none
}

._qtgjd {
	cursor: pointer
}

._15vpm {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-tap-highlight-color: transparent;
	-webkit-touch-callout: none
}

._pg23k {
	background-color: #fafafa;
	border-radius: 50%;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	display: block;
	-webkit-box-flex: 0;
	-webkit-flex: 0 0 auto;
	-ms-flex: 0 0 auto;
	flex: 0 0 auto;
	overflow: hidden;
	position: relative
}

._pg23k::after {
	border: 1px solid rgba(0, 0, 0, .0975);
	border-radius: 50%;
	bottom: 0;
	content: "";
	left: 0;
	pointer-events: none;
	position: absolute;
	right: 0;
	top: 0
}

._jpwof {
	cursor: pointer
}

._rewi8 {
	height: 100%;
	width: 100%
}

._2g7d5 {
	font-weight: 600;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	padding-left: 5px;
	margin-left: -5px
}

/* header, header>div{-webkit-box-align:stretch;-webkit-align-items:stretch;-ms-flex-align:stretch;align-items:stretch;border:0 solid #000;-webkit-box-sizing:border-box;box-sizing:border-box;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;margin:0;padding:0;} */
span {
	display: inline-block;
}

.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 18px;
	line-height: 1.428571429;
	border-radius: 15px;
}

label.btn.btn-default.btn-circle.focus {
	outline: none;
}

.imgDiv {
	position: relative;
	background-color: black;
}

#wordchart {
	height: 900px;
	margin: 20px
}
</style>
<script>
//postid 가져와서 댓글달기
$(document).ready(function() {
						console.log($('#result').val())
						if ($('#result').val() == "F") {
							alert('이미 연동된 계정 입니다. 다른 아이디를 등록 하세요.')
							<%session.removeAttribute("result");%>}
						//이미지 class명부여
						//postModal("main");
						$("#carousel").on("mousewheel", function(e) {
							var event = e.originalEvent;
							var delta = event.wheelDelta;

							if (delta > 0) {//휠 위로 하면 delta >0
								moveToSelected('prev');
							} else {//휠 위로 하면 delta <0
								moveToSelected('next');
							}
						});
						//   <- , -> 키보드 화살표로 이동
						$(document).keydown(function(e) {
							switch (e.which) {
							case 37: // left
								moveToSelected('prev');
								break;
							case 39: // right
								moveToSelected('next');
								break;
							default:
								return;
							}
							e.preventDefault();
						});

						$('#carousel article').not(".selected").click(
								function(e) {
									if ($(this).hasClass("hideLeft")) {
										moveToSelected($(".hideLeft:eq(0)"));
									} else {
										moveToSelected($(this));
									}
								});
						
						  ///워드 차트 기능
							$.ajax({
								  url : "/picsion/picture/tagList.ps",
								  success : function(data){
									  var text=data.wordChartList;
									  var data = Highcharts.reduce(text, function(arr, word) {
											var obj = Highcharts.find(arr,
													function(obj) {
														return obj.name === word;
													});
											if (obj) {
												obj.weight += 1;
											} else {
												obj = {
													name : word,
													weight : 1
												};
												arr.push(obj);
											}
											return arr;
										}, 
								[]);

								Highcharts.chart('wordchart', {
									plotOptions: {
								        series: {
								            cursor: 'pointer',
								            point: {
								                events: {
								                    click: function () {
								                    	location.href="/picsion/picture/tagpicList.ps?tag="+$(this)[0].name;
								                    }
								                }
								            }
								        }
								    },
									series : [ {
										type : 'wordcloud',
										data : data,
										name : '태그'
									} ],
									title : {
										text : '인기 태그'
									}
								});
								  },
								  error: function(){
								   	  alert("천천히!!");
								  }
							})
						
					

	//css - 카테고리별 게시물 필터링
	var all = $("#carousel").children(); //초기값
	function cateClick(thisTag) {
		var customType = $(thisTag).data("filter");
		console.log(customType);
		//보고있던 이미지값 저장
		var currentTitle = $(".selected").children("div").children("img").data(
				"postid");

		$("#carousel").children().remove(); //다 지우기
		$("#carousel").prepend(all); //초기값 넣기

		if (customType === "all") {

		} else {
			$(".post").not("article[data-filter='" + customType + "']")
					.remove(); //customType 일치하지않는 요소 삭제
		}
		$("#carousel").children().removeClass(); //기존 클래스명 삭제
		moveToSelected($("#carousel").children().eq(1));
		//삭제한 다음에 들어가는거라서 다시 클릭함수를 선언함
		$('#carousel article').not(".selected").click(function() {
			if ($(this).hasClass("hideLeft")) {
				moveToSelected($(".hideLeft:eq(0)"));
			} else {
				moveToSelected($(this));
			}
		});

		//이전 선택한 이미지가 있을 경우
		if ($(".post>div>img[data-postid=" + currentTitle + "]")[0] != undefined) {
			$(".post>div>img[data-postid=" + currentTitle + "]").parent()
					.parent().trigger("click");
		}
	}

	function moveToSelected(element) {
		if (element == "next") {
			var selected = $(".selected").next();
		} else if (element == "prev") {
			var selected = $(".selected").prev();
		} else {
			var selected = element;
		}

		var next = $(selected).next();
		var prev = $(selected).prev();
		var prevSecond = $(prev).prev();
		var nextSecond = $(next).next();

		//기존 클래스 삭제, post클래스와 새로운 클래스 추가(2개 추가 구분은 공백)
		$(selected).removeClass().addClass("post selected");
		$(prev).removeClass().addClass("post prev");
		$(next).removeClass().addClass("post next");
		$(nextSecond).removeClass().addClass("post nextRightSecond");
		$(prevSecond).removeClass().addClass("post prevLeftSecond");
		$(nextSecond).nextAll().removeClass().addClass('post hideRight');
		$(prevSecond).prevAll().removeClass().addClass('post hideLeft');

		//클릭이벤트 할당
		$(".post").unbind("click");
		//postModal("main");
		$('#carousel article').not(".selected").click(function(e) {
			if ($(this).hasClass("hideLeft")) {
				moveToSelected($(".hideLeft:eq(0)"));
			} else {
				moveToSelected($(this));
			}
		});

		/* prev, next 아이콘 클릭 사진이동  */
		$('#prev').click(function() {
			moveToSelected('prev');
		});
		$('#next').click(function() {
			moveToSelected('next');
		});
	}

	function prevPost(curObj) {
		curObj.prev().click();
		$(".selected > div").children().click();
	}
	function nextPost(curObj) {
		curObj.next().click();
		$(".selected > div").children().click();
	}
	
	
	$( "#carousel" ).hover(
			function(){$('body').css("overflow","hidden")},
			function(){$('body').css("overflow","visible")	}
	);
	
	
})
</script>
<c:choose>
<c:when test="${sessionScope.user eq null}">

		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                
              <c:forEach items="${ranPicture}" var="randPic" varStatus='status'>
				<c:choose>
					<c:when test="${status.index eq 0}">
						<div class="carousel-item active">
                        <div class="page-header header-filter"data-parallax="true" style="background-image: url('${randPic.picWater}');">
                            
                            <div class="container">
							<div class="row">
								<div class="col-md-8 ml-auto mr-auto text-center">
									<div class="brand">
										<h1 class="title">Sell Your Picture!</h1>
										<h4><b>PICSION</b>을 통해 당신의 꿈을 보여주세요</h4>
									</div>
								</div>
							</div>
							</div>
                            
                        </div>
                    </div>	
								
					</c:when>
					<c:otherwise>
						
						  <div class="carousel-item">
                        <div class="page-header header-filter"data-parallax="true" style="background-image: url('${randPic.picWater}');">
                           
                        </div>
                    </div>
						
						
					</c:otherwise>
				</c:choose>
			</c:forEach>
                  
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <i class="material-icons">keyboard_arrow_left</i>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <i class="material-icons">keyboard_arrow_right</i>
                    <span class="sr-only">Next</span>
                </a>
            </div>
		</c:when>
		<c:otherwise>
		   <div id="changemain" class="page-header header-filter clear-filter purple-filter" data-parallax="true">
		   	<div class="container">
                 <c:choose>
				<c:when test="${empty imagelist}">
				<h1 class="text-center">팔로잉을 시작 하세요</h1>
				<div class="row">
					<c:forEach items="${randomuser}" var="rand" varStatus='status'>
					
					<div class="col-md-3 mr-auto ml-auto">
                        <div class="card card-profile card-plain">
                            <div class="card-avatar">
                                <a href="<%=request.getContextPath()%>/picture/mystudio.ps?userNo=${rand.userNo}">
                                    <img class="img" src="${rand.prPicture}">
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">${rand.userName}</h4>
                                <h6 class="category text-muted">photographer</h6>
                                <p class="card-description">
                                    ${rand.prContent}
                                </p>
                            </div>
                         
                        </div>
                    </div>
					
					</c:forEach>
					</div>
				</c:when> 
                 <c:otherwise>
				

				<div class="row">
					<div class="col-md-12">
						<div class="col-md-2" style="float: right;">
							<a class="nav-link"
								href="<%=request.getContextPath()%>/user/popular.ps"> <i
								class="material-icons">format_list_bulleted</i> 전체보기
							</a>
						</div>
					</div>
				</div>
				<div class="row" id="carousel">
					<c:forEach items="${imagelist}" var="fileInfo" begin="0"
						varStatus='status' end="9">

						<article
							<c:choose>
							<c:when test="${status.index == 0}">
								class="post prev"
							</c:when>
							<c:when test="${status.index ==	1}">
								class="post selected"
							</c:when>
							<c:when test="${status.index ==	2}">
								class="post next"
							</c:when>
							<c:when test="${status.index ==	3}">
								class="post nextRightSecond"
							</c:when>
							<c:otherwise>
							class="post hideRight"
							</c:otherwise>
							</c:choose>>

							<div class="card card-blog">
								<div class="card-header card-header-image">
									<a href="#pablo"> <img class="img"
										src="${fileInfo.picWater}">
										<div class="card-title"><fmt:formatDate pattern = "yyyy-MM-dd, HH:mm:ss a" value = "${fileInfo.picReg}" /></div>
									</a>
								</div>
								<div class="card-body">
									<h6 class="card-category text-info">${fileInfo.picTitle}</h6>
									<p class="card-description">
										${fileInfo.picContent}
									</p>
								</div>
							</div>
						</article>
					</c:forEach>
				</div>
				</c:otherwise>
				</c:choose>
				</div>
				</div>
			</c:otherwise>
		</c:choose>
 
<div class="main main-raised">
	<div class="section section-basic">
	<nav class="nav">
  <a class="nav-link active" href="#0">Active</a>
  <a class="nav-link" href="#0">Link</a>
  <a class="nav-link" href="#0">Link</a>
  <a class="nav-link disabled" href="#0">Disabled</a>
</nav>
	
		<div class="container">
			<div id="wordchart"></div>
		</div>
	</div>
</div>
