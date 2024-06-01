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

<script type="text/javascript">

$(document).ready(function() {

        $('#go-main').click(function() {
            // 결제하기 버튼을 누르면 해당 정보들을 데이터베이스에 넣어준다.
            window.location.href = "/car/index.car";
        });
});

</script>

<div id="container" style="background-color: white; color: black;">
    <div id="container2">
        <h1 style="font-weight: 300; font-size: 23pt;">시승 신청이 완료되었습니다.</h1>
        <h1 style="font-weight: 300; font-size: 23pt; color:chocolate">감사합니다.</h1>
    


        <div class="cm-table type-row left-align-2 left-align-3 display-pc">
            <table id = "applyList">
                <colgroup>
                    <col style="width:20%;">
                    <col style="width:55%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody id="appCheck">
                    <tr>
                        <th scope="row" name="name" value="홍길동">홍길동</th>
                        <td>신청자 이름</td>
                    </tr>
                    <tr>
                        <th scope="row" name="phone" value="01071842459">01071842459</th>
                        <td>휴대폰</td>
                    </tr>
                    <tr>
                        <th scope="row" name="carName" value="G90" >G90</th>
                        <td>시승 희망 차량</td>
                    </tr>
                    <tr>
                        <th scope="row" name="schedule" value="2024-07-01">2024-07-01</th>
                        <td>신청일</td>
                    </tr>
                    <tr>
                        <th scope="row" name="place_name" value="드라이빙 라운지 성수">드라이빙 라운지 성수</th>
                        <td>신청 지점</td>
                    </tr>
                    <tr>
                        <th scope="row" >시승 구분</th>
                        <td>동승 시승 서비스</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div id="input-button">
            <input type="button" id="go-main" class="cta-button type-line type-white" style="background-color: white; color: black;" value="메인화면으로 돌아가기" />
    </div>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include> 