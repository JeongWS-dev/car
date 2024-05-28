<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

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


<jsp:include page="../drivingApply_header.jsp"></jsp:include>


<!-- 견적내기에서 가져와야함. 끝-->

    <div id="go-event">
        <img src="<%= ctxPath%>/images/drivetry_ApplyPage/genesis-kr-test-drive-event-banner-all-day-pc_4.jpg" id="event-img"/>
    </div>
    <h2 class="el-title" style="font-weight: 300; font-size: 25pt;">
        전기차 All Day <br>Driving <br>EXPERIENCE
    </h2>
	<table id="cautionTable" style="color: white;">
		<tr>
			<td><h2 id="caution">※ 유의사항</h2></td>
			<td><div id = "caution-detail">
					<span>・만 21세 이상, 운전면허 소지자라면 누구나 이용 가능합니다. (보험 적용 기준에 따라 만 21세 미만 이용 불가) <br></span>
					<span>・고객 한 분 당 한 번에 1건만 신청 가능합니다. (2대 이상 비교시승은 드라이빙라운지나 EV스테이션으로 전화 문의) <br></span> 
					<span>・연 최대 6회 시승 이용 가능합니다. (단, EV스테이션 이용건수는 합산에서 제외) <br></span>
					<span>・마이페이지 > 로그인 > 시승/상담 > 시승 신청 조회에서도 시승 신청 내역을 확인 하실 수 있습니다.<br></span>
				</div>
			</td>
		</tr>
	</table>

	 <div class="cp-table__item">
		<div id="genesis-space">
			<h2 class="table-title" style="font-size: 25pt;">제네시스 스페이스<br><br></h2>
			<span style="font-size: 15pt;"> 제네시스 스페이스 체험은 제네시스 스페이스 페이지에서 신청이 가능합니다.</span>
			<a class="nav-link" href="<%= ctxPath%>/drivetryApply/space.car"  class="btn">
				<span class="go-space" title="스페이스 바로가기">제네시스 스페이스 바로가기&nbsp;&nbsp;></span>
			</a>
		</div>

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


<jsp:include page="../Main_Footer.jsp"></jsp:include>