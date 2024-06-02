
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

</div>
</div>
</div>
</div>

	<nav class="navbar navbar-expand-sm navbar-dark bottom">
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"> 
				<a class="nav-link" href="#">사이트맵</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">이용약관</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">개인정보 처리방침</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">저작권안내</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">보증안내</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">자동차 교환 및 환불 중재 규정 안내 </a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="https://www.facebook.com/GenesisWorldwide"><i class="fa-brands fa-instagram"></i></a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-brands fa-youtube"></i></a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-brands fa-facebook-f"></i></a>
			</li>
		</ul>
	</nav>
	
	<div class="text-center" id="footer">
		<div class="col-md-12">
			<img class ="mb-3 mt-3" src="<%= ctxPath%>/images/myPage/logo.png" style = "width:6%;"> 

			<p style="color: white; font-size: 12px;">
				© Copyright 2024 Hyundai Motor Company.
		   </p>
		   <p style="color: white; font-size: 12px;">
			All Rights Reserved.
		   </p>
		</div>
	</div>
</div>
</body>
</html>