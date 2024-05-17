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
<title>본인인증</title>

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<style type="text/css">
	body > nav {
		height: 10%;
		background-color: black;
	}
	
	body > nav.top > img {
		margin-left: 40%;
	}
	
       body {
           font-family: Arial, sans-serif;
           margin-top: 7%;
           padding: 0;
           background-color: #f2f2f2;
       }

       .container {
           max-width: 600px;
           margin: 1% auto;
           text-align: center;
       }

       .title {
           font-size: 24px;
           margin-bottom: 20px;
       }

       .description {
           font-size: 16px;
           margin-bottom: 20px;
           text-decoration: underline;
       }

       .checkbox-group {
           text-align: left;
           margin-bottom: 20px;
       }

       .checkbox-group label {
       	   display: block;
           margin-bottom: 10px;
       }

       .btn-emailcert {
           padding: 10px 20px;
           background-color: black;
           color: #fff;
           border: none;
           border-radius: 5px;
           cursor: pointer;
       }

       .btn-emailcert:hover {
           background-color: #555;
           color: white;
       }

      .modal {
      
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow-y: initial !imporant;
	  background-color: rgba(0, 0, 0, 0.5);
	}
	
	#myModal > div, #myModal2 > div {
		border: solid 1px red;
	  background-color: #fefefe;
	  margin: 10% auto;
	  margin-buttom: 30%;
	  padding: 1%;
	  border: 1px solid #888;
	  width: 30%;
	  height: 60%; /* 내용이 많아도 모달 창의 높이가 고정되도록 설정합니다. */
	  font-size: 12px;
	}

	
</style>

<script type="text/javascript">
	$(document).ready(function(){

	 });
		

</script>

<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
    <div class="container">
        <h2 class="title">본인인증</h2>
        <p class="description">본인 인증을 위한 필수 정보를 입력하세요.</p>
    </div>
   	<hr>
    <br><br>
    <div class="container">
       <span style="font-size: 10pt;">회원 본인 확인 시 휴대폰 인증 기관 또는 아이핀(i-PIN) 인증을 통해 본인확인이 가능합니다.</span>
       <button type="button" class="btn btn-emailcert">이메일인증</button> 
   	</div>
    <br><br>
    <hr>
    >

	



</body>
</html>