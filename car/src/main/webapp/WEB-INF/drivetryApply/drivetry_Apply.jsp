<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/drivetry_Apply.css">
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
<title>제네시스 시승신청 &amp;스페이스 | 제네시스</title>
</head>
<body>

<div id="container">

<div class="cp-headline__text">
<br>
    <h1 class="el-head">
        <span class="display-pc">시승 신청</span>
    </h1>
    <br><br><br>
    <p class="el-desc ">
        시승 희망 장소를 선택해주세요. <br/>(드라이빙 라운지 / 제네시스 스페이스)
    </p>
    <br><br><br>
    
    <div class = "image">
	    <div class="image_1">
	       <div class="image_1_text">
		       <strong class="el-title">
		          <span class="display-pc">드라이빙 라운지</span>
		       </strong>
		       <p class="el-desc">
		          <br>차량 시승<br><br>가깝고 편리한 환경에서 제네시스 차량을 시승하실 수 있는 공간<br><br>
		       </p>
		       <div id="image_1_button">
				<button type="button" class="driving-lounge" title="드라이빙 라운지 바로가기">드라이빙 라운지 바로가기</button>

		        <button type="button" class="driving-lounge" title="예약 확인 및 변경하기">예약 확인 및 변경하기</button>
	       		</div>
	       </div>
	    </div>
	    
	    <div class="image_2">
	       <div class="image_2_text">
		       <strong class="el-title">
		          <span class="display-pc">제네시스 스페이스</span>
		       </strong>
		       <p class="el-desc">
		          <br>시승 체험<br><br>제네시스의 모든 라인업을 가장 완벽한 환경에서 체험하고 시승하실 수 있는 공간<br><br>
		       </p>
		       <div id="image_2_button">
		           <button type="button" class="driving-lounge" title="예약 확인 및 변경하기">예약 확인 및 변경하기</button>
		       </div>
	       </div>
	    </div>


 	</div>

	 <div class="cp-table__item">
		<h2 class="table-title">제네시스 스페이스</h2>
		<div class="cm-table type-row left-align-2 left-align-3 display-pc">
			<table id = driveTry_Table>
				<colgroup>
					<col style="width:20%;">
					<col style="width:55%;">
					<col style="width:25%;">
				</colgroup>
				<tbody id = "addressTable">
					<tr>
						<th scope="row">제네시스 강남</th>
						<td>서울시 강남구 영동대로 410</td>
						<td>02-556-9870</td>
					</tr>
					<tr>
						<th scope="row">제네시스 수지</th>
						<td>경기도 용인시 풍덕천동 860</td>
						<td>1522-8830</td>
					</tr>
					<tr>
						<th scope="row">제네시스 스튜디오 하남</th>
						<td>경기도 하남시 미사대로 750번지 스타필드 하남 2층</td>
						<td>031-8072-8371</td>
					</tr>
					<tr>
						<th scope="row">제네시스 스튜디오 안성</th>
						<td>경기도 안성시 공도읍 서동대로 3930-39 스타필드 안성 2F 제네시스 스튜디오</td>
						<td>031-8092-1601</td>
					</tr>
					<tr>
						<th scope="row">현대 모터스튜디오 서울</th>
						<td>서울 강남구 언주로 738</td>
						<td>1899-6611</td>
					</tr>
					<tr>
						<th scope="row">현대 모터스튜디오 고양</th>
						<td>경기도 고양시 일산서구 킨텍스로 217-6</td>
						<td>1899-6611</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
</div>

</div>

</body>
</html>