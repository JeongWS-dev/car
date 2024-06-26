<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
    
<jsp:include page="../login_myPage_Header.jsp" />

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/memberEdit.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/user/memberEdit.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		// "이메일중복확인" 을 클릭했을 때 이벤트 처리하기
		$("span#emailcheck").click(function(){
			console.log("test");
			const frm = document.emailSendFrm;
	         frm.action = "<%= ctxPath%>/myPage/memberRegister/emailsend.car";
	         frm.method = "post";

	         frm.submit();

		});

	});	//	end of $(document).ready(function(){--------
		
		
	function godelete(){
		var result = confirm("탈퇴하실 경우, 1년간 동일 정보로 재가입이 불가합니다.\n정말로 탈퇴하시겠습니까?");
	    
		if(result){
			
			$.ajax({
		        url: "<%= ctxPath%>/myPage/member/MemberDel.car",
		        data: { "userid": "${sessionScope.loginuser.pk_userid}" },
		        type: "post",
		        dataType: "json",
		        success: function(response) {
		            if (response.success) {
		                alert("회원 탈퇴가 완료되었습니다.\n메인페이지로 이동합니다.");
		                window.location.href = "/car/index.car"; // 페이지 이동
		                
		                
		            } else {
		                alert("회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
		            }
		        },
		        error: function(request, status, error) {
		            alert("회원 탈퇴 도중 오류가 발생했습니다.");
		            console.error("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		    });
			
			
		}
		else{
			alert("탈퇴가 취소되었습니다.");
			session.removeAttribute("goBackURL");
		}
	}

</script>


<style>
	.title {
           font-size: 24px;
           margin-top:1%;
           margin-bottom: 2%;
       }

</style>
</head>
<body>
	<div class="row" id="divEditFrm">
   <div class="col-md-12">
      <form name="editFrm" id="editForm">
         <table id="tblMemberEdit">
            <thead>
               <tr>
                  <h2 class="title">회원수정</h2>
                  <p class="description">수정하고자 하시는 정보를 입력해주세요.
                     <br>
                     <span style="font-size: 10px;"><span class="star" style="font-size: 10px;">*</span>표시는 필수입력사항</span>
                  </p>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td colspan="2" style="line-height: 50%;">&nbsp;</td>
               </tr>
               <tr>
                  <td>성명&nbsp;<span class="star">*</span></td>
                  <td>
                     <input type="hidden" name="userid" value="${sessionScope.loginuser.pk_userid}" />
                     <input type="text" name="name" id="name" maxlength="30" class="requiredInfo" value="${sessionScope.loginuser.username}" />
                     <span class="error">성명은 필수입력 사항입니다.</span>
                  </td>
               </tr>
               <tr>
                  <td>비밀번호&nbsp;<span class="star">*</span></td>
                  <td>
                     <input type="password" name="pwd" id="pwd" maxlength="15" class="requiredInfo" />
                     <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
                     <span id="duplicate_pwd" style="color: red;"></span>
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
                     <input type="text" name="email" id="email" maxlength="60" class="requiredInfo" value="${sessionScope.loginuser.useremail}" />
                     <span class="error">이메일 형식에 맞지 않습니다.</span>
                     <%-- 이메일중복체크 --%>
                     <span id="emailcheck">이메일인증</span>
                     <span id="emailCheckResult"></span>
                  </td>
               </tr>
               <tr>
                  <td>연락처&nbsp;</td>
                  <td>
                     <input type="text" name="hp1" id="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp; 
                     <input type="text" name="hp2" id="hp2" size="6" maxlength="4" value="${fn:substring(sessionScope.loginuser.usermobile, 3, 7)}" />&nbsp;-&nbsp;
                     <input type="text" name="hp3" id="hp3" size="6" maxlength="4" value="${fn:substring(sessionScope.loginuser.usermobile, 7, 11)}" />    
                     <span class="error">휴대폰 형식이 아닙니다.</span>
                  </td>
               </tr>
               <tr>
                  <td>우편번호</td>
                  <td>
                     <input type="text" name="postcode" id="postcode" size="6" maxlength="5" value="${sessionScope.loginuser.userpostcode}" />&nbsp;&nbsp;
                     <%-- 우편번호 찾기 --%>
                     <img src="<%= ctxPath%>/images/myPage/b_zipcode.gif" id="zipcodeSearch" />
                     <span class="error">우편번호 형식에 맞지 않습니다.</span>
                  </td>
               </tr>
               <tr>
                  <td>주소</td>
                  <td>
                     <input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" value="${sessionScope.loginuser.useraddress}" /><br>
                     <input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" value="${sessionScope.loginuser.userdetailaddress}" />&nbsp;<input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" value="${sessionScope.loginuser.userextraaddress}" />            
                     <span class="error">주소를 입력하세요.</span>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" class="text-center" style="padding: 30px 0 10px 0;">
                     <input type="button" class="btn btn-success mr-5" value="수정하기" onclick="goEdit()" />
                     <input type="reset"  class="btn btn-danger mr-5" value="취소하기" onclick="<%= ctxPath%>/myPage/myinfoEdit.car" />
                     <input type="button" class="btn btn-warning" value="탈퇴하기" onclick="godelete()" />
                  </td>
               </tr>
            </tbody>
         </table>
      </form>
   </div>
</div>
 
</body>
</html>

<jsp:include page="../login_myPage_Footer.jsp" />