<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/login_myPage_fix.css">


</head>
<body>

   <!-- 상단 네비게이션 시작 -->
   
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
		<!-- Brand Logo -->
		<a href="<%= ctxPath%>/index.car" style = "margin-left: 7%;">
			<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width: 110px; height : 22px;" >
		</a>
		<!-- Links -->
	
	
	
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="nav col-6 col-lg-auto me-lg-auto mb-4 mb-md-0">
				<c:if test="${not empty sessionScope.loginuser && sessionScope.loginuser.pk_userid != 'admin'}" > <%-- admin이 아닌 일반 회원 로그인 했으면 --%>
					<li class="nav-item">
		           		<a class="nav-link text-white" href="<%= ctxPath %>/myPage/myinfoEdit.car">내 정보 보기/수정</a>
		           	</li>
					<li class="nav-item">
		           		<a class="nav-link text-white" href="<%= ctxPath %>/createCar/saveCreateCar.car">내 저장 견적서 조회</a>
		           	</li>
				</c:if>
	         	<c:if test="${not empty sessionScope.loginuser && sessionScope.loginuser.pk_userid == 'admin'}" > <%-- admin으로 로그인 했으면 --%>
         			<li class="nav-item">
		           		<a class="nav-link text-white" href="<%= ctxPath %>/admin/memberList.car">회원 목록 보기</a>
		           	</li>
				   	<li class="nav-item">
		              	<a class="nav-link text-white" href="#">시승신청 목록 보기</a>
		           	</li>
	           		<li class="nav-item">
	              		<a class="nav-link text-white" href="<%= ctxPath %>/admin/paperList.car">전체 견적 내역</a>
	           		</li>
	           	</c:if>

<c:if test="${not empty sessionScope.loginuser}">
                  
    				<li class="nav-item" id="nav-item5">
                  	<a style="margin-left: 800%; width: 100%; position: sticky; z-index: 1000;" class="nav-link px-2 text-white" href="<%= ctxPath%>/mypage/logout.car">로그아웃</a>
                  </li>
                  
       		</c:if>
	        
	          </ul>
		</div>
	</nav>
	<!-- 상단 네비게이션 끝 -->
	
	 <div class="container-fluid" id="container" >
	 	<div class="row">
		 	<div class="col-md-3" id="sideinfo"  >
		 		
		 		 <%--  2. 로그인/Tree/View --%>
	             <%-- 로그인 처리하기 --%>
	             	<p class = "welcome"  id="row1">WELCOME</p>
	             	<p class = "welcome" id="row2" >GENESIS</p>
					<div class="user_name"><u>${sessionScope.loginuser.username}</u>님 <br> 안녕하세요.</div>     
	         	
	       	</div>
	       	<div class="col-md-9" id="maininfo" style="padding-bottom : 0.5%;">
	       		<div class="welcomeDiv" style="min-height: 690px;  border-left: thin solid #c0c0c0; ">
	       		
	       	
	     
	         <div id="maincontent">
         

	 	

	 
   
	
	
	
	
	
	
	
	
	
	
	
	
	