<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   String ctxPath = request.getContextPath();
%>


<jsp:include page="login_myPage_Header.jsp" />

	<video id="video" autoplay muted loop>
        <source src="<%= ctxPath %>/video/GV70 _ Style Meets Performance _ 제네시스.mp4" type="video/mp4">
    </video>

<jsp:include page="login_myPage_Footer.jsp" />
