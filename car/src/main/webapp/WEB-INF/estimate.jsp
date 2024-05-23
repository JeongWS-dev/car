<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<%-- 내가만든 css --%>
<link rel="stylesheet" href="<%= ctxPath%>/css/estimate.css">

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<%-- CSS --%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<%--js --%>
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<%-- 직접만든 js --%>
<script type="text/javascript" src="<%= ctxPath%>/js/estimate.js"></script>

<jsp:include page="Main_Header.jsp"></jsp:include>
	
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
					<div id="new_image" >
						<img src="<%= ctxPath%>/images/Estimate/new_80x40.png" /> 
					</div>
					<div id="carTitle" style="font-size : 70px; line-height : 0.9; font-weight: lighter; font-stretch: condensed;">
						G90<br>BLACK
					</div>
					<br>
					<br>
					<div id="select_car">
						<button type="button" class="btn btn-carselect">차량선택</button>
					</div>
				</div>
				<div class="main_car_image">
					<img src="<%= ctxPath%>/images/Estimate/G90_BLACK.png"  />
				</div>
			</div>
		</div>
		<div class="empty"></div>
		<div class="bar_title" style="bottom : 240px;">
			<div class="cm-vehicle-tab-btn">
				<ul>
					<li>
						<div class="btn-wrap">
							<div class="tab-btn" id="ALL">ALL</div>
						</div>

						<div class="btn-wrap">
							<div class="tab-btn" role="tab" id="SEDAN">SEDAN</div>							
						</div>

						<div class="btn-wrap">
							<div class="tab-btn" role="tab" id="SUV">SUV</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="slider_outline">
			<div id="bar_img" class="swiper-container">
				<div id="img_slider" class="swiper-wrapper">
					<%--
				  	<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">G90 BLACK</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/new_50x24.png" />
								</span>	
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G90_BLACK.png" class="car_image" />
							</div>
						</div>
					</div>
				  	<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">G90</div>
							</div>
							<div class="brand_title">LONG WHEEL BASE</div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G90_LONG_WHEEL_BASE.png"  class="car_image" />
							</div>
						</div>
				  	</div>
				  	<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">G90</div>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G90.png" class="car_image"  />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">G80</div>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G80.png" class="car_image"/>
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="brand_title">ELECTRIFIED</div>
							<div class="vehicle_title">
								<div class= "vehicle_name">G80</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/ev_20x24.png" />
								</span>
							</div>	
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G80_ELECTRIFIED.png" class="car_image" />
							</div>
						</div>
				  	</div>
					 <div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">G70</div>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G70.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">G70</div>
							</div>
							<div class="brand_title">SMOOTHING BREAK</div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/G70_SHOOTING_BRAKE.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">GV80</div>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV80.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">GV80 COUPE</div>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV80_COUPE.png"  class="car_image"/>
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">GV70</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/new_50x24.png" />
								</span>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV70.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="brand_title">ELECTRIFIED</div>
							<div class="vehicle_title">
								<div class= "vehicle_name">GV70</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/ev_20x24.png" />
								</span>
							</div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV70_ELECTRIFIED.png" class="car_image" />
							</div>
						</div>
				  	</div>
					<div class="swiper-slide">
						<div class="card">
							<div class="vehicle_title">
								<div class= "vehicle_name">GV60</div>
								<span class=icon>
									<img src="<%= ctxPath%>/images/Estimate/ev_20x24.png"  />
								</span>
							</div>
							<div class="brand_title"></div>
							<div class="bar_image">
								<img src="<%= ctxPath%>/images/Estimate/GV60.png" class="car_image" />
							</div>
						</div>
				  	</div> --%>
				</div>
				
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>		
		</div>

	
	
	</div>

	<div class="share_bar" style="height: 40px; padding-top : 0.2%;">
		<div class="col-md-1" style="font-size: 13pt; color: white; text-align: center; font-stretch: condensed;">
			share
		</div>
		
		<div class = "col-md-10"  >
			<ul class="util_list">
				<li id="facebook">
					<a class="bar_share" id="bar_share_tw" href="#"><i class="fa-brands fa-facebook-f"></i></a>
				</li>
				<li id="twitter">
					<a class="bar_share" id="bar_share_tw" href="#"><i class="fa-brands fa-x-twitter"></i></a>
				</li>
				<li id="copy">
					<a class="bar_share" id="bar_share_copy" href="#"><i class="fa-solid fa-copy"></i></a>
				</li>
			</ul>
		</div>

		<div class = "col-md-1">
			<a class="top_button"  href="#" style="color:white; font-size: 13pt; font-stretch: condensed;" >Top <i class="fa-solid fa-angle-up"></i></a>

		</div>
	</div>


<jsp:include page="Main_Footer.jsp"></jsp:include>