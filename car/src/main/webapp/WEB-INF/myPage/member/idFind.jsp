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
<title>로그인</title>

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
		  $("input:text[name='name']").val("${requestScope.name}"); 
		  $("input:text[name='email']").val("${requestScope.email}");
	  }
	  
	  
	  $("button.btn-success").click(function(){
		 goFind(); 
	  });// end of $("button.btn-success").click(function(){})-----
	  
	  $("input:text[name='email']").bind("keyup", function(e){
		  if(e.keyCode == 13) {
		  	goFind();
		  }
	  });// end of $("input:text[name='email']").bind("keyup", function(e){})-------
	  
  }); // end of $(document).ready(function(){})-----------------
  
  
  // Function Declaration
  function goFind() {
	 
	  const name = $("input:text[name='name']").val().trim();
	  
	  if(name == "") {
		  alert("성명을 입력하세요!!");
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
       
      const frm = document.idFindFrm;
	  frm.action = "<%= ctxPath%>/myPage/member/idFind.car";
	  frm.method = "post";
      frm.submit();
	  
  }// end of function goFind(){}-----------------------
  
  
  // 아이디 찾기 모달창에 입력한 input 태그 value 값 초기화 시키기
  function func_form_reset_empty() {
	  document.querySelector("form[name='idFindFrm']").reset();
	  $("div#div_findResult").empty();
  }// end of function func_form_reset_empty()----------
  
  
</script>

<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
	<form name="idFindFrm">
	
	   <ul style="list-style-type: none; margin-top: 10%; margin-left: 37.5%;">
	      <li>
	          <label style="display: inline-block; width: 75px;">성명</label>
	          <input type="text" name="name" size="25" autocomplete="off" /> 
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
	   ID : <span style="color: red; font-size: 16pt; font-weight: bold; margin-top: 1.5%;">${requestScope.userid}</span>
	</div>
	
	<footer>
        <a href="#">이용약관</a> | <a href="#">개인정보 처리방침</a>
    </footer>
</body>
</html>    



    