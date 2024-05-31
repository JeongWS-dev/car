
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<jsp:include page="../Main_Header.jsp"></jsp:include>

<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/Paper.css">
<script type ="text/javascript">
	$(document).ready(function(){
		$("div.loader").hide();
		$("input[name='sessionCarName']").each(function(index,item){
			let model_name = $(item).val().split("_").join(" ");
			$(item).parent().find("div.carname").text(model_name);
		})

		$("input[name='CarName']").each(function(index,item){
			let model_name = $(item).val().split("_").join(" ");
			$(item).parent().find("div.carName").text(model_name);
		})

		$("button.btn").click(function(e){
			const paperseq = $(e.target).parent().find("input[name='paperseq']").val();
			let detaultPrice = $(e.target).parent().find("input[name='detaultPrice']").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/createCar/paperJSON.car",
				type : "post",
				data : {"paperseq":paperseq},
				dataType:"json",
				success:function(json){
					if(json.length == 0) {
						// 데이터가 존재하지 않는 경우
						detaultPrice = Number(detaultPrice)
						$(e.target).parent().parent().parent().parent().find("div.Final_price").text("+" + detaultPrice.toLocaleString('en')+"원");
					}
					else if(json.length > 0){
						// 데이터가 존재하는 경우
						v_html = `<div class="choice_option">선택 옵션</div>`;
						
						$.each(json, function(index, item){
							v_html += `<div class="choice_option_flex">`
							v_html += `<div class="choice_option_title">\${item.optiondesc}</div>`;
							v_html += `<div class="choice_option_price">+\${item.optionprice}</div>`;
							v_html += `</div>`
						});// end of $.each(json, function(index, item){
						
						$(e.target).parent().parent().parent().parent().find("div.choice_option_div").html(v_html);

						$(e.target).parent().parent().parent().parent().parent().find("div.choice_option_price").each(function(index,elmt){
							let price = Number($(elmt).text().substring(1,$(elmt).text().indexOf("원")).split(",").join(""));
							detaultPrice = Number(detaultPrice) + price;
						})
						$(e.target).parent().parent().parent().parent().find("div.Final_price").text("+" + detaultPrice.toLocaleString('en')+"원");
					}// end of else if(start == "1" && json.length > 0)
				},
				error: function(request, status, error){
				alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
				}
			})
			
		})

		$("button.send_paperClose").click(function(){
			$("div#send_paper").fadeOut();
		})
	})// end of $(document).ready(function(){
		
	function selectPlace(place) {
		let drivePlace = $(place).text();
		$("span.place").text(drivePlace);
	}

	function func_is_login(carnameIdx){
		$("input.carnameIdx").val(carnameIdx);

		if ( ${not empty sessionScope.loginuser} ){
			$("div#send_paper").fadeIn();
		}
		else {
			sessionStorage.removeItem("userid");
			$("div#send_paper").fadeIn();
		}

	}

	function sendPaper(){
		const is_checked = $("input.send_input").is(":checked");
		const place = $("span.place").text();

		const carnameIdx = $("input.carnameIdx").val();
		let carname = $("div#"+carnameIdx).find("input[name='CarName']").val();
		let powername = $("div#"+carnameIdx).find("div.powername").text();
		let outcolorname = $("div#"+carnameIdx).find("div.outcolorname").text();
		let incolorname = $("div#"+carnameIdx).find("div.incolorname").text();
		let incolormoney = $("div#"+carnameIdx).find("div.incolormoney").text().split(",").join("");
		incolormoney = incolormoney.substring(1,incolormoney.indexOf("원"));
		// alert(carname + "+" + powername + "+" + outcolorname + "+" + incolorname);
		// alert(incolormoney);
		let optionNameJoin = "";
		$("div#"+carnameIdx).find("div.choice_option_title").each(function(index,item){
			optionNameJoin += $(item).text() + ",";
		})
		
		if(is_checked && place!=""){
			
			$("div#send_paper").fadeOut();
			$("div.loader").show();
			$.ajax({
				url : "${pageContext.request.contextPath}/createCar/sendPaperJSON.car",
				type : "post",
				data : {"place":place,"optionNameJoin":optionNameJoin,"carname":carname,"powername":powername,"outcolorname":outcolorname,"incolorname":incolorname,"incolormoney":incolormoney},
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
<div class="body">
	<div class="Title">내 견적서</div>
	<c:if test="${not empty requestScope.paper_mapList}">
		<c:forEach var="map" items="${requestScope.paper_mapList}" varStatus="status" >
			<div class= "myPaper accordion" id="accordionExample">
				<div class="accordion" id="accordionExample">
					<div class="card" style = "background-color: rgba(0,0,0,0);">
						<div class="card-header" id="headingOne">
						  	<button class="btn" type="button" data-toggle="collapse" data-target="#${map.fk_carname}${status.index}" aria-expanded="true" aria-controls="collapseOne">
								<div style="display:flex;">
									<div class="carname"></div>
									<input name="sessionCarName" type="hidden" value="${map.fk_carname}"/>
									<div class="powerTitle">${map.powerdesc}</div>
									<div class="outcolorTitle">${map.outcolordesc}</div>
									<div class="incolorTitle">${map.incolordesc}</div>
									<input name = "paperseq" type="hidden" value="${map.pk_paperseq}"/>
									<input name = "detaultPrice" type="hidden" value="${map.detaultPrice}"/>
								</div>
							</button>
						</div>
						<div id="${map.fk_carname}${status.index}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
							<!-- .collapse show 는 맨 처음에는  내용물을 보여주도록 하는 것임. -->
							<div class="card-body detail_choice_option">
                                <div class="detail_paper">견적 상세</div>
								<div class="detail_choice_car">
									<div class="carName"></div>
									<input name="CarName" type="hidden" value="${map.fk_carname}"/>
									<img class="detail_car_img" src="<%=ctxPath%>/images/createCar/outColor/outColorCar/${map.outcolorcar_img}"/>
								</div>
								<div class="detail_paper_flex">
									<img class="detail_paper_img" src="<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/${map.powericon_img}"/>
									<div class="detail_paper_title powername">${map.powerdesc}</div>
									<div class="detail_paper_price">+<fmt:formatNumber value="${map.powerprice}" pattern="###,###" />원</div>
								</div>
								<div class="detail_paper_flex">
									<img class="detail_paper_img" src="<%=ctxPath%>/images/createCar/outColor/outColorIcon/${map.outcoloricon_img}"/>
									<div class="detail_paper_title outcolorname">${map.outcolordesc}</div>
									<div class="detail_paper_price">+<fmt:formatNumber value="${map.outcolorprice}" pattern="###,###" />원</div>
								</div>
								<div class="detail_paper_flex">
									<img class="detail_paper_img" src="<%=ctxPath%>/images/createCar/InColor/InColorIcon/${map.incoloricon_img}"/>
									<div class="detail_paper_title incolorname">${map.incolordesc}</div>
									<div class="detail_paper_price incolormoney">+<fmt:formatNumber value="${map.incolorPrice}" pattern="###,###" />원</div>
								</div>
								<div class="choice_option_div">

								</div>
								<div class="total_price">
									<div class="total_price_title">총 가격</div>
									<div class="Final_price"></div>
								</div>
								<input type="button" class="buy" onclick="func_is_login('${map.fk_carname}${status.index}')" value="구매 상담 신청">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
<input class="carnameIdx" type="hidden" value=""/>

<div style="display: flex; position: absolute; top: 30%; left: 37%; border: solid 0px blue;">
	<div class="loader" style="margin: auto"></div>
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

<jsp:include page="../Main_Footer.jsp"></jsp:include>