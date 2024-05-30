
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
<meta charset="UTF-8">
<title>GENESIS</title>

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/CompleteCreateCar.css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<%-- JQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />

<!-- 내가만든 js -->
<script type = "text/javascript">
	function exit(){
		location.href="\<%= ctxPath%>/index.car";
	}

	function func_is_login_save(){
		
		if ( ${not empty sessionScope.loginuser} ){
			location.href="<%=ctxPath%>/createCar/saveCreateCar.car";
		}
		else if( sessionStorage.getItem("userid") == null ) {
			$("div#login_modal").fadeIn();
		}
		else {
			sessionStorage.removeItem("userid");
			location.href="<%=ctxPath%>/createCar/saveCreateCar.car";
		}

	}

	function func_is_login(){
		
		if ( ${not empty sessionScope.loginuser} ){
			$("div#send_paper").fadeIn();
		}
		else if( sessionStorage.getItem("userid") == null ) {
			$("div#login_modal").fadeIn();
		}
		else {
			sessionStorage.removeItem("userid");
			$("div#send_paper").fadeIn();
		}

	}

	function try_car_login(){
		
		if ( ${not empty sessionScope.loginuser} ){
			const carname = $("span.model-name").text();
			location.href = "<%=ctxPath%>/drivetryApply/drivingLoungeChoice.car?pk_carname="+carname;
		}
		else if( sessionStorage.getItem("userid") == null ) {
			$("div#login_modal").fadeIn();
		}
		else {
			sessionStorage.removeItem("userid");
			const carname = $("span.model-name").text();
			location.href = "<%=ctxPath%>/drivetryApply/drivingLoungeChoice.car?pk_carname="+carname;
		}

	}
	
	$(document).ready(function(){
		$("div.loader").hide();
		let carname = $("input[name='sessionCarName']").val();
		$("span.model-name").text(carname.split("_").join(" "));
		$("div.choice_car_name").text(carname.split("_").join(" "));
		$("button.LoginClose").click(function(){
			$("div#login_modal").fadeOut();
		})

		$("button.send_paperClose").click(function(){
			$("div#send_paper").fadeOut();
		})
	})

	function login(){
		let ID = $("input[name='ID']").val().trim();
		let PWD = $("input[name='PWD']").val().trim();
		
		if(ID.length == 0){
			alert("아이디를 입력하세요.");
			$("input[name='ID']").val("").focus();
			return;
		}
		else if(PWD.length == 0){
			alert("비밀번호를 입력하세요.");
			$("input[name='PWD']").val("").focus();
			return;
		}
		else{
			$.ajax({
				url : "${pageContext.request.contextPath}/createCar/loginJSON.car",
				type : "post",
				data : {"ID":ID,"PWD":PWD},
				dataType:"json",
				success:function(json){
					if(json.loginuser.length > 0){
						$("div#login_modal").fadeOut();

						sessionStorage.setItem("userid",json.loginuser);
					}
					else{
						alert("아이디 혹은 비밀번호가 일치하지 않습니다.")
						$("input[name='PWD']").val("");
						$("input[name='ID']").val("").focus();
					}
				},
				error: function(request, status, error){
					alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
				}
			})
		}
	}

	function selectPlace(place) {
		let drivePlace = $(place).text();
		$("span.place").text(drivePlace);
	}

	function sendPaper(){
		const is_checked = $("input.send_input").is(":checked");
		const place = $("span.place").text();
		let optionNameJoin = "";
		$("div.optionName").each(function(index,item){
			optionNameJoin += $(item).text() + ",";
		})
		
		if(is_checked && place!=""){
			
			$("div#send_paper").fadeOut();
			$("div.loader").show();
			$.ajax({
				url : "${pageContext.request.contextPath}/createCar/sendPaperJSON.car",
				type : "post",
				data : {"place":place,"optionNameJoin":optionNameJoin},
				dataType:"json",
				success:function(json){
					$("div.loader").hide();
					if(confirm("정상적으로 전송되었습니다. 메인페이지로 이동하시겠습니까?")){
						location.href = "<%=ctxPath%>/index.car";
					}
				},
				error: function(request, status, error){
					alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
				}
			})
		}
		else{
			if(!is_checked){
				alert("개인정보 전송에 동의하셔야합니다.")
			}
			else{
				alert("대리점을 선택하셔야 합니다.")
			}
		}
	}
</script>

<body>
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
			<div style="width:auto; margin-right: 20px;">
				<div style="color:rgb(151, 151, 151);">GENESIS</div>
				<span class="model-name"></span>
				<input name="sessionCarName" type="hidden" value="${sessionScope.cvo.carName}"/>
			</div>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"> 
					<a class="nav-link">엔진 타입</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link">외장 컬러</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link">내장 디자인&컬러</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link">선택 품목</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" style="color:white; font-weight:bold; opacity:1;">견적완료</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#exit_modal" data-dismiss="modal"><i class="fa-solid fa-xmark"></i></a>
				</li>
			</ul>
		</nav>
		<div style="margin-top:70px;"></div>
		<div class="body">
			<div class="top" style="display:flex">
				<div class="DESC">
					<div class="choice_car_name">${sessionScope.cvo.carName}</div>
					<div class="choice_defualt_option">
						<span>${requestScope.Map.powerdesc}</span>
					</div>
					<span style="display: inline-block; color:rgb(168, 111, 64); font-size:13pt; margin-top:70px;">예상 견적 가격</span>
					<div style ="display:flex">
						<div class="total_price">${requestScope.total_price}</div><span style="margin-top: 42px; color:white;">원</span>
					</div>
					<span style = "color:rgb(77, 77, 77);">* 웹사이트 내 차량 및 옵션 관련 이미지는 실제 차량과 다를 수 있으므로 전시장 방문 및 실차 확인을 권장드립니다.</span>
				</div>
				<div class="IMG">
					<img src="<%=ctxPath%>/images/createCar/outColor/outColorCar/${requestScope.Map.outcolorcar_img}"/>
					
					<div style="color:rgb(139, 139, 139);">※ 상기 견적 금액은 23년 7월 1일부터 적용되는 개별소비세 변경 정책을 반영한 견적입니다. (개별소비세법 시행령 제 8조)</div>
					<div style="color:rgb(139, 139, 139);">※ 차량의 이미지는 실제 차량과 다를 수 있습니다.</div>
					<div style="color:rgb(139, 139, 139);">※ 본 견적은 2024.5.23에 작성되었습니다.</div>
					<div style="color:rgb(139, 139, 139);">※ 선택 품목을 포함한 최종 가격은 세제 혜택 등에 따라 상이 할 수 있습니다. 최종 판매가는 반드시 지점/대리점에 문의 바랍니다.</div>
					
				</div>
			</div>

			<div class="buttom" style="display:flex">
				<div class="preview_choice_option">
					<div class="preview_choice_option_title">견적 상세</div>
					<div class="preview_choice_options" style ="display:flex;">
						<div style="color:rgb(163, 113, 38);">기본 가격</div>
						<div style="margin:auto;"></div>
						<div style="margin-right: 0;">${requestScope.Map.carprice}</div>
					</div>
					<div class="preview_choice_options">
						<div style="color:rgb(163, 113, 38); margin-bottom: 10px;">엔진 타입</div>
						<div style="display: flex;">
							<img src = "<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/${requestScope.Map.powericon_img}"/>
							<div style = "margin-left: 15px; margin-top: 30px;">${requestScope.Map.powerdesc}</div>
							<div style="margin:auto;"></div>
							<div style="margin-right: 0; margin-top: 30px;">+${requestScope.Map.powerprice}</div>
						</div>
					</div>
					<div class="preview_choice_options">
						<div style="color:rgb(163, 113, 38); margin-bottom: 10px;">외장 컬러</div>
						<div style="display: flex;">
							<img src = "<%=ctxPath%>/images/createCar/outColor/outColorIcon/${requestScope.Map.outcoloricon_img}"/>
							<div style = "margin-left: 15px; margin-top: 30px;">${requestScope.Map.outcolordesc}</div>
							<div style="margin:auto;"></div>
							<div style="margin-right: 0; margin-top: 30px;">+${requestScope.Map.outcolorprice}</div>
						</div>
					</div>
					<div class="preview_choice_options">
						<div style="color:rgb(163, 113, 38); margin-bottom: 10px;">내장 디자인 & 컬러</div>
						<div style="display: flex;">
							<img src = "<%=ctxPath%>/images/createCar/InColor/InColorIcon/${requestScope.Map.incoloricon_img}"/>
							<div style = "margin-left: 15px; margin-top: 30px;">${requestScope.Map.incolordesc}</div>
							<div style="margin:auto;"></div>
							<div style="margin-right: 0; margin-top: 30px;">+${requestScope.Map.incolorprice}</div>
						</div>
					</div>
					<div class="preview_choice_options">
						<div style="color:rgb(163, 113, 38); margin-bottom: 10px;">선택 품목</div>
						<c:forEach var="mapList" items="${requestScope.mapList}">
							<div style="display: flex;">
								<div class="optionName" style = "margin-top: 5px;">${mapList.optiondesc}</div>
								<div style="margin:auto;"></div>
								<div>${mapList.optionprice}</div>
							</div>
						</c:forEach>
					</div>
					<input type="button" class="save" onclick='func_is_login_save()' value="견적서 저장"/>
				</div>
				<div class="sideBar">
					<div style="display: flex; margin-top: 20px;">
						<input type="button" class="buy" onclick="func_is_login()" value="구매 상담 신청">
						<input type="button" class="try" onclick="try_car_login()" value="시승 신청">
					</div>
					<ul>
						<li>상기 견적금액은 개별 소비세 5.0% 적용 견적입니다.(단, 차종 및 면세구분에 따라 세제 혜택이 적용됩니다.)</li>
						<li>상기 이미지는 실제 차량과 사양 및 컬러가 다를 수 있으므로 전시장 방문 및 실차 확인을 권장합니다.</li>
						<li>일부 이미지는 대표 등급 기준으로 연출되었으며 추후 사전예고 없이 변경이나 업데이트가 될 수 있습니다.</li>
						<li>본 견적서는 고객님의 차량 구입(청약) 의사결정에 도움을 드리고자 작성된 것으로, 법적인 효력이 없으며, 자세한 문의는 지점/대리점을 통해 확인바랍니다.</li>
						<li>실계약 진행 시 차량매매 관련 대금(계약금 포함)은 반드시 ‘고객전용 입금계좌’ 혹은 ‘현대자동차(주) 명의 계좌’로 입금하여 주시기 바라며, 이외의 계좌로 송금하는 것은 자동차 매매대금을 지급한 것으로 인정되지 않으니 유의하시기 바랍니다.</li>
						<li>제네시스 액세서리는 미리보기에 표출되지 않습니다.</li>
						<li>제네시스 액세서리는 지점/대리점에 문의 바랍니다.</li>
						<li>선택 품목을 포함한 최종 가격은 세제 혜택 등에 따라 상이 할 수 있습니다. 최종 판매가는 반드시 지점/대리점에 문의 바랍니다.</li>
						<li>지점/대리점 견적서 상의 옵션/컬러 명칭과 상이할 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div>
		<%-- CSS 로딩화면 구현한것--%>
		<div style="display: flex; position: absolute; top: 30%; left: 37%; border: solid 0px blue;">
			<div class="loader" style="margin: auto"></div>
		</div>
		<div class="modal fade" id="exit_modal"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
			<div class="modal-dialog modal-lg">
			  <div class="modal-content">
			  
				<!-- Modal header -->
				<div class="modal-header" style="background-color: black;">
				  <h4 class="modal-title" style="color:white;">EXIT</h4>
				  <button type="button" class="close idFindClose" data-dismiss="modal" style="color:white;">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" id="add_image_modal-body" style="text-align: center; margin-top: 50px;">
					<div style="margin:auto; font-size: 20pt;">내 차 만들기를 종료하시겠습니까?</div>
	
					<input type="button" class="exit" onclick="exit()" value="예"/>
					<input type="button" class="cancle" value="아니오" data-dismiss="modal"/>
				</div>
			  </div>
			  
			</div>
		</div>

		<div class="modal" id="login_modal"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
			<div class="modal-dialog modal-lg">
			  <div class="modal-content">
			  
				<!-- Modal header -->
				<div class="modal-header" style="background-color: black;">
				  <h4 class="modal-title" style="color:white;">LOGIN</h4>
				  <button type="button" class="close LoginClose" style="color:white;">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" id="Login-modal-body" style="text-align: center; margin-top: 50px;">
					<form name="Login" style="display: flex; width:50%; margin: auto;">
						<ul>
							<li><input name="ID" type="text" placeholder="ID"/></li>
							<li><input name="PWD" type="password" placeholder="PASSWORD"/></li>
						</ul>
						<input class="goLogin" type="button" onclick='login()' value="로그인">
					</form>
					<input class="enterUser" type="button" value="회원가입">
					<input class="findIdPwd" type="button" value="아이디/비밀번호 찾기">
				</div>
			  </div>
			  
			</div>
		</div>

		<div class="modal" id="send_paper"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
			<div class="modal-dialog modal-lg">
			  <div class="modal-content">
			  
				<!-- Modal header -->
				<div class="modal-header" style="background-color: black;">
				  <h4 class="modal-title" style="color:white;">구매 상담 신청</h4>
				  <button type="button" class="close send_paperClose" style="color:white;">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" id="Login-modal-body" style="text-align: center; margin-top: 50px;">
					<ul>
						<li style="text-align: center;">
							<div style="font-size: 15pt; font-weight: bold;">대리점 선택</div>
							<a class="nav-link dropdown-toggle h5" href="#" id="place-Dropdown" data-toggle="dropdown">
								All
							</a>
							<div class="dropdown-menu" aria-labelledby="place-Dropdown">
								<c:forEach var="place" items="${requestScope.list}">
									<a class="dropdown-item" onclick="selectPlace(this)" >${place}</a>
								</c:forEach>
							</div>
						</li>
						<li>
							<span class="place"></span>
						</li>
						<li style="margin-top: 40px; display:flex;">
							<div style="color:red; margin-right: 20px;">해당 대리점으로 견적서 및 성명, 전화번호를 전송합니다 이에 동의하시겠습니까?</div>
							<input class="send_input" id="send_checkbox" type="checkbox"/>
						</li>
					</ul>

					<input class="send" type="button" onclick="sendPaper()" value="전송">
				</div>
			  </div>
			  
			</div>
		</div>

	
</body>
