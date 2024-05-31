<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>

<title>드라이빙 라운지 선택</title> 
<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/drivingLoungeChoice.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<script type="text/javascript" src ="<%= ctxPath %>/js/drivingLoungeChoice.js"></script>

<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<div id="container">
    <div id="in-container">
        <div id="place" style="text-align: center;">
            
            <c:if test="${not empty requestScope.areaList}">
                <div id="table">
                    <table id="areatable">
                        <tr id="title">
                            <td>지역 선택</td>
                        </tr>
                        <c:forEach var = "area_map" items="${requestScope.areaList}">
                            <tr>
                                <td><button id="areachoicebtn" onclick="choiceArea('${area_map.Area}')">${area_map.Area}</button></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </c:if>

        </div>
    </div>

</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>