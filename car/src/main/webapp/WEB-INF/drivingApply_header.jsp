<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%><!DOCTYPE html>
<html>
<head>

<title>제네시스 시승 신청</title> 

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/drivingLounge.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<jsp:include page="Main_Header.jsp"></jsp:include>

<div id="container">

<div class="cp-headline__text">
<br>
    <h1 class="el-head">
        <span class="display-pc">시승 신청</span>
    </h1>
    <hr style="border: 0; height: 1px; background-color: #333333;"/>
    <nav class="navbar navbar-expand-sm navbar-dark" id="drivingapply_navbar">
        <ul class="navbar-nav" style="font-size: 16pt;">
            <li class="nav-item "> 
                <a class="nav-link" href="<%= ctxPath%>/drivetryApply/drivingLounge.car">차량 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </li>
            <span id="next">〉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <li class="nav-item">
                <a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#ApplynoAccept" data-dismiss="modal">드라이빙 라운지 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </li>
            <span id="next">〉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <li class="nav-item">
                <a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#ApplynoAccept" data-dismiss="modal">유의사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </li>
            <span id="next">〉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <li class="nav-item">
                <a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#ApplynoAccept" data-dismiss="modal">신청내역 확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </li>
            <span id="next">〉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <li class="nav-item">
                <a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#ApplynoAccept" data-dismiss="modal">신청완료</a>
            </li>
        </ul>
    </nav>
</div>

    <div class="modal fade" id="ApplynoAccept" data-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal header -->
            <div class="modal-header">
              <button type="button" class="close noAccept" data-dismiss="modal">&times;</button>   <!-- 이 버튼이 x -->
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">    
                    현재 진행중인 시승 신청 단계를 완료해야
                    다음 단계로 이동이 가능합니다.
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger idFindClose" data-dismiss="modal">Close</button>
            </div>
          </div>
          
        </div>
    </div>

