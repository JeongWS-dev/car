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
<title>비밀번호 찾기</title>

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 


<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script> 

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<style>
    body > nav {
		height: 10%;
		background-color: black;
	}
	
	body > nav.top > img {
		margin-left: 40%;
	}
        body {
            font-family: Arial, sans-serif;
            margin-top: 6%;
            padding: 0;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 400px;
            margin: 5% auto;
            
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 20%;
		    padding: 10px;
		    margin-top: 25px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }
        .links {
            text-align: center;
            margin-top: 10px;
        }
        .links a {
            margin: 0 10px;
            color: #333;
            text-decoration: none;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
</style>

<script type="text/javascript">
$(document).ready(function(){
	  
	  const method = "${requestScope.method}";
	  
 // console.log("~~~확인용 method : " + method);
	  /*
	     ~~~확인용 method : GET
	     ~~~확인용 method : POST
	  */
	  
	  if(method == "GET") {
		  $("div#div_findResult").hide();
	  }
	  
	  if(method == "POST") {
		  $("input:text[name='userid']").val("${requestScope.userid}"); 
		  $("input:text[name='email']").val("${requestScope.email}"); 
		  
		  if(${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}) {
			  $("button.btn-success").hide();  
		  }
	  }
	  
	  
	  $("button.btn-success").click(function(){
		 goFind(); 
	  });// end of $("button.btn-success").click(function(){})-----
	  
	  $("input:text[name='email']").bind("keyup", function(e){
		  if(e.keyCode == 13) {
		  	goFind();
		  }
	  });// end of $("input:text[name='email']").bind("keyup", function(e){})-------
	  
	  
	  // === 인증하기 버튼 클릭시 이벤트 처리해주기 시작 === //
	  $("button.btn-info").click(function(){
		  
		  const input_confirmCode = $("input:text[name='input_confirmCode']").val().trim(); 
		  
		  if(input_confirmCode == "") {
			  alert("인증코드를 입력하세요!!");
			  return; // 종료
		  }
		  
		  const frm = document.verifyCertificationFrm;
		  frm.userCertificationCode.value = input_confirmCode;
		  frm.userid.value = $("input:text[name='userid']").val(); 
		  
		  frm.action = "<%= ctxPath%>/myPage/member/verifyCertification_pwdfind.car"; 
		  frm.method = "post";
		  frm.submit();
	  });
	  // === 인증하기 버튼 클릭시 이벤트 처리해주기 끝 === //
	  
}); // end of $(document).ready(function(){})-----------------


// Function Declaration
function goFind() {
	 
	  const userid = $("input:text[name='userid']").val().trim();
	  
	  if(userid == "") {
		  alert("아이디를 입력하세요!!");
		  return; // 종료
	  }
	  
	  const email = $("input:text[name='email']").val();
	  
 // const regExp_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
 // 또는
    const regExp_email = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);  
	  // 이메일 정규표현식 객체 생성 
       
    const bool = regExp_email.test(email);

    if(!bool) {
       // 이메일이 정규표현식에 위배된 경우
       alert("e메일을 올바르게 입력하세요!!");
	   return; // 종료
    }    
     
    const frm = document.pwdFindFrm;
	  frm.action = "<%= ctxPath%>/myPage/member/pwdFind.car";
	  frm.method = "post";
    frm.submit();
	  
}// end of function goFind(){}-----------------------
  
  
</script>

<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
	<form name="pwdFindFrm">
	
	   <ul style="list-style-type: none; margin-top: 10%; margin-left: 37.5%;">
	      <li>
	          <label style="display: inline-block; width: 75px;">아이디</label>
	          <input type="text" name="userid" size="25" autocomplete="off" /> 
	      </li>
	      <li>
	          <label style="display: inline-block; width: 75px;">이메일</label>
	          <input type="text" name="email" size="25" autocomplete="off" /> 
	      </li>
	   </ul> 
	
	   <div class="my-3 text-center">
	      <button type="button" class="btn btn-success" style="margin-top: 1.5%; margin-bottom: 1.5%;">찾기</button>
	      <a type="button" class="btn btn-success" style="margin-top: 1.5%; margin-bottom: 1.5%;" href="<%= ctxPath%>/index.car">홈으로</a>
	   </div>
	   
	</form>
	
	<div class="my-3 text-center" id="div_findResult">
	   <c:if test="${requestScope.isUserExist == false}">
	      <span style="color: red;">사용자 정보가 없습니다</span>
	   </c:if>
	   
	   <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}">
		   <span style="font-size: 10pt;">
		       인증코드가 ${requestScope.email}로 발송되었습니다.<br>
		       인증코드를 입력해주세요
		   </span>
		   <br>
		   <input type="text" name="input_confirmCode" />
		   <br><br> 
		   <button type="button" class="btn btn-info">인증하기</button>
	   </c:if>
	   
	   <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == false}">
	   	   <span style="color: red;">메일발송이 실패했습니다</span>
	   </c:if>
	</div>
	
	<%-- 인증하기 form --%>
	<form name="verifyCertificationFrm">
		<input type="text" name="userCertificationCode" />
		<input type="text" name="userid" />
	</form>
	
	<footer>
        <a href="#">이용약관</a> | <a href="#">개인정보 처리방침</a>
    </footer>
</body>
</html>    



    