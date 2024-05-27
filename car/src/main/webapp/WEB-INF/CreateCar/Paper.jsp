<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<jsp:include page="../Main_Header.jsp"></jsp:include>

<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/Paper.css">

<div class="body">
	<div class="Title">내 견적서</div>
	<c:if test="${empty requestScope.mapList}">
		저장된 견적이 없습니다.
	</c:if>
	<c:if test="${not empty requestScope.mapList}">
		<c:forEach var="map" items="${requestScope.mapList}" varStatus="status" >
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
                                다 가지고 왔으니까 이제 넣기만 하자 친구야
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>