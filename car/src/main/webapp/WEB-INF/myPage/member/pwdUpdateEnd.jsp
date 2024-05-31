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
<title>비밀번호 수정</title>

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 



<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<style>
	
	div.div_pwd {
	 	width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
	}
	
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
		
		$("button.btn-success").click(function(){
			
			const pwd  = $("input:password[name='pwd']").val();
			const pwd2 = $("input:password[id='pwd2']").val();
			
			if(pwd != pwd2) {
				alert("암호가 일치하지 않습니다.");
				$("input:password[name='pwd']").val("");
				$("input:password[id='pwd2']").val("");
				return;  // 종료
			}
			else {
				const regExp_pwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);  
			    // 숫자/문자/특수문자 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성 
			    
			    const bool = regExp_pwd.test(pwd);	
				
			    if(!bool) {
					// 암호가 정규표현식에 위배된 경우
					alert("암호는 8글자 이상 15글자 이하에 영문자,숫자,특수기호가 혼합되어야만 합니다.");
					$("input:password[name='pwd']").val("");
					$("input:password[id='pwd2']").val("");
					return; // 종료
			    }
			    else {
			    	// 암호가 정규표현식에 맞는 경우
			    	const frm = document.pwdUpdateEndFrm;
			    	frm.action = "<%= ctxPath%>/myPage/member/pwdUpdateEnd.car";
			    	frm.method = "post";
			    	frm.submit();
			    }
			}
			
		});// end of $("button.btn-success").click(function(){})----
		
	});// end of $(document).ready(function(){})--------------------
</script>

<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
	<c:if test="${requestScope.method == 'GET'}">
		<form name="pwdUpdateEndFrm">
		   <div class="div_pwd" style="text-align: center;">
		      <span style="color: blue; font-size: 12pt;">새암호</span><br/> 
		      <input type="password" name="pwd" size="25" />
		   </div>
		   
		   <div class="div_pwd" style="text-align: center;">
		   	  <span style="color: blue; font-size: 12pt;">새암호확인</span><br/>
		      <input type="password" id="pwd2" size="25" />
		   </div>
		   
		   <input type="text" name="pk_userid" value="${requestScope.pk_userid}" />
	
		   <div style="text-align: center;">
		      <button type="button" class="btn btn-success">암호변경하기</button>
		   </div>
		</form>
  </c:if>
  
  <c:if test="${requestScope.method == 'POST'}">
	   <div style="text-align: center; font-size: 14pt; color: navy; margin-top: 10%;">
		   <c:if test="${requestScope.n == 1}">
		      사용자 ID ${requestScope.userid}님의 비밀번호가 새로이 변경되었습니다.
		      <br><br><br>
		      <a type="button" class="btn btn-secondary" style="margin-top: 1.5%; margin-bottom: 1.5%;" href="<%= ctxPath%>/index.car">홈으로</a>
		   </c:if>
		   
		   <c:if test="${requestScope.n == 0}">
		      SQL구문 오류가 발생되어 비밀번호 변경을 할 수 없습니다.
		   </c:if>
	   </div>
  </c:if>
</body>
</html>    



    