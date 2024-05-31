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
		  $("input:text[name='mobile']").val("${requestScope.mobile}"); 
		  
		  if(${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}) {
			  $("button.btn-success").hide();  
		  }
	  }
	  
	  
	  
	  $("button.btn-secondary").click(function(){
		    let bool2 = false;
		    let bool3 = false;
		    
		    const userid = $("input:text[name='userid']").val().trim();
			const hp1 = $("input:text[name='hp1']").val().trim();
			const hp2 = $("input:text[name='hp2']").val().trim();
			const hp3 = $("input:text[name='hp3']").val().trim();
			
		    $.ajax({
				  url:"<%= ctxPath%>/myPage/member/pwdFindJSON.car",
				  type:"post",
				  data:{"userid":userid,
					  	"hp1":hp1,
					  	"hp2":hp2,
					  	"hp3":hp3},
				  dataType:"json",
				  success:function(json){ 
					  $("input#ajax").val(json.certification_code);
				  },
				  error: function(request, status, error){
					  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				  }
			  });
		    
		    
		    // hp2 검사
		    const regExp_hp2 = /^[1-9][0-9]{3}$/;
		    bool2 = regExp_hp2.test($("input#hp2").val());
		    if (!bool2) {
		        alert("휴대폰 형식이 아닙니다.");
		        return;
		    }

		    // hp3 검사
		    const regExp_hp3 = /^\d{4}$/;
		    bool3 = regExp_hp3.test($("input#hp3").val());
		    if (!bool3) {
		        alert("휴대폰 형식이 아닙니다.");
		        return;
		    }

		    // 두 값이 모두 유효한 경우
		    if (bool2 && bool3) {
		        $("table#tblMemberRegister :input").prop("disabled", false);
		        goFind();
		        

		  	  $("input:text[name='hp3']").bind("keyup", function(e){
		  		  if(e.keyCode == 13) {
		  		  	goFind();
		  		  }
		  	  });// end of $("input:text[name='email']").bind("keyup", function(e){})-------
		    }
		});
	  
	  
	  
	  
}); // end of $(document).ready(function(){})-----------------


// Function Declaration
function goFind() {
	 
	  const userid = $("input:text[name='userid']").val().trim();
	  
	  if(userid == "") {
		  alert("아이디를 입력하세요!!");
		  return; // 종료
	  }
	  
	  
	  const hp1 = $("input:text[name='hp1']").val().trim();
	  const hp2 = $("input:text[name='hp2']").val().trim();
	  const hp3 = $("input:text[name='hp3']").val().trim();
	  
	  
		
		
		// 주기적으로 값 확인
	    let interval = setInterval(function(json) {
	    	console.log($("input#ajax").val());
	        if ($("input#ajax").val() != "") {
	            clearInterval(interval); // 주기적 확인 중지
	            
	            let dataObj;
	    		dataObj = {"mobile":hp1+hp2+hp3,
	    				   "smsContent":$("input#ajax").val()};
	            
	            $.ajax({
	                url: "${pageContext.request.contextPath}/myPage/member/smsSend.car",
	                type: "get",
	                data: dataObj,
	                dataType: "json",
	                success: function(json) {
	                    // json 은 {"group_id":"R2GWPBT7UoW308sI","success_count":1,"error_count":0} 처럼 된다. 
	                    if (json.success_count === 1) {
	                        $("div#smsResult").html("<span style='color:red; font-weight:bold;'>인증번호가 문자로 전송되었습니다.</span>");
	                    } else if (json.error_count !== 0) {
	                        $("div#smsResult").html("<span style='color:red; font-weight:bold;'>문자전송이 실패되었습니다.ㅜㅜ</span>");
	                    }

	                    $("div#smsResult").show();
	                    $("textarea#smsContent").val("");
	                },
	                error: function(request, status, error) {
	                    alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
	                }
	            });
	            
	            
	            if ($("#ajax").val() !== "") {
	  			  $("div#div_findResult").html("<input type='text' name='input_confirmCode' /><button type='button' class='btn btn-info'>인증하기</button>");
	  			    
		  	    }
		  		else{
		  			$("div#div_findResult").html("<span style='color: red;'>사용자 정보가 없습니다</span>");
		  		}
	            
	            
	            
	            
	         // === 인증하기 버튼 클릭시 이벤트 처리해주기 시작 === //
	      	  $("button.btn-info").click(function(){
	      		  
	      		  const input_confirmCode = $("input:text[name='input_confirmCode']").val().trim(); 
	      		  const confirmCode = $("input#ajax").val().trim(); 
	      		  
	      		  if(input_confirmCode == "") {
	      			  alert("인증코드를 입력하세요!!");
	      			  return; // 종료
	      		  }
	      		  
	      		  const frm = document.verifyCertificationFrm;
	      		  frm.userCertificationCode.value = input_confirmCode;
	      		  frm.CertificationCode.value=confirmCode;
	      		  frm.userid.value = $("input:text[name='userid']").val(); 
	      		  
	      		  frm.action = "<%= ctxPath%>/myPage/member/verifyCertification_pwdfind.car"; 
	      		  frm.method = "post";
	      		  frm.submit();
	      	  });
	      	  // === 인증하기 버튼 클릭시 이벤트 처리해주기 끝 === //
	      	  
	      	  
	            
	        }
	    }, 1000); // 1초마다 확인
     
	    
   
	  
}// end of function goFind(){}-----------------------
  
  
</script>

<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
	<input type="hidden" id="ajax" value="" />
	<form name="pwdFindFrm">
	
	   <ul style="list-style-type: none; margin-top: 10%; margin-left: 37.5%;">
	      <li>
	          <label style="display: inline-block; width: 75px;">아이디</label>
	          <input type="text" name="userid" size="25" autocomplete="off" /> 
	      </li>
	      <li>
	          <label style="display: inline-block; width: 75px;">휴대폰 번호</label>
	          <input type="text" name="hp1" id="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp; 
              <input type="text" name="hp2" id="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
              <input type="text" name="hp3" id="hp3" size="6" maxlength="4" />    
               
	      </li>
	   </ul> 
	
	   <div class="my-3 text-center">
	      <div class="border my-5 text-center" style="width: 60%; margin: 0 auto;">
		  	
		  	
		  	<div style="display: flex;">
		  	   <div style="border: solid 0px blue; width: 19%; margin: auto;">
		  	      <button type="button" id="btnSend" class="btn btn-secondary">인증번호받기</button>
		  	   </div>
		  	</div>
		  	<div id="smsResult" class="p-3"></div>
		</div>	  
	      <a type="button" class="btn btn-success" style="margin-top: 1.5%; margin-bottom: 1.5%;" href="<%= ctxPath%>/index.car">홈으로</a>
	   </div>
	   
	</form>
	
	<div class="my-3 text-center" id="div_findResult">
	   <c:if test="${json.isUserExist == false}">
	      <span style="color: red;">사용자 정보가 없습니다</span>
	   </c:if>
	   
	   <c:if test="${json.isUserExist == true}">
		   
	   </c:if>
	   
	</div>
	
	<%-- 인증하기 form --%>
	<form name="verifyCertificationFrm">
		<input type="text" name="userCertificationCode" />
		<input type="text" name="CertificationCode" />
		<input type="text" name="userid" />
	</form>
	
	<footer>
        <a href="#">이용약관</a> | <a href="#">개인정보 처리방침</a>
    </footer>
</body>
</html>    



    