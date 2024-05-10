<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/space.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제네시스 스페이스 소개  | 제네시스</title>

</head>

<video autoplay muted loop id="backgroundVideo">
    <source src="<%= ctxPath%>video/drivetry_ApplyPage/SnapSave.io-THE GENESIS STAGE. G80 _ 제네시스-(1080p).mp4" type="video/mp4">
    <p>GENESIS SPACE</p>
    <p>브랜드, 제품, 손님이 독창성을 가진 공간 안에서 서로 공명하며 제네시스만의 특별한 경험을 완성합니다.</p>
    
  </video>
</body>
</html>