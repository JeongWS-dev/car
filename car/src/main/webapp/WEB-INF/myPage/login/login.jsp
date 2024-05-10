<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<!-- bootstrap -->
<link rel="stylesheet" href="../bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/myPage/login.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:6.3%;"> 

	<!-- Links -->
	
</nav>

</head>

<body>
	
    <div class="container">
        
        <h7>* 이메일 로그인</h7>
        <form action="#" method="post">
            <div class="input-group">
                <input type="email" id="email" name="email" required placeholder="이메일 주소">
                <input type="password" id="password" name="password" required placeholder="비밀번호">
                <button type="submit" class="btn">로그인</button>
            </div>
            
        </form>
        <div class="links">
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 초기화</a>
            <a href="#" class="signup">회원가입 <i class="fa fa-arrow-right"></i></a>
        </div>
        

    </div>
	

		

	<div class="text-center" id="footer">

        <li class="nav-item">
            <a class="nav-link" href="#">이용약관</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">개인정보 처리방침</a>
        </li>

		<div class="col-md-12">

			<p style="color: white; font-size: 12px;">
				COPYRIGHT © HYUNDAI MOTOR COMPANY. ALL RIGHTS RESERVED.
		   </p>
		   <p style="color: white; font-size: 12px;">
			All Rights Reserved.
		   </p>
		</div>
	</div>
	
</body>
</html>