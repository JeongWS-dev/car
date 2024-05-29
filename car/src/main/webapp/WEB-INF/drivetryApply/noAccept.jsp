<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

    <form name="noAccept">
        <c:if test= "${empty requestScope.carname}">
            <!-- 시승 신청단계를 완료하지않은 경우 -->
            <div>
                현재 진행중인 시승 신청 단계를 완료해야
                다음 단계로 이동이 가능합니다.
            </div>
        </c:if>
        <c:if test= "${empty sessionScope.loginuser.userid}">
            <!-- 로그인을 하지 않은 경우 -->
            <div>
                로그인 후 시승신청이 가능합니다.
            </div>
        </c:if>
        
        <div class="my-3 text-center"></div>
    
    </form>




