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
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/CreateCarHeader.css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<%-- JQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />

<script type="text/javascript">
	$(document).ready(function(){
		// **** 특정 회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다. **** //
		$("a[name='Powertrains']").click(e=>{
			alert("엔진타입을 클릭했습니다.")
			const frm = document.memberOneDetail_frm;
			frm.userid.value = userid;
			<%-- frm.action = <%=ctxPath%>/member/memberOneDetail.up  --%>
			frm.action = "${pageContext.request.contextPath}/member/memberOneDetail.up"
			frm.method = "post";
			//frm.submit();
		})// end of $("table#memberTbl tr.memberInfo").click(e=>{
	})//$(document).ready(function(){
</script>


<body>
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
			<div>
				<div style="color:rgb(151, 151, 151);">GENESIS</div>
				<span class="model-name">G70</span>
			</div>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"> 
					<a class="nav-link" href="<%= ctxPath%>/createCar/powertrains.car">엔진 타입</a>
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