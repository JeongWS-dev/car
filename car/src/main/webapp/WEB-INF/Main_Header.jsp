<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
    
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
<link rel="stylesheet" href="<%= ctxPath%>/css/mainPage.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<!-- 내가만든 js -->
<script type="text/javascript" src="<%= ctxPath%>/js/main_header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/indexController.js"></script>
<script>
    var statusIndex = ${status.index};
</script>

<body>
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
		<!-- Brand -->
		<img src="<%= ctxPath%>/images/MainPage/logo.png" style = "width:6.8%;"> 
	
		<!-- Links -->
		<header id="header" class="p-3 bg-black text-white" style="position: relative;" >
			<div class="container"  style="margin-left: 2%;">
			<input class="ctx" type="hidden" value="<%= ctxPath%>" />
				<div id="1"  class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
					
					<ul class="nav col-6 col-lg-auto me-lg-auto mb-4 mb-md-0">
						<li class="nav-item" id="nav-item1"> 
							<a href="#" class="nav-link px-2 text-white">모델</a>
							<ul id="sub-menu1" class="nav-item sub-menu" >
								
								<div style="display: flex; margin-left: 3.5%;">	
									<div id="sidebar-wrapper" style="display: flex; font-size: large; font-weight: 475;">
										<ul class="sidebar-nav">
										<li class="sidebar-brand" style="margin-top: 50%; margin-bottom: 100%; ">
											<span>모델</span>
										</li>
										<li><a id="cartype" href="#">ALL</a></li>
										<li><a id="cartype" href="#">BLACK</a></li>
										<li><a id="cartype" href="#">SEDAN</a></li>
										<li><a id="cartype" href="#">SUV</a></li>
										</ul>
									

									<div class="vertical-line"></div>

									
									</div>

									
									<div id="carList">
										
										
										
									</div>
									
									
								</div>  
								

							</ul>
							
						</li>
						<li class="nav-item" id="nav-item2">
							<a href="#" class="nav-link px-2 text-white">구매</a>
							<ul id="sub-menu2" class="nav-item sub-menu" >
								
								<div style="display: flex; margin-left: 5%;">	
									<div id="sidebar-wrapper" style="display: flex;  font-weight: 475;">
										<div style="display: inline; margin-top: 5%;">
											<div style="font-size: x-large; width: 100%; margin-bottom: 11%;">구매</div>
											<div style="font-size: small; width: 160%; color:#b3b3b3;">당신만의 제네시스를 찾아가는 여정을 지원합니다.</div> 
										</div>

										<div style="margin-top: 7.5%; height: 103%; opacity: 0.3;" class="vertical-line"></div>

									
									</div>

									<div style="width:30%; display: flex; margin-top: 0.7%; margin-left: 0.5%;">
										<div>
											<a id="purchase" href="<%= ctxPath %>/estimate/estimate.car">견적내기</a> 
										</div>
										<div style="margin-left: 9%;">
											<a id="purchase" href="#">구매 상담 신청</a>
										</div>
									</div>
									
								</div>  
								
								<div style="margin-top: 0.25%; border-bottom: solid 1px #404040; opacity: 0.3;"></div>

								<div style="margin-top: 0.28%; margin-left: 11.825%; font-size: 14px; font-weight: normal;">
									<a id="purchase" href="#">시승신청 ></a>
									<a style="margin-left: 0.75%;" id="purchase" href="#">전시장 찾기 ></a>
								</div>
								
							</ul>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						
						
						<li class="nav-item" id="nav-item3">
							<a href="#" class="nav-link px-2 text-white">체험</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item4" style="margin-left: 60%;">
							<a style="margin-left: 10%; width: 100%;" href="#" class="nav-link px-2 text-white">고객센터</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item5" >
							<a style="margin-left: 10%; width: 100%;" class="nav-link px-2 text-white" href="<%= ctxPath%>/myPage/myPage.car">마이페이지</a>
						</li>
						<li class="nav-item" id="nav-item6" >
							<a style="margin-left: 70%;" class="navbar-brand" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</header>
	</nav>
	<div style = "margin-top:70px"></div>