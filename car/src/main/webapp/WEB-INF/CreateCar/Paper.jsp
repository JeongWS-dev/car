
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
								<c:forEach var="option_map" items="${requestScope.Option_mapList}">
									<c:forEach var="detail_map" items="${option_map}">
										<c:if test="${detail_map.fk_paperseq == map.pk_paperseq}">
											<div class="choice_option">선택 옵션</div>
											<div class="choice_option_flex">
												<div class="choice_option_title">${option_map.optiondesc}</div>
												<div class="choice_option_price">+<fmt:formatNumber value="${option_map.optionprice}" pattern="###,###" />원</div>
											</div>
										</c:if>
									</c:forEach>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>