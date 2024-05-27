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
<link rel="stylesheet" href="<%= ctxPath%>/css/applyCheck.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<div id="container" style="background-color: white; color: black;">
    <div id="container2">
        <h1 style="font-weight: 300; font-size: 23pt;">선택하신 정보로 시승예약하시겠습니까?</h1>
        <h1 style="font-weight: 300; font-size: 23pt; color:chocolate">'예'선택 시 시승예약이 진행됩니다.</h1>
    


        <div class="cm-table type-row left-align-2 left-align-3 display-pc">
            <table id = "applyList">
                <colgroup>
                    <col style="width:20%;">
                    <col style="width:55%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody id="appCheck">
                    <tr>
                        <th scope="row">신청자 이름</th>
                        <td>신청자 이름</td>
                    </tr>
                    <tr>
                        <th scope="row">휴대폰</th>
                        <td>휴대폰</td>
                    </tr>
                    <tr>
                        <th scope="row">시승 희망 차량</th>
                        <td>시승 희망 차량</td>
                    </tr>
                    <tr>
                        <th scope="row">신청일</th>
                        <td>신청일</td>
                    </tr>
                    <tr>
                        <th scope="row">신청 지점</th>
                        <td>신청 지점</td>
                    </tr>
                    <tr>
                        <th scope="row">시승 구분</th>
                        <td>시승 구분</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="ApplyFee">
            <span style="font-size: 25pt; font-weight: 300;">시승비</span>
        </div>

        <div id="input-button">
            <input type="button" class="cta-button type-line type-white" style="background-color: white; color: black;" value="아니오(이전 화면으로)" onclick="goBack()" />
            <input type="reset"  class="cta-button type-line js-layer-opener is-async" style="background-color: black; color: white;"  value="예" onclick="goNext()" />
        </div>
    </div>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include> 