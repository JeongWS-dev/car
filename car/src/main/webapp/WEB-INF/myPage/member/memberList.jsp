<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>

<jsp:include page="../login_myPage_Header.jsp" />  

<style type="text/css">
   div.container{
 	padding: 3% 0; 
 	border: solid 0px red; 
 	margin-left : 7%;
}
  table#memberTbl {
     width: 80%;
     margin: 0 auto;
  }
 
  table#memberTbl th {
     text-align: center;
     font-size: 14pt;
 
  }
 
  table#memberTbl tr.memberInfo:hover {
    background-color : #F5F5F5;
    cursor: pointer;
   	color : #ff8040;
  }
 
  form[name="member_search_frm"] {
     border: solid 0px red;
     width: 80%;
     margin: 0 auto 3% auto;
  }
 
  form[name="member_search_frm"] button.btn-secondary {
     margin-left: 2%;
     margin-right: 32%;
  }
 
  div#pageBar {
     border: solid 0px red;
     width: 80%;
     margin: 3% auto 0 auto;
     display: flex;
  }
 
  div#pageBar > nav {
     margin: auto;
  }
 
</style>
<script type="text/javascript">
	$(document).ready(function(){
		if( "${requestScope.searchType}" != "" && "${requestScope.searchWord}" != "" ){
			<%-- 문자열 비교는 "name" != ""이렇게 해야 하기 때문에 requestScope를 할 때도 달러 앞, 대괄호 뒤에 큰 따옴표를 꼭 붙여야 한다.--%>
		   	$("select[name='searchType']").val("${requestScope.searchType}");
		   	$("select[name='searchWord']").val("${requestScope.searchWord}");
	   	}
		if("${requestScope.sizePerPage}" != ""){
			$("select[name='sizePerPage']").val("${requestScope.sizePerPage}");
		}
			
	  
     	$("input:text[name='searchWord']").bind("keydown", function(e){
   		if(e.keyCode==13){
   			goSearch();
   	  	}
     	});
    
     <%--**** select 태그에 대한 이벤트는 click 이 아니라 change 이다. **** //.--%>
     	$("select[name='sizePerPage']").bind("change", function(){
   		const frm = document.member_search_frm;
   		 //  frm.action = "memberList.up"; // form 태그에 action 이 명기되지 않았으면 현재보이는 URL 경로로 submit 되어진다.
   		 //  frm.method = "get"; // form 태그에 method 를 명기하지 않으면 "get" 방식이다.
			frm.submit();
     	});
     	
    // **** 특정 회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다. **** //
    	$("table#memberTbl tr.memberInfo").click( e => {
    		//alert($(e.target).parent().html()); // tr라인을 클릭하면 결국 td(이름, 이메일 등)를 클릭하는 것. 클릭한 것에서 한 칸 위로 올라오기 위해서 parent를 쓰는 것.
    		//const userid = $(e.target).parent().find(".userid").text(); // userid 클래스의 값을 알아올 때 .text()를 씀 ${membervo.userid}의 값을 알아오는 것.
    	// 또는
    		const userid = $(e.target).parent().children(".userid").text();
    		//alert(userid);
    		
    		const frm = document.memberOneDetail_frm;
    		frm.userid.value=userid;
    		
   <%--		frm.action = "<%= ctxPath%>/member/memberOneDetail.up"; 아래와 같은 내용임 --%>
    		frm.action = "${pageContext.request.contextPath}/admin/memberOneDetail.car";
    		frm.method ="post";
    		frm.submit();     		
    	});
   
    	<%--  .jsp 파일에서 사용되어지는 것들
       console.log('${pageContext.request.contextPath}');  // 컨텍스트패스   /MyMVC
       console.log('${pageContext.request.requestURL}');   // 전체 URL     http://localhost:9090/MyMVC/WEB-INF/member/admin/memberList.jsp
       console.log('${pageContext.request.scheme}');       // http        http
       console.log('${pageContext.request.serverName}');   // localhost   localhost
       console.log('${pageContext.request.serverPort}');   // 포트번호      9090
       console.log('${pageContext.request.requestURI}');   // 요청 URI     /MyMVC/WEB-INF/member/admin/memberList.jsp
       console.log('${pageContext.request.servletPath}');  // 파일명       /WEB-INF/member/admin/memberList.jsp
     --%>
	});// end of $(document).ready(function(){}--------------------
  function goSearch(){
	   const searchType = $("select[name='searchType']").val();
	  
	   if(searchType == ""){
		   alert("검색대상을 선택하세요!!");
		   return; //goSearch()함수를 종료한다.
	   }
	  
	   const frm = document.member_search_frm;
	 //  frm.action = "memberList.up"; // form 태그에 action 이 명기되지 않았으면 현재보이는 URL 경로로 submit 되어진다.
	 //  frm.method = "get"; // form 태그에 method 를 명기하지 않으면 "get" 방식이다.
	   frm.submit();
	  
  }// end of  function goSearch(){}------------------------
</script>
<div class="container">
  <h2 class="text-center mb-5"> &lt; 회원 전체 목록 &gt; </h2>
 
  <form name="member_search_frm">
     <select name="searchType" style="height : 30px;">
        <option value="">검색대상</option>
        <option value="username">회원명</option>
        <option value="pk_userid">아이디</option>
        <option value="useremail">이메일</option>
     </select>
     &nbsp;
     <input type="text" name="searchWord"  style="height : 30px;" />
     <%--
            form 태그내에서 데이터를 전송해야 할 input 태그가 만약에 1개 밖에 없을 경우에는
            input 태그내에 값을 넣고나서 그냥 엔터를 해버리면 submit 되어져 버린다.
            그래서 유효성 검사를 거친후 submit 을 하고 싶어도 input 태그가 만약에 1개 밖에 없을 경우라면
            유효성검사가 있더라도 유효성검사를 거치지 않고 바로 submit 되어진다.
            이것을 막으려면 input 태그가 2개 이상 존재하면 된다. 
            그런데 실제 화면에 보여질 input 태그는 1개 이어야 한다.
            이럴 경우 아래와 같이 해주면 된다.
            또한 form 태그에 action 이 명기되지 않았으면 현재보이는 URL 경로로 submit 되어진다.  
       --%>
		<input type="text" style="display: none;" /> <%-- 조심할 것은 type="hidden" 이 아니다. --%>
    
     	<button type="button" class="btn btn-secondary" onclick="goSearch()">검색</button>
    
     	<span style="font-size: 12pt; font-weight: bold;">페이지당 회원명수&nbsp;:&nbsp;</span>
     	<select name="sizePerPage"  style="height : 30px;">
        	<option value="10">10명</option>
        	<option value="5">5명</option>
        	<option value="3">3명</option>     
     	</select>
  	</form>
 
  	<table class="table table-bordered" id="memberTbl">
     <thead>
         <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>회원명</th>
            <th>이메일</th>
            <th>성별</th>
         </tr>
     </thead>
    
     <tbody>
     	<c:if test="${not empty requestScope.memberList}">
     		<c:forEach var="membervo" items="${requestScope.memberList}" varStatus="status">
     			<tr class="memberInfo">
     				<fmt:parseNumber var="currentShowPageNo" value="${requestScope.currentShowPageNo}"></fmt:parseNumber>
     				<fmt:parseNumber var="sizePerPage" value="${requestScope.sizePerPage}" />
     				<%-- fmt:parseNumber 은 문자열을 숫자형식으로 형변환 시키는 것이다. --%>
     				<td>${(requestScope.totalMemberCount) - (currentShowPageNo-1) * sizePerPage - (status.index)} </td>
     				
     				<%-- >>> 페이징 처리시 보여주는 순번 공식 <<<
                    데이터개수 - (페이지번호 - 1) * 1페이지당보여줄개수 - 인덱스번호 => 순번
                
                    <예제>
                    데이터개수 : 12
                    1페이지당보여줄개수 : 5
                
                    ==> 1 페이지      
                    12 - (1-1) * 5 - 0  => 12
                    12 - (1-1) * 5 - 1  => 11
                    12 - (1-1) * 5 - 2  => 10
                    12 - (1-1) * 5 - 3  =>  9
                    12 - (1-1) * 5 - 4  =>  8
                
                    ==> 2 페이지
                    12 - (2-1) * 5 - 0  =>  7
                    12 - (2-1) * 5 - 1  =>  6
                    12 - (2-1) * 5 - 2  =>  5
                    12 - (2-1) * 5 - 3  =>  4
                    12 - (2-1) * 5 - 4  =>  3
                
                    ==> 3 페이지
                    12 - (3-1) * 5 - 0  =>  2
                    12 - (3-1) * 5 - 1  =>  1
                --%>
     				
     				<td class="userid">${membervo.pk_userid}</td><%-- get 다음의 userid 적기 --%>
     				<td>${membervo.username}</td>
     				<td>${membervo.useremail}</td>
     				<td>${membervo.usergender}</td>
     			</tr>
     		</c:forEach>
     	</c:if>
       <c:if test="${empty requestScope.memberList}">
       	<tr>
       		<td colspan="5">데이터가 존재하지 않습니다.</td>
       	</tr>
       </c:if>
     </tbody>
  </table>    
   <div id="pageBar">
      <nav>
         <ul class="pagination">${requestScope.pageBar}</ul>
      </nav>
   </div>
</div>
<form name="memberOneDetail_frm">
	<input type="hidden" name="userid" />
	<input type="hidden" name="goBackURL" value="${requestScope.currentURL}"/>
</form>
<jsp:include page="../login_myPage_Footer.jsp" />  
