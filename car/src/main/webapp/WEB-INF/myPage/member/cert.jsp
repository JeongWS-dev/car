<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

       .container ,
       #email-form {
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

       #verify-button, 
       #submitEmail, 
       #submitCode {
           padding: 10px 20px;
           background-color: black;
           color: #fff;
           border: none;
           border-radius: 5px;
           cursor: pointer;
       }

       #verify-button:hover ,
       #submitEmail:hover ,
       #btn-info:hover {
           background-color: #555;
           color: white;
       }

	
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		 const method = "${requestScope.method}";
		  
			  if(method == "GET") {
				  $("div#div_findResult").hide();
			  }
			  
			  if(method == "POST") {
				  $("input:text[name='email']").val("${requestScope.email}"); 
				  
				  if(${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}) {
					  $("button.btn-success").hide();  
				  }
			  }

		document.getElementById('email-form').style.display = 'none';	

		$("button#verify-button").click(function(){
	        
	        document.getElementById('email-form').style.display = 'block';	
	        
		});	//	end of $("button#verify-button").click(function(){-----------
		
        
		$("button#submitEmail").click(function(){
			goemail();
		});
		
		$("button#submitCode").click(function(){
			gocertUser();
		});
         
	 });	//	end of $(document).ready(function(){---------
	

	function goemail(){
	 
		 const email = $("input:text[name='email']").val();
		 
         const regExp_email = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
         const bool = regExp_email.test(email);

         if (!bool) {
             alert("e메일을 올바르게 입력하세요!!");
             return;
         }

         // 이메일 전송 폼 제출
         
         const frm = document.emailSendFrm;
         frm.action = "<%= ctxPath%>/myPage/memberRegister/emailsend.car";
         frm.method = "post";

         frm.submit();
         
		  
	  }// end of function goFind(){}-----------------------
	  
	// === 인증하기 버튼 클릭시 이벤트 처리해주기 시작 === //
	  function gocertUser(){

		  const input_confirmCode = $("input:text[name='input_confirmCode']").val().trim(); 
		  
		  if(input_confirmCode == "") {
			  alert("인증코드를 입력하세요!!");
			  return; // 종료
		  }
		  
		  const frm = document.verifyCertificationFrm;
		  frm.userCertificationCode.value = input_confirmCode;
		  
		  frm.action = "<%= ctxPath%>/myPage/memberRegister/verifyCertification.car"; 
		  frm.method = "post";
		  frm.submit();
	  };
	  // === 인증하기 버튼 클릭시 이벤트 처리해주기 끝 === //
	
		

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
       <span style="font-size: 10pt;">회원 본인 확인 시 이메일 인증을 통해 본인확인이 가능합니다.</span>
       <br><br>
       <button id="verify-button">이메일 인증</button>
    	<br>
    <form id="myForm" name="emailSendFrm" action='#' onSubmit='event.preventDefault(); goemail();' >
    	<div id="email-form">
    		<br>
	    	<div>▽</div>
	    	<br>
	        <input type="text" name="email" size="25" autocomplete="off" Placeholder="이메일 입력"/>
	        <br><br>
	        <button type="button" id="submitEmail">확인</button>
	    </div>
	</form>
	    
	
	
    <div class="container" id="div_findResult">
	
	
   <c:if test="${requestScope.sendMailSuccess == true}">
   		<br>
   		<div>▽</div>
    	<br>
    	<form action='#' onSubmit='event.preventDefault(); gocertUser();'>
	   <span style="font-size: 10pt;">
	       인증코드가 ${requestScope.email}로 발송되었습니다.<br>
	       인증코드를 입력해주세요
	   </span>
	   
	   <br>
	   <input type="text" name="input_confirmCode" />
	   <br><br>
	   </form>
	   		<button type="button" id="submitCode">인증하기</button>
	   	
   </c:if>
   
   <c:if test="${requestScope.sendMailSuccess == false}">
   	   <span style="color: red;">메일발송이 실패했습니다</span>
   </c:if>
   
</div>

<form name="verifyCertificationFrm">
	<input type="hidden" name="userCertificationCode" />
	<input type="hidden" name="email" />
</form>

    <div class="container">
    	<a href="<%= ctxPath%>/myPage/login.car" style="color: black; text-decoration: underline; font-size:10pt;">로그인 페이지로 이동</a>
    </div>
   	</div>
    <br><br>
    <hr>
    
	

</body>
</html>