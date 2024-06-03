<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<jsp:include page="../myPage/login_myPage_Header.jsp" />  


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
      width: 30%;
      font-weight: bold;
      text-align: center;
      
  }

  table.table-bordered > tbody > tr > td:nth-child(2) {
  font-weight: 500;
	color: #ff8040;
   }
   

</style>


<div class="container">
	<c:if test="${empty requestScope.onePaperMap}"> 
		존재하지 않는 견적서입니다.<br>
	</c:if>
	<c:if test="${not empty requestScope.onePaperMap}"> 
		<p class="h3 text-center mt-5 mb-4"> <u>${requestScope.onePaperMap.username}</u> 회원님의 상세정보 </p>
		<br>
		
		<table class="table table-bordered" style="width: 70%; margin: 0 auto; ">
			<tr>
	            <td>견적서 번호</td>
	            <td>${requestScope.onePaperMap.pk_paperseq}</td>
	        </tr>
	        <tr>
	            <td>아이디</td>
	            <td>${requestScope.onePaperMap.pk_userid}</td>
	        </tr>
	        <tr>
	            <td>회원명</td>
	            <td>${requestScope.onePaperMap.username}</td>
	        </tr>
	        <tr>
	            <td>차량명</td>
	            <td>${requestScope.onePaperMap.fk_carname}</td>
	        </tr>
	        <tr>
	            <td>차량 가격</td>
	            <td><fmt:formatNumber value="${requestScope.onePaperMap.CarPrice}" pattern="#,###"/>원</td>
	        </tr>
	        <tr>
	            <td>차량 내부 색상</td>
	            <td>${requestScope.onePaperMap.incolordesc}</td>
         	</tr>
         	<tr>
	            <td>차량 내부 색상 가격</td>
	            <td><fmt:formatNumber value="${requestScope.onePaperMap.incolorPrice}" pattern="#,###"/>원</td>
         	</tr>
         	<tr>
	            <td>차량 외부 색상</td>
	            <td>${requestScope.onePaperMap.outcolordesc}</td>
         	</tr>
         	<tr>
	            <td>차량 외부 색상 가격 </td>
	            <td><fmt:formatNumber value="${requestScope.onePaperMap.outcolorprice}" pattern="#,###"/>원</td>
	         </tr>
        </table>
	</c:if>
	<br>
	<br>
	 <div class="text-center mb-5">
   <%--    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='memberList.car'">회원목록[처음으로]</button> --%> 
   <%--    <button type="button" class="btn btn-success mx-5" onclick="javascript:history.back()">회원목록[history.back()]</button>--%> 
       <button type="button" class="btn btn btn btn-dark mx-5" onclick="javascript:location.href='${pageContext.request.contextPath}${requestScope.goBackURL}'"> 검색한 견적서 목록 </button>
     																	<%-- 여기까지는 /MyMVC이고 				여기는 주소 --%>
       </div>		
</div>
<br>
<br>

      
      
<jsp:include page="../myPage/login_myPage_Footer.jsp" />  
