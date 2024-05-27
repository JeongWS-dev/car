<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>

<title>약관</title> 
<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/provision.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<div id="container" style="background-color: white; color: black;">
    <div id="container2">
        <h1 style="font-weight: 300; font-size: 23pt;">약관 동의</h1>
        <span>시승 신청을 위해 약관을 읽고 동의해 주세요.</span>
        <hr>
        <form action="/submit" method="post">
            <fieldset>
            
            <input type="checkbox" id="news" name="preferences" value="news">
            <label for="news">시승 유의사항, 개인정보 수집·이용, 광고성 정보 수신에 모두 동의합니다.</label><br>
            <hr>
            
            <input type="checkbox" id="updates" name="preferences" value="updates">
            <label for="updates">제네시스 시승 신청 이용고객 유의사항에 동의합니다. (필수)</label><br>
            <iframe src="<%= ctxPath%>/iframe_agree/agree1.html" width="100%" height="150px" style="border: solid 1px navy;"></iframe>
            <hr>
            <input type="checkbox" id="offers" name="preferences" value="offers">
            <label for="offers">개인정보 수집 및 이용에 대하여 동의합니다. (필수)</label><br>
            <iframe src="<%= ctxPath%>/iframe_agree/agree2.html" width="100%" height="150px" style="border: solid 1px navy;"></iframe>
            <hr>
            <input type="checkbox" id="offers" name="preferences" value="offers">
            <label for="offers">마케팅 활용 및 광고성 정보 수신에 대하여 동의합니다. (선택)</label><br>
            <iframe src="<%= ctxPath%>/iframe_agree/agree3.html" width="100%" height="150px" style="border: solid 1px navy;"></iframe>
            <hr>
            </fieldset>
            <div id="input-button">
                <input type="button" class="cta-button type-line type-white" style="background-color: white; color: black;" value="이전" onclick="goBack()" />
                <input type="reset"  class="cta-button type-line js-layer-opener is-async" style="background-color: black; color: white;"  value="다음" onclick="goNext()" />
            </div>
        </form>
    </div>

    <div id="container3" style="background-color: black; color: white;">
        <div id="go-event">
            <img src="<%= ctxPath%>/images/drivetry_ApplyPage/genesis-kr-test-drive-event-banner-all-day-pc_4.jpg" id="event-img"/>
        </div>
        <h2 class="el-title" style="font-weight: 300; font-size: 25pt;">
            전기차 All Day <br>Driving <br>EXPERIENCE
        </h2>
    </div>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>