<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	//		/MyMVC
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%-- bootstrap --%>
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<%-- 내가만든 css --%>
<link rel="stylesheet" href="<%= ctxPath%>/css/estimate.css">
<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<%-- CSS --%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<%--js --%>
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<%-- 직접만든 js --%>
<script type="text/javascript" src="<%= ctxPath%>/js/estimate.js"></script>


</head>
<body>
	<div id="container">
		<div id="top" class="type-space-pt2 type-space-pb2">
			<h1>
				<span>견적 내기</span>
			</h1>
			<div class="empty"></div>
		</div>
		<div class="main_top">
			<div class="category_main"> 
				<div class="car_select">
					<div id="new_image" style="height: 22px; width:46px;">
					</div>
					<div id="car_name" style="font-size : 70px; line-height : 0.9; font-weight: lighter;">G90</div>
					<div style="font-size : 20px; line-height : 0.9; font-weight: lighter;">LONG WHEEL BASE</div>
				
					<br>
					<br>
					<div id="select_car">
						<button type="button" class="btn btn-carselect">차량선택</button>
					</div>
				</div>
				<div class="main_car_image">
					<img src="<%= ctxPath%>/images/Estimate/G90_main_img.png" />
				</div>
			</div>
		</div>
		<div class="empty"></div>
		<div class="bar_title" style="bottom : 240px;">
			<div class="cm-vehicle-tab-btn">
				<ul>
					<li>
						<div class="btn-wrap">
							<span class="line">
								<a href = "#" class="tab-btn" role="tab" id="ALL">ALL</a>
							</span>
						</div>

						<div class="btn-wrap">
							<span class="line">
								<a href = "#" role="tab-btn" id="BLACK">BLACK</a>
							</span>
						</div>
						<div class="btn-wrap">
							<span class="line">
								<a href = "#" class="tab-btn" role="tab" id="SEDAN">SEDAN</a>
							</span>
							
						</div>
						<div class="btn-wrap">
							<span class="line">
								<a href = "#" class="tab-btn" role="tab" id="SUV">SUV</a>
							</span>
							
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="slider_outline">
			<div id="bar_img" class="swiper-container">
				<div id="img_slider" class="swiper-wrapper">
				
				  	<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="g90long_title">
								<div class= "vehicle_name">G90</div>
							</div>
							<div class="brand_title">LONG WHEEL BASE</div>
							<div id="g90long_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G90_long.png"  class="car_image" />
							</div>
						</div>
				  	</div>
				  	<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="g90_title">
								<div class= "vehicle_name">G90</div>
							</div>
							<div class="brand_title"></div>
							<div id="g90_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G90.png" class="car_image"  />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="g80_title">
								<div class= "vehicle_name">G80</div>
							</div>
							<div class="brand_title"></div>
							<div id="g80_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G80.png" class="car_image"/>
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div class="brand_title">ELECTRIFIED</div>
							<div id="g80elect_title" class="vehicle_title">
								<div class= "vehicle_name">G80</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/ev_20x24.png" />
								</span>
							</div>	
							<div id="g80elect_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G80_electric.png" class="car_image" />
							</div>
						</div>
				  	</div>
					 <div class="swiper-slide">
						<div class="slide_pieces">
							<div id="g70_title">
								<div class= "vehicle_name">G70</div>
							</div>
							<div class="brand_title"></div>
							<div id="g70_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G70.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="g70smooting_title">
								<div class= "vehicle_name">G70</div>
							</div>
							<div class="brand_title">SMOOTHING BREAK</div>
							<div id="g70smoothing_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G70_smoothing.png" class="car_image" />
							</div>
						</div>
				  	</div>
				
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
			
		</div>
		
	
	
	</div>
	

</body>
</html>