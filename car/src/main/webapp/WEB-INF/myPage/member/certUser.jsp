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
<script type="text/javascript" src="<%= ctxPath%>/js/user/memberRegister.js"></script>

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
           padding: 0 30%;
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

		div#divRegisterFrm {
			text-align: center;
		}
		
		table#tblMemberRegister {
		 	border: solid 1px red;  
			width: 93%;
			margin: 0% auto;
			font-size: 12px;
		}
		
		table#tblMemberRegister th {
		    border: solid 1px gray; 
		}
		
		table#tblMemberRegister th {
			height: 60px;
			background-color: silver;
			font-size: 14pt;
		}
		
		table#tblMemberRegister td {
			line-height: 200%;
			padding: 1.2% 0;
		}
		
		span.star {
			color: red;
			font-weight: bold;
			font-size: 13pt;
		}
		
		
		table#tblMemberRegister > tbody > tr > td:first-child {
			width: 20%;
			font-weight: bold;
			text-align: left;
		}
		
		table#tblMemberRegister > tbody > tr > td:nth-child(2) {
			width: 80%;
			text-align: left;
		}
		
		img#idcheck, img#zipcodeSearch {
			cursor: pointer;
		}
		
		span#emailcheck {
			border: solid 1px gray;
			border-radius: 5px;
			font-size: 8pt;
			display: inline-block;
			width: 80px;
			height: 30px;
			text-align: center;
			margin-left: 10px;
			cursor: pointer;
		}

	
</style>

<script type="text/javascript">

</script>


<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
    <div class="container">
        <h2 class="title">회원가입</h2>
        <p class="description">회원 가입을 위한 필수 정보를 입력하세요.
        <br>
        <span style="font-size: 10px;"><span class="star" style="font-size: 10px;">*</span>표시는 필수입력사항</span></p>
        
    </div>
   	<hr>
    
	<div id="divRegisterFrm">
   <div class="col-md-12">
      <form name="registerFrm">
          <table id="tblMemberRegister">
             
             <tbody>
                <tr>
                    <td colspan="2" style="line-height: 50%;">&nbsp;</td>
                </tr>
                
                <tr>
                    <td>성명&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="text" name="name" id="name" maxlength="30" class="requiredInfo" />
                       <span class="error">성명은 필수입력 사항입니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>아이디&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="text" name="userid" id="userid" maxlength="40" class="requiredInfo" />&nbsp;&nbsp;  
                       <%-- 아이디중복체크 --%>
                       <img src="<%= ctxPath%>/images/b_id_check.gif" id="idcheck" />
                       <span id="idcheckResult"></span>
                       <span class="error">아이디는 필수입력 사항입니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="password" name="pwd" id="pwd" maxlength="15" class="requiredInfo" />
                       <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호확인&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="password" id="pwdcheck" maxlength="15" class="requiredInfo" />
                       <span class="error">암호가 일치하지 않습니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>이메일&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="text" name="email" id="email" maxlength="60" class="requiredInfo" />
                       <span class="error">이메일 형식에 맞지 않습니다.</span>
                       <%-- 이메일중복체크 --%>
                       <span id="emailcheck">이메일중복확인</span>
                       <span id="emailCheckResult"></span>
                    </td>
                </tr>
                
                <tr>
                    <td>연락처&nbsp;</td>
                    <td>
                       <input type="text" name="hp1" id="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp; 
                       <input type="text" name="hp2" id="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
                       <input type="text" name="hp3" id="hp3" size="6" maxlength="4" />    
                       <span class="error">휴대폰 형식이 아닙니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>우편번호</td>
                    <td>
                       <input type="text" name="postcode" id="postcode" size="6" maxlength="5" />&nbsp;&nbsp;
                       <%-- 우편번호 찾기 --%>
                       <img src="<%= ctxPath%>/images/b_zipcode.gif" id="zipcodeSearch" />
                       <span class="error">우편번호 형식에 맞지 않습니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>주소</td>
                    <td>
                       <input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" /><br>
                       <input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" />&nbsp;<input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" />            
                       <span class="error">주소를 입력하세요.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>성별</td>
                    <td>
                       <input type="radio" name="gender" value="1" id="male" /><label for="male" style="margin-left: 1.5%;">남자</label>
                       <input type="radio" name="gender" value="2" id="female" style="margin-left: 10%;" /><label for="female" style="margin-left: 1.5%;">여자</label>
                    </td>
                </tr>
                
                <tr>
                    <td>생년월일</td>
                    <td>
                       <input type="text" name="birthday" id="datepicker" maxlength="10" />
                       <span class="error">생년월일은 마우스로만 클릭하세요.</span>
                    </td>
                </tr>
                
     		   <tr>
                    <td colspan="2" class="text-center">
                       <input type="button" class="btn btn-success btn-lg mr-5" value="가입하기" onclick="goRegister()" />
                       <input type="reset"  class="btn btn-danger btn-lg" value="취소하기" onclick="goReset()" />
                    </td>
                </tr>
                </tbody>
              </table>
      </form>
   </div>
</div>
	

</body>
</html>