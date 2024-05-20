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

       #emailPopup {
           padding: 10px 20px;
           background-color: black;
           color: #fff;
           border: none;
           border-radius: 5px;
           cursor: pointer;
       }

       #emailPopup:hover {
           background-color: #555;
           color: white;
       }

		.popup {
		  display: none;
		  position: fixed;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  background-color: #fefefe;
		  border: 1px solid #888;
		  z-index: 9999;
		}
		
		.popup-content {
		  padding: 20px;
		}
		
		.close {
		  position: absolute;
		  top: 10px;
		  right: 15px;
		  font-size: 20px;
		  cursor: pointer;
		}
	
	
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
	
		const popupButton = document.getElementById("emailPopup");

		popupButton.addEventListener("click", function() {
			const width = 600;
		  const height = 400;
		  const left = (window.innerWidth - width) / 2;
		  const top = (window.innerHeight - height) / 2;
		  const options = `width=${width},height=${height},left=${left},top=${top}`;
		
		  const popupContent = document.querySelector('.popup-content').innerHTML;
		  const newWindow = window.open('', '팝업', options);
		  newWindow.document.write(popupContent);
		});
	 });
	
	
	function goemail(){
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
		  frm.action = "<%= ctxPath%>/login/idFind.up";
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
    <div class="container">
        <h2 class="title">본인인증</h2>
        <p class="description">본인 인증을 위한 필수 정보를 입력하세요.</p>
        
    </div>
   	<hr>
    <br><br>
    <div class="container">
       <span style="font-size: 10pt;">회원 본인 확인 시 이메일 인증을 통해 본인확인이 가능합니다.</span>
       <br><br>
       <button type="button" id="emailPopup">이메일인증</button> 
       
   	</div>
    <br><br>
    <hr>
    
	
	<form name="pwdFindFrm">

   <ul style="list-style-type: none;">
      <li style="margin: 25px 0">
          <label style="display: inline-block; width: 90px;">아이디</label>
          <input type="text" name="userid" size="25" autocomplete="off" /> 
      </li>
      <li style="margin: 25px 0">
          <label style="display: inline-block; width: 90px;">이메일</label>
          <input type="text" name="email" size="25" autocomplete="off" /> 
      </li>
   </ul> 

   <div class="my-3 text-center">
      <button type="button" class="btn btn-success">찾기</button>
   </div>   
   
</form>  
	



</body>
</html>