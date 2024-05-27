<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<link rel="stylesheet" href="<%= ctxPath%>/css/carDetail/gv60.css">
<jsp:include page="../Main_Header.jsp"></jsp:include>
<div id="container">
    <video id="video" autoplay muted loop>
        <source src="<%= ctxPath %>/video/detail_video/gv60.mp4" type="video/mp4">
    </video>
    <div id="title">
		<div id="carname" style="font-size: 50pt; font-weight: 300;">GV60<br><br></div>
		<div id="goEstimate">견적 내기  ></div>						<!-- href태그 주어 경로 이동되게 해야함 -->
		<div id="goDrivetry" style="padding-left: 2%;">시승 신청 ></div>
	</div>
   	<div id="background-image-2">
   		<div id="text-2">
			<h1 style="font-weight: 300;">우아함을 넘어 웅장함으로</h1>
		</div>
   	</div>
   	<div id="background-image-3">
   		<div id="text-3">
			<span style="font-weight: 300; font-size: 20pt;">전면 디자인&nbsp;&nbsp;</span>
			시그니처 지-매트릭스2 패턴을 정교하게 쌓은<br>
	   		크레스트 그릴에 블랙의 깊이를 더했습니다. 라디에이터 그릴과<br>
	   		전면 엠블럼 또한 모두 블랙으로 통일해 제네시스 G90 Black만의<br>
	   		존재감을 보여줍니다.
			</span>
		</div>
   	</div>
   	<div id="background-image-4">
	   	<div id="text-4">
			<span style="font-weight: 300; font-size: 20pt;">측면 디자인&nbsp;&nbsp;</span>
			전용 휠부터 DLO 몰딩까지 보이는 모든 곳부터,<br>
	   		브레이크 캘리퍼와 같이 운전자의 취향을 드러낼 수 있는 섬세한<br>
	   		부분까지도 빠짐없이 블랙을 적용했습니다. 가장 어울리는 질감과<br>
	   		빛의 농도를 고려해 설계된 서로 다른 블랙들이 조화를 이뤄<br>
	   		차별화된 감성을 느낄 수 있습니다.
	   	</div>
	 </div>
   	<div id="background-image-5" style="margin-bottom: 0%;">
   		<div id="text-5">
	   		<span style="font-weight: 300; font-size: 20pt;">후면 디자인&nbsp;&nbsp;</span>
			가장 깨끗하면서도 순수한 블랙을 구현하기 위해<br>
			차종 후면 엠블럼을 덜어내고, 한국 특유의 미적 요소인 '여백의<br>
			미'를 강조했습니다. GENESIS 로고만을 남겨 G90 Black만의<br>
			존재감을 완성합니다.
   		</div>
   	</div>











	<div id="spec" style="background-color: white;">
		<span style="font-weight: bold; color:#737373;">스펙<br><br><br></span>
		<span style="font-weight: 300; color: black; font-size: 40px;">GV80_COUPE의 스펙을 확인해보세요.<br><br></span>
		<div id="carsize">
			<img src="<%=ctxPath%>/images/carDetail/g90_LONG_WHEEL_BASE/spec-1.png"/>
			<img src="<%=ctxPath%>/images/carDetail/g90_LONG_WHEEL_BASE/spec-2.png"/>
			<img src="<%=ctxPath%>/images/carDetail/g90_LONG_WHEEL_BASE/spec-3.png"/>
		</div>
		<p id="car-size" style="color:black;">
			단위: mm<br>
			윤거는 21” 타이어 적용 기준
		</p>
		<table class="tg">
			<thead style="background-color: #f2f2f2; font-size: 23pt; font-weight: 300; border-bottom:#f2f2f2;">
			  <tr>
				<th style="font-size: 16pt; padding: 22pt 0; font-weight: 300; color:#404040">가솔린 3.5 터보 48V 일렉트릭 슈퍼차저</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td>3.5 T-GDi e-S/C<br><em>엔진 형식</em></td>
			  </tr>
			  <tr>
				<td>AWD<br><em>구동 방식</em></td>
			  </tr>
			  <tr>
				<td>3,470<br><em>배기량(cc)</em></td>
			  </tr>
			  <tr>
				<td>415/5,800<br><em>최고 출력(PS/rpm)</em></td>
			  </tr>
			  <tr>
				<td>56.0/1,300~4,500<br><em>최대 토크(kgf∙m/rpm)</em></td>
			  </tr>
			  <tr>
				<td>73 L<br><em>연료 탱크 용량</em></td>
			  </tr>
			  <tr>
				<td>245/40R21, 275/35R21<br><em>타이어(21")</em></td>
			  </tr>				
			</tbody>
		  </table>
		<p class="cp-spec-content-indicator__explanation explanation-summary" style="color: #737373; padding: 8pt 0; font-size: 9pt; padding: 3% 0;">
			*제공된 스펙 및 설명은 실제 차량에 대한 스펙 및 설명과 다를 수 있습니다. <br>
			*본 페이지에 기재된 기능, 가격, 이미지 등의 시각적 요소와 내용과 같은 세부 사항은 변경될 수 있습니다. <br>
			*AVN 화면에 표시된 내용은 연출된 이미지이며 설명 목적으로만 사용됩니다.
		</p>
	</div>


</div>


<jsp:include page="../Main_Footer.jsp"></jsp:include>
