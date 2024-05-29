
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
	})// end of $(document).ready(function(){
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
									<div class="carname">${map.fk_carname}</div>
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
									<div class="carName">${map.fk_carname}</div>
									<img class="detail_car_img" src="<%=ctxPath%>/images/createCar/outColor/outColorCar/${map.outcolorcar_img}"/>
								</div>
								<div class="detail_paper_flex">
									<img class="detail_paper_img" src="<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/${map.powericon_img}"/>
									<div class="detail_paper_title">${map.powerdesc}</div>
									<div class="detail_paper_price">+<fmt:formatNumber value="${map.powerprice}" pattern="###,###" />원</div>
								</div>
								<div class="detail_paper_flex">
									<img class="detail_paper_img" src="<%=ctxPath%>/images/createCar/outColor/outColorIcon/${map.outcoloricon_img}"/>
									<div class="detail_paper_title">${map.outcolordesc}</div>
									<div class="detail_paper_price">+<fmt:formatNumber value="${map.outcolorprice}" pattern="###,###" />원</div>
								</div>
								<div class="detail_paper_flex">
									<img class="detail_paper_img" src="<%=ctxPath%>/images/createCar/InColor/InColorIcon/${map.incoloricon_img}"/>
									<div class="detail_paper_title">${map.incolordesc}</div>
									<div class="detail_paper_price">+<fmt:formatNumber value="${map.incolorPrice}" pattern="###,###" />원</div>
								</div>
								<div class="choice_option_div">

								</div>
								<div class="total_price">
									<div class="total_price_title">총 가격</div>
									<div class="Final_price"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>