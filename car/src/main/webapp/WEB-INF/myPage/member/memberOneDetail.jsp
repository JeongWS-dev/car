<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<jsp:include page="../login_myPage_Header.jsp" />  


<style type="text/css">

  div.container{
 	padding: 0; 
 	border: solid 0px red; 
 	margin-left : 7%
 	
}

   table.table-bordered > tbody > tr {
   
   		background-color : #F5F5F5;
   }

  table.table-bordered > tbody > tr> td:nth-child(1) {
      width: 20%;
      font-weight: bold;
      text-align: center;
      
  }

  table.table-bordered > tbody > tr > td:nth-child(2) {
  font-weight: 500;
	color: #ff8040;
   }
   

</style>


<div class="container">
	<c:if test="${empty requestScope.mvo}"> 
		존재하지 않는 회원입니다<br>
	</c:if>
	<c:if test="${not empty requestScope.mvo}"> 
		<c:set var="usermobile" value="${requestScope.mvo.usermobile}"/>
		<p class="h3 text-center mt-5 mb-4"> <u> ${requestScope.mvo.username}</u> 회원님의 상세정보 </p>
		<br>
		
		<table class="table table-bordered" style="width: 70%; margin: 0 auto; ">
	        <tr>
	            <td>아이디</td>
	            <td>${requestScope.mvo.pk_userid}</td>
	        </tr>
	        <tr>
	            <td>회원명</td>
	            <td>${requestScope.mvo.username}</td>
	        </tr>
	        <tr>
	            <td>이메일</td>
	            <td>${requestScope.mvo.useremail}</td>
	        </tr>
	        <tr>
	            <td>휴대폰</td>
	            <td>${fn:substring(usermobile,0,3)}-${fn:substring(usermobile,3,7)}-${fn:substring(usermobile,7,11)}</td>
	        </tr>
	        <tr>
	            <td>우편번호</td>
	            <td>${requestScope.mvo.userpostcode}</td>
         	</tr>
         	<tr>
	            <td>주소</td>
	            <td>${requestScope.mvo.useraddress}&nbsp;
	                ${requestScope.mvo.userdetailaddress}&nbsp;
	                ${requestScope.mvo.userextraaddress}
	            </td>
         	</tr>
         	<tr>
	            <td>성별</td>
	            <td>${requestScope.mvo.usergender}</td>
         	</tr>
         	<tr>
	            <td>생년월일</td>
	            <td>${requestScope.mvo.userbirthday}</td>
	         </tr>
	         <tr>
	            <td>만나이</td>
	            <td>${requestScope.mvo.userage}&nbsp;세</td>
	         </tr>
	         <tr>
	            <td>가입일자</td>
	            <td>${requestScope.mvo.userregisterday}</td>
	         </tr>
        </table>
	</c:if>
	<br>
	<br>
	 <div class="text-center mb-5">
   <%--    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='memberList.car'">회원목록[처음으로]</button> --%> 
   <%--    <button type="button" class="btn btn-success mx-5" onclick="javascript:history.back()">회원목록[history.back()]</button>--%> 
       <button type="button" class="btn btn btn btn-dark mx-5" onclick="javascript:location.href='${pageContext.request.contextPath}${requestScope.goBackURL}'">검색한 회원목록</button>
     																	<%-- 여기까지는 /MyMVC이고 				여기는 주소 --%>
       </div>		
</div>
<br>
<br>

      
      
<jsp:include page="../login_myPage_Footer.jsp" />  
