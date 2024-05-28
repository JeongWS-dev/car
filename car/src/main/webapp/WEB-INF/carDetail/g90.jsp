<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<link rel="stylesheet" href="<%= ctxPath%>/css/carDetail/g90.css">
<jsp:include page="../Main_Header.jsp"></jsp:include>
<div id="container">
    <video id="video" autoplay muted loop>
        <source src="<%= ctxPath %>/video/detail_video/g90.mp4" type="video/mp4">
    </video>
    <div id="title">
		<div id="carname" style="font-size: 50pt; font-weight: 300;">G90<br><br></div>
		<div id="goEstimate">견적 내기  ></div>						<!-- href태그 주어 경로 이동되게 해야함 -->
		<div id="goDrivetry" style="padding-left: 2%;">시승 신청 ></div>
	</div>
   	<div id="background-image-2">
   		<div id="text-2">
			<h1 style="font-weight: 300; font-size: 40pt;">오늘에 머물지 않는<br>
				당신에게</h1>
		</div>
   	</div>
	<div id="exp-1" style="font-size: 25pt; height: 500pt; font-weight: 300S;">
		최고급 세단으로서의 본질에 집중하여 혁신적인 기술과 고객에 대한<br>
		배려, 우아한 디자인으로 잊을 수 없는 이동 경험을 만듭니다.<br>
		대담하면서도 우아한 리더의 성품처럼, 절제와 균형으로 완성한<br>
		제네시스 G90의 독보적인 품격과 만나보세요.<br><br>
		<span style="font-size: 8pt; color: #737373;">*본 페이지에서 소개되는 상품의 디자인, 색상, 특성, 사양 등은 참고용이며 실제 차량과 다를 수 있습니다.</span>
	</div>
   	<div id="background-image-3">
		<div id="text-3">
		 <span style="font-weight: bold; color:#737373;">외장 디자인<br><br></span>
		 <h1>여유로운 실루엣의 우아함<br></h1>
		 <span><br>최고급 세단다운 화려함에 매끄러운 라인과 세련된 비율,<br>
			   모던하고 깔끔한 마감을 더해 역동적이고도 우아한 디자인<br>
			   정체성을 완성합니다.
		 </span>
	 	</div>
   	</div>
   	<div id="background-image-4">
	   	<div id="text-4" style="font-size: 12pt; color: #cccccc;">
			<span style="font-weight: 300; font-size: 20pt; color: white;">크레스트 그릴 & 두 줄 헤드 램프&nbsp;&nbsp;</span>
			지-매트릭스1 패턴을 엇갈리게<br>
			두 층으로 쌓아 올린 ‘레이어드 아키텍쳐’2와 얇은 두께의 두 줄<br>
			헤드램프가 제네시스의 존재감을 당당하게 드러냅니다. 또한 웰컴<br>
			라이트 기능이 있어 스마트키를 가지고 차량에 접근하면 자동으로<br>
			조명이 켜져 주변을 밝힙니다.
	   	</div>
		<div id="text-4-1"style="font-size: 12pt; color: #cccccc;">
			<span style="font-weight: 300; font-size: 20pt; color: white;">클램쉘 후드&nbsp;&nbsp;</span>
			고도화된 제조 기술로 매끈하게 가다듬어 패널<br>
			사이의 이음새를 최소화합니다. 또한 부드러운 곡선 라인이<br>
			헤드램프와 자연스럽게 이어져 우아한 인상을 극대화합니다.
		</div>
	 </div>
   	<div id="background-image-5" style="font-size: 12pt; color: #cccccc;">
   		<div id="text-5">
	   		<span style="font-weight: 300; font-size: 20pt; color: white;">윈도우 라인&nbsp;&nbsp;</span>
			   포물선 형태의 윈도우 라인이 뒷좌석의 개방감을<br>
			   확보하는 동시에 두터운 C필러와 조화를 이뤄 안정감을 더하고<br>
			   프라이버시를 지켜줍니다.
   		</div>
   	</div>
   	<div id="background-image-6" style="margin-bottom: 0%;">
		<div id="text-6">
			<span style="font-weight: bold; color:#737373;">퍼포먼스<br><br></span>
			<h1 style="font-weight: 300;">편안한 승차감과 우아한 주행<br></h1>
			<span><br>뛰어난 성능의 엔진과 8단 자동변속기가 민첩하고도 매끄러운<br>
				움직임을 만듭니다. 부드러운 변속감을 제공하는 전자식 변속<br>
				다이얼은 운전자가 안전하고 편안하게 조작할 수 있는 위치에<br>
				자리합니다.
			</span>
			</div>
		</div>
	</div>
	<div id="background-image-7" style="font-size: 12pt; color: #808080;">
		<div id="text-7">
			<span style="font-weight: 300; font-size: 20pt; color: white;">AWD 시스템 & 능동형 후륜 조향 (RWS)&nbsp;&nbsp;</span>
			6 눈길이나 빗길처럼<br>
			미끄럽고 불안정한 노면에서 주행 상황을 자동으로 감지하여 전후<br>
			구동력을 능동적으로 배분하여 가변 제어합니다. 저속 선회<br>
			시에는 전륜과 반대 방향으로 조향하여 회전 반경을 줄이고,<br>
			중고속 선회 시에는 전륜과 같은 방향으로 조향해 차체<br>
			미끄러짐을 줄입니다.7
		</div>
	</div>










	<div id="spec" style="background-color: white;">
		<span style="font-weight: bold; color:#737373;">스펙<br><br><br></span>
		<span style="font-weight: 300; color: black; font-size: 40px;">G90의 스펙을 확인해보세요.<br><br></span>
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
				<th style="font-size: 16pt; padding: 22pt 0; font-weight: 300; color:#404040">가솔린 3.5 터보 엔진	</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td>3.5 T-GDi<br><em>엔진 형식</em></td>
			  </tr>
			  <tr>
				<td>AWD<br><em>구동 방식</em></td>
			  </tr>
			  <tr>
				<td>3,470<br><em>배기량(cc)</em></td>
			  </tr>
			  <tr>
				<td>380/5,800<br><em>최고 출력(PS/rpm)</em></td>
			  </tr>
			  <tr>
				<td>54.0/1,300~4,500<br><em>최대 토크(kgf∙m/rpm)</em></td>
			  </tr>
			  <tr>
				<td>73 L<br><em>연료 탱크 용량</em></td>
			  </tr>
			  <tr>
				<td>245/40R21, 275/35R21<br><em>타이어(21")</em></td>
			  </tr>				
			</tbody>
		  </table>

		  <table class="tg tg-2">
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
