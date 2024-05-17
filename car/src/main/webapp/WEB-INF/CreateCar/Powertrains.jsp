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
			<img src="<%=ctxPath%>/images/createCar/powertrains/powertrainsMain/g70-23my-bto-engine-g2.5-desktop-1024x576.png"/>
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
		</div>
		<div class="gap"></div>
		<div class="tab">
			<div class = "powertrainType">1. 엔진 타입</div>
			<c:if test="${not empty requestScope.mapList}">
				<c:forEach var = "paraMap" items="${requestScope.mapList}">
					<div class = "choice_option" style="display: flex;">
						<div class= "choice_option_inner">
							<div class = "option_title">${paraMap.get('PowerDesc')}</div>
							<div class = option_price>+${paraMap.get('PowerPrice')}원</div>
						</div>
						<div class="gap"></div>
						<img src="<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/${paraMap.get('PowerIcon_Img')}"/>
					</div>
				</c:forEach>
			</c:if>
			<div class="price">
				<div style="color:rgb(150, 150, 150)">예상 가격</div>
				<div class="total_price">43,470,000원</div> <%-- 금액 변경하는거 어쩌면 for문으로 가능할지도? --%>
				<button class="before">이전</button>
				<button class="after">다음</button>
			</div>
		</div>
		<form name="powertrainChoiceFrm">
			<input type="hidden" value="43470000"/>
		</form>
	</div>
</body>
