<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GENESIS</title>

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/PowerTrains.css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<%-- JQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />

<!-- 내가만든 js -->
<script type = "text/javascript">
	$(document).ready(function(){

		$("div.MainImg").hide();
		$("div.ctxPath").hide();

		let = total_price = $("div.total_price").text();
		total_price = total_price.split(",").join("");
		total_price = total_price.substring(0,total_price.indexOf("원"))

		$(".choice_option").click(function(e){
			
			if($(e.target).is("div.option_title")){
				
				$(".choice_option").css({"opacity":"0.3", "border":""});
				$(e.target).parent().parent().css({"opacity":"1.0"});

				const MainImg = $(e.target).parent().find("div.MainImg").text();
				const ctxPath = $(e.target).parent().find("div.ctxPath").text();
				const option_title = $(e.target).text();
				// alert(option_title);
				let option_price = $(e.target).parent().find("div.option_price").text();
				option_price = option_price.split(",").join("");
				option_price = option_price.substring(1,option_price.indexOf("원"))
				console.log(option_price);

				change_Main(MainImg,ctxPath,total_price,option_price,option_title);
			}
			else if ($(e.target).is("div.option_price")){
				$(".choice_option").css({"opacity":"0.3", "border":""});
				$(e.target).parent().parent().css({"opacity":"1.0"});

				const MainImg = $(e.target).parent().find("div.MainImg").text();
				const ctxPath = $(e.target).parent().find("div.ctxPath").text();
				const option_title = $(e.target).parent().find("div.option_title").text();
				//alert(option_title);
				let option_price = $(e.target).parent().find("div.option_price").text();
				option_price = option_price.split(",").join("");
				option_price = option_price.substring(1,option_price.indexOf("원"))
				console.log(option_price);

				change_Main(MainImg,ctxPath,total_price,option_price,option_title);
			}
			else if ($(e.target).is("img")){
				$(".choice_option").css({"opacity":"0.3", "border":""});
				$(e.target).parent().css({"opacity":"1.0"});

				const MainImg = $(e.target).parent().find("div.MainImg").text();
				const ctxPath = $(e.target).parent().find("div.ctxPath").text();
				const option_title = $(e.target).parent().find("div.option_title").text();
				//alert(option_title);
				let option_price = $(e.target).parent().find("div.option_price").text();
				option_price = option_price.split(",").join("");
				option_price = option_price.substring(1,option_price.indexOf("원"))
				console.log(option_price);

				change_Main(MainImg,ctxPath,total_price,option_price,option_title);
			}
			else {
				$("div.choice_option").css({"opacity":"0.3"});
				$(e.target).css({"opacity":"1.0"});

				const MainImg = $(e.target).find("div.MainImg").text();
				const ctxPath = $(e.target).find("div.ctxPath").text();
				let option_price = $(e.target).find("div.option_price").text();
				const option_title = $(e.target).find("div.option_title").text();
				//alert(option_title);
				option_price = option_price.split(",").join("");
				option_price = option_price.substring(1,option_price.indexOf("원"))
				console.log(option_price);

				change_Main(MainImg,ctxPath,total_price,option_price,option_title);
		    }
		});

		/*
		$(".option_title").click(function(e){
			//if($(e.target).is("div.option_title")){
			//	$(".choice_option").css({"border":"solid 2px red"});
				$(".choice_option").css({"opacity":"1.0", "border":""});

				let idx = $(".option_title").index($(e.target));
			//	alert(idx);
			//  $(".choice_option").eq(idx).css({"border":"solid 2px red"});
			    $(".choice_option").eq(idx).css({"opacity":"0.3", "border":"solid 2px red"});

			//	$(e.target).parent().parent().css({"opacity":"1.0"});

				console.log($(e.target).parent().parent().html());

				const MainImg = $(e.target).parent().find("div.MainImg").text();
				const ctxPath = $(e.target).parent().find("div.ctxPath").text();

				console.log(ctxPath);
				console.log(MainImg);

				change_Main(MainImg,ctxPath);
			//}
		});
		*/
		// <div class = "option_price" value="${paraMap.get('PowerPrice')}">+${paraMap.get('PowerPrice')}원</div>
	})// end of $(document).ready(function(){
	
	function change_Main(MainImg,ctxPath,total_price,option_price,option_title){
		
		let html = `<img name="MainImg" src="\${ctxPath}/images/createCar/powertrains/powertrainsMain/\${MainImg}"/>
						<div style = "display:flex">
							<div>
								<div class = "option">배기량(cc)</div>
								<div class = "optionVal">2,497</div>
							</div>
							<div>
								<div class="option">최고출력(ps)</div>
								<div class = "optionVal">304</div>
							</div>
							<div>
								<div class="option">최대토크(kgf.m)</div>
								<div class = "optionVal">43.0</div>
							</div>
						</div>`;

		$("div.optionMain").html(html);

		const add_total_price = Number(total_price) + Number(option_price)
		$("input[name='add_total_price']").val(add_total_price.toLocaleString('en')+"원");

		const handle = setInterval(() => {
		$("div.total_price").html(Math.ceil(add_total_price - total_price).toLocaleString('en')+"원");

		// 목표에 도달하면 정지
		if (total_price < 1) {
			clearInterval(handle);
		}

		// 적용될 수치, 점점 줄어듬
		const step = total_price / 2;

		total_price -= step;
		}, 50);

		$("input[name='option_title']").val(option_title);
	}// end of function change_Main(MainImg,ctxPath,total_price,option_price){

	function goNext(){
		const frm = document.powertrainChoiceFrm;
		frm.action = "drivetrains.car";
		frm.method = "post";
		frm.submit();
	}// end of function goNext(){
</script>

<body>
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
			<div>
				<div style="color:rgb(151, 151, 151);">GENESIS</div>
				<span class="model-name">${requestScope.carName}</span>
			</div>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item choicePower"> 
					<a class="nav-link" href="<%= ctxPath%>/createCar/powertrains.car" style="color:white;">엔진 타입</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="<%= ctxPath%>/createCar/drivetrains.car">구동 타입</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">스포츠 패키지</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">외장 컬러</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">휠&타이어</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">내장 디자인&컬러</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">내장 가니쉬</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">파퓰러 패키지</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">선택 품목</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">미리보기</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" href="#">견적완료</a>
				</li>
			</ul>
		</nav>
		<div style="margin-top:70px;"></div>

	<div class="body">
		<div class = "optionMain">
			<c:if test="${not empty requestScope.mapList}">
				<c:forEach var="paraMap" items="${requestScope.mapList}" begin="0" end="0">
					<img name="MainImg" src="<%=ctxPath%>/images/createCar/powertrains/powertrainsMain/${paraMap.get('PowerMain_Img')}"/>
					<div style = "display:flex">
						<div>
							<div class = "option">배기량(cc)</div>
							<div class = "optionVal">2,497</div>
						</div>
						<div>
							<div class="option">최고출력(ps)</div>
							<div class = "optionVal">304</div>
						</div>
						<div>
							<div class="option">최대토크(kgf.m)</div>
							<div class = "optionVal">43.0</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="gap"></div>
		<div class="tab">
			<div class = "powertrainType">1. 엔진 타입</div>
			<c:if test="${not empty requestScope.mapList}">
				<c:forEach var = "paraMap" items="${requestScope.mapList}">
					<div class = "choice_option" style="display: flex;">
						<div class= "choice_option_inner">
							<div class = "option_title">${paraMap.get('PowerDesc')}</div>
							<div class = "option_price" value="${paraMap.get('PowerPrice')}">+${paraMap.get('PowerPrice')}원</div>

							<div class = "MainImg">${paraMap.get("PowerMain_Img")}</div>
							<div class = "ctxPath"><%=ctxPath%></div>
						</div>
						<div class="gap"></div>
						<img src="<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/${paraMap.get('PowerIcon_Img')}"/>
					</div>
				</c:forEach>
			</c:if>
			<div class="price">
				<div style="color:rgb(150, 150, 150)">예상 가격</div>
				<div class="total_price">${requestScope.Price}</div> <%-- 금액 변경하는거 어쩌면 for문으로 가능할지도? --%>
				<button class="before">이전</button>
				<button class="after"  onclick="goNext()">다음</button>
			</div>
		</div>
		<form name="powertrainChoiceFrm">
            <input name="car_name" type="hidden" value="${requestScope.carName}"/>
			<input name="option_title" type="hidden" value=""/>
			<input name="add_total_price" type="hidden" value="${requestScope.Price}"/>
		</form>
	</div>
</body>
