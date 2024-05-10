<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GENESIS</title>

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/mainPage.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

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
				<a class="nav-link" href="#">구매</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">체험</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">고객센터</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%= ctxPath%>/myPage/myPage.car"  class="btn">마이페이지</a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
			</li>
		</ul>
	</nav>

	<div class = "main-page">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
			  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="9"></li>
			</ol>
			<div class="carousel-inner">
			  <div class="carousel-item active">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-kr-main-key-visual-genesis-x-gran-berlinetta-vgt-concept-desktop-2560x900.jpg" class="d-block w-100" alt="..."> <!-- d-block 은 display: block; 이고  w-100 은 width 의 크기는 <div class="carousel-item active">의 width 100% 로 잡으라는 것이다. -->
				<div class="carousel-caption d-none d-md-block"> <!-- d-none 은 display : none; 이므로 화면에 보이지 않다가, d-md-block 이므로 d-md-block 은 width 가 768px이상인 것에서만 display: block; 으로 보여라는 말이다.  --> 
				  <h5>GENESIS</h5>
				  <p>GENESIS X GRAN BERLINETTA CONCEPT</p>
				</div>
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-kr-main-key-visual-gv80-24fl-desktop-2560x900.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>GV80</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-kr-main-key-visual-gv80-coupe-24lc-desktop-2560x900.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>GV80 COUPE</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-key-visual-g90-24my-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>G90</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-key-visual-g90-black-24my-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>G90 BLACK</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-key-visual-g90-long-wheel-base-24my-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>G90 LONG WHEEL BASE</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-key-visual-gv70-25fl-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GV70</h5>
				  <p>모든 순간,스타일이 되다.</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-key-visual-magma-program-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>MAGMA</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-key-visual-neolun-concept-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>NEOLUN CONCEPT</p>
				</div>		      
			  </div>
			  <div class="carousel-item">
				<img src="<%= ctxPath%>/images/MainPage/genesis-main/genesis-main-keyvisual-g80-24fl-main-hero-desktop-2560x900-kr.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				  <h5>GENESIS</h5>
				  <p>G80</p>
				</div>		      
			  </div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			  <span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			  <span class="carousel-control-next-icon" aria-hidden="true"></span>
			  <span class="sr-only">Next</span>
			</a>
		</div>

		<div class = "our-models">
			<div class = "our-models-inner">
				<p style="font-size: 40px; font-weight: lighter;">OUR MODELS</p>
				<p style="color: rgb(206, 206, 206);">역동적이면서도 우아한 디자인과 최첨단 기술을 탑재한 제네시스 브랜드의 라인업을 살펴보세요.</p>
				<a class="nav-link dropdown-toggle h5" href="#" id="our-model-Dropdown" data-toggle="dropdown" style="color:white">
					All
				</a>
				<div class="dropdown-menu our-model-Dropdown" aria-labelledby="our-model-Dropdown" style="background-color: black;">
					<a class="dropdown-item" href="#" value = "BLACK">ALL</a>
					<a class="dropdown-item" href="#" value = "BLACK">BLACK</a>
					<a class="dropdown-item" href="#" value = "SEDAN">SEDAN</a>
					<a class="dropdown-item" href="#" value = "SUV">SUV</a>
				</div>
				<div class="row mx-auto my-auto">
					<div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
						<div class="carousel-inner w-100" role="listbox">
							<div class="carousel-item active">
								<div class="col-md-4">
									<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
										<h5 class="card-title">G90 Black</h5>
										<p class="card-text"></p>
										<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png">
										<div class="card-body">
											<button class="our-models-button">자세히보기</button>
									  	</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
										<h5 class="card-title">G90</h5>
										<p class="card-text">LONG WHEEL BASE</p>
										<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-lwb-desktop-630x240-ko.png">
										<div class="card-body">
											<button class="our-models-button">자세히보기</button>
									  	</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
										<h5 class="card-title">G90</h5>
										<p class="card-text"></p>
										<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png">
										<div class="card-body">
											<button class="our-models-button">자세히보기</button>
									  	</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-md-4">
									<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
										<h5 class="card-title">G90</h5>
										<p class="card-text">LONG WHEEL BASE</p>
										<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-lwb-desktop-630x240-ko.png">
										<div class="card-body">
											<button class="our-models-button">자세히보기</button>
									  	</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
										<h5 class="card-title">G90</h5>
										<p class="card-text"></p>
										<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png">
										<div class="card-body">
											<button class="our-models-button">자세히보기</button>
									  	</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-md-4">
									<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
										<h5 class="card-title">G90</h5>
										<p class="card-text"></p>
										<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png">
										<div class="card-body">
											<button class="our-models-button">자세히보기</button>
									  	</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row main-middle-icon">
			<div class="col-md-2"></div>
				<div class="col-md-2 main-icon" type = "button">
					<img class="img-fluid card-img-top icon-image" src="<%= ctxPath%>/images/MainPage/main-middle-icon/Build-And-Price_black_60x60_hover.gif">
					<div class="icon-text">견적내기</div>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2 main-icon" type = "button">
					<img class="img-fluid card-img-top icon-image" src="<%= ctxPath%>/images/MainPage/main-middle-icon/Price_black_60x60_hover.gif">
					<div class="icon-text">구매상담신청</div>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2 main-icon" type = "button">
					<img class="img-fluid card-img-top icon-image" src="<%= ctxPath%>/images/MainPage/main-middle-icon/Book-a-Test-Drive_black_60x60.gif">
					<div class="icon-text">시승신청</div>
				</div>
			</div>
		</div>
		<!-- 5/9 -->
		<div class = "the-awards">
			<div class="mx-auto my-auto">
				<div id="recipeCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<div class="inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-main-the-awards-2024-best-of-awards-mauna-red-electrified-gv70-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  									
									<div class="card-body">
										<h5 class="card-title">G90 Black</h5>
										<p class="card-text"></p>
										<button class="our-models-button">자세히보기</button>
									</div>
								</div>
							</div>
							<div class="inner-award">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-crane-white-genesis-x-convertible-exterior-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text">LONG WHEEL BASE</p>
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									  </div>
								</div>
							</div>
							<div class="inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-in-front-of-the-building-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text"></p>
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="col-md-4" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-crane-white-genesis-x-convertible-exterior-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text">LONG WHEEL BASE</p>
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									  </div>
								</div>
							</div>
							<div class="col-md-4">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-in-front-of-the-building-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text"></p>
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									</div>
								</div>
							</div>
							<div class="col-md-4" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-in-front-of-the-building-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text"></p>
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									  </div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="col-md-4">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text"></p>
									<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png">
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									  </div>
								</div>
							</div><div class="col-md-4">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text"></p>
									<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png">
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									  </div>
								</div>
							</div><div class="col-md-4">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">G90</h5>
									<p class="card-text"></p>
									<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png">
									<div class="card-body">
										<button class="our-models-button">자세히보기</button>
									  </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-expand-sm navbar-dark bottom">
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"> 
				<a class="nav-link" href="#">사이트맵</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">이용약관</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">개인정보 처리방침</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">저작권안내</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">보증안내</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">자동차 교환 및 환불 중재 규정 안내 </a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="https://www.facebook.com/GenesisWorldwide"><i class="fa-brands fa-instagram"></i></a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-brands fa-youtube"></i></a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="#"><i class="fa-brands fa-facebook-f"></i></a>
			</li>
		</ul>
	</nav>
	<div class="text-center" id="footer">
		<div class="col-md-12">
			<img class ="mb-3 mt-5"src="<%= ctxPath%>/images/MainPage/logo.png" style = "width:6%;"> 
			<p style="color: white; font-size: 12px;">
				© Copyright 2024 Hyundai Motor Company.
		   </p>
		   <p style="color: white; font-size: 12px;">
			All Rights Reserved.
		   </p>
		</div>
	</div>
</body>
</html>