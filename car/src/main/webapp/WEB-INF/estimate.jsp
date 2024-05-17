<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GENESIS</title>

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
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
		<!-- Brand -->
		<img src="<%= ctxPath%>/images/MainPage/logo.png" style = "width:6%;"> 
	
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"> 
				<a class="nav-link" href="#">모델</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%= ctxPath%>/estimate/estimate.car">구매</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">체험</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">고객센터</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%= ctxPath%>/myPage.car"  class="btn">마이페이지</a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
			</li>
		</ul>
	</nav>
	
	<div id="container">
		<div id="top_context">
			<h1>
				<span>견적 내기</span>
			</h1>
			<div class="empty"></div>
		</div>
		<div class="main_top">
			<div class="category_main"> 
				<div class="car_select">
					<div id="new_image">
						<img src="<%= ctxPath%>/images/Estimate/new_80x40.png" height="22px" width="46px"/> 
					</div>
					<div id="g90black" style="font-size : 70px; line-height : 0.9; font-weight: lighter; font-stretch: condensed;">
						G90<br>BLACK
					</div>
					<br>
					<br>
					<div id="select_car">
						<button type="button" class="btn btn-carselect">차량선택</button>
					</div>
				</div>
				<div class="main_car_image">
					<img src="<%= ctxPath%>/images/Estimate/g90_black_main.png" />
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
							<div id="g90new_title" class="vehicle_title">
								<div class= "vehicle_name">G90 BLACK</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/new_50x24.png" />
								</span>	
							</div>
							<div class="brand_title"></div>
							<div id="g90new_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G90_new.png" class="car_image" />
							</div>
						</div>
					</div>
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
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="gv80_title">
								<div class= "vehicle_name">GV80</div>
							</div>
							<div class="brand_title"></div>
							<div id="gv80_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV80.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="gv80coupe_title">
								<div class= "vehicle_name">GV80 COUPE</div>
							</div>
							<div class="brand_title"></div>
							<div id="gv80coupe_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV80_coupe.png"  class="car_image"/>
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="gv70new_title" class="vehicle_title">
								<div class= "vehicle_name">GV70</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/new_50x24.png" />
								</span>
							</div>
							<div class="brand_title"></div>
							<div id="gv70new_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV70.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div class="brand_title">ELECTRIFIED</div>
							<div id="gv70electric_title" class="vehicle_title">
								<div class= "vehicle_name">GV70</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/ev_20x24.png" />
								</span>
							</div>
							<div id="gv70electric_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV70_electric.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="slide_pieces">
							<div id="gv60_title" class="vehicle_title">
								<div class= "vehicle_name">GV60</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/ev_20x24.png"  />
								</span>
							</div>
							<div class="brand_title"></div>
							<div id="gv60_barimg" class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV60.png" class="car_image" />
							</div>
						</div>
				  	</div>
				</div>
				
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>		
		</div>

	
	
	</div>
	
<jsp:include page="Main_Footer.jsp"></jsp:include>