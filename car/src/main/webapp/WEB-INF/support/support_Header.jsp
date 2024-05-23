<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<%= ctxPath%>/css/support.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></sscript>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<body>
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
		<!-- Brand -->
		<img src="<%= ctxPath%>/images/MainPage/logo.png" style = "width:6%;"> 
	
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"> 
				<a class="nav-link" href="#">모델</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%= ctxPath%>/estimate/estimate.car">구매</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">체험</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">고객센터</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%= ctxPath%>/myPage.car"  class="btn">마이페이지</a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
			</li>
		</ul>
	</nav>
	<div style="margin-top:70px;"></div>

