<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/PowerTrains.css">

<jsp:include page="CreateCar_Header.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function(){
		$("button.after").click(function(){
			// 다음 버튼을 클릭하면 form태그에 있는 값을 가지고 submit해야함.
		})
	})
</script>

<div class="body">
	<div class = "optionMain">
		<img src="<%=ctxPath%>/images/createCar/powertrains/powertrainsMain/g70-23my-bto-engine-g2.5-desktop-1024x576.png"/>
		<div style = "display:flex">
			<div>
				<div class = "option">배기량(cc)</div>
				<div class = "optionVal">2,497</div>
			</div>
			<div>
				<div class="option">최고출력(ps)</div>
				<div class = "optionVal">304</div>
			</div>
			<div>
				<div class="option">최대토크(kgf.m)</div>
				<div class = "optionVal">43.0</div>
			</div>
		</div>
	</div>
	<div class="gap"></div>
	<div class="tab">
		<div class = "powertrainType">1. 엔진 타입</div>
		<div class = "choice_option" style="display: flex;">
			<div class= "choice_option_inner">
				<div class = "option_title">가솔린 2.5T</div>
				<div class = option_price>+0 원</div>
			</div>
			<div class="gap"></div>
			<img src="<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/g70-23my-bto-engine-g2.5-thumbnail-160x160.png"/>
		</div>
		<div class = "choice_option" style="display: flex;">
			<div class= "choice_option_inner">
				<div class = "option_title">가솔린 3.3T</div>
				<div class = option_price>+4,950,000 원</div>
			</div>
			<div class="gap"></div>
			<img src="<%=ctxPath%>/images/createCar/powertrains/powertrainsIcon/g70-23my-bto-engine-g3.3-thumbnail-160x160.png"/>
		</div>
		<div class="price">
			<div style="color:rgb(150, 150, 150)">예상 가격</div>
			<div class="total_price">43,470,000원</div>
			<button class="before">이전</button>
			<button class="after">다음</button>
		</div>
	</div>
</div>