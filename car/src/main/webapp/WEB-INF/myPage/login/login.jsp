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
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
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

	    $("button#submit").click(function(){
	        goLogin();  //  로그인 시도한다.
	
	    }); 
	
	    
	
	    $("input#loginPwd").bind("keydown", function(e){
	        
	        if(e.keyCode == 13){    //  암호 입력란에 엔터를 했을 경우   //  대문자 조심!
	            goLogin();  //  로그인을 시도한다.
	        }
	    });
    
	}); //  end of $(document).ready(function(){------------

//  Function Declaration

//  ==  로그인 처리 함수
function goLogin(){
      alert("확인용 로그인 처리하러 간다.");

    if($("input#userid").val().trim() == ""){
        alert("아이디를  입력하세요.");

        $("input#userid").val("").focus();
        return; //  goLogin() 함수 종료
    }
    if($("input#passwd").val().trim() == ""){
        alert("비밀번호를 입력하세요.");

        $("input#passwd").val("").focus();
        return; //  goLogin() 함수 종료
    }
	
    if($("input:checkbox[id='saveid']").prop("checked") ){
      //  alert("아이디 저장 체크를 하셨습니다.");

        localStorage.setItem('saveid', $("input#loginUserid").val());
    }
    else{
      //  alert("아이디 저장 체크를 해제하셨습니다.");
        
        localStorage.removeItem('saveid');
    }

		
    const Frm = document.loginFrm;
    Frm.submit();



}   //  end of function goLogin(){-----------




</script>

<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
    
    <div class="container">
        <form name="loginFrm" action="<%= ctxPath%>/car/login/login.car" method="post">
        	<p style="font-color: grey;">*이메일 로그인</p>
            <input type="text" name="userid" placeholder="아이디">
            <input type="password" name="password" placeholder="비밀번호">
            <input type="checkbox" id="saveid" style="width:12px;height:12px;" />&nbsp;<label for="saveid" style="font-size: 10pt;">아이디저장</label>
            <input type="submit" value="로그인">
            
        </form>
        <div class="links">
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 찾기</a>
            <a href="<%= ctxPath%>/myPage/memberRegister.car">회원가입</a>
        </div>
    
        
    	</form>    
    </div>
  	
    <footer>
        <a href="#">이용약관</a> | <a href="#">개인정보 처리방침</a>
    </footer>
</body>
</html>