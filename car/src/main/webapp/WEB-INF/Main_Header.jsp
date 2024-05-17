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
		<header id="header" class="p-3 bg-black text-white" style="position: relative;" >
			<div class="container"  style="margin-left: 2%;">
				<div id="1"  class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
					
					<ul class="nav col-6 col-lg-auto me-lg-auto mb-4 mb-md-0">
						<li class="nav-item" id="nav-item1"> 
							<a href="#" class="nav-link px-2 text-white">모델</a>
							<ul id="sub-menu1" class="nav-item sub-menu" >
								
								<div style="display: flex; margin-left: 3.5%;">	
									<div id="sidebar-wrapper" style="display: flex; font-size: large; font-weight: 475;">
										<ul class="sidebar-nav">
										<li class="sidebar-brand" style="margin-top: 50%; margin-bottom: 100%; ">
											<span>모델</span>
										</li>
										<li><a href="#">ALL</a></li>
										<li><a href="#">BLACK</a></li>
										<li><a href="#">SEDAN</a></li>
										<li><a href="#">SUV</a></li>
										</ul>
									

									<div class="vertical-line"></div>

									
									</div>

									<div>

										<div style="display: flex; width: 200%;">
											<div class="card" style="height: 100%; margin-left: 0%; margin-top: 1.5%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="<%= ctxPath%>/createCar/powertrains.car?pk_carname=G90_BLACK">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; margin-top: 0.7%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="margin-bottom: 9%; font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90</h5>
												<h5 class="card-title" style="margin-bottom: 7%; margin-top: -10%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LONG WHEEL BASE</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-lwb-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 7%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="<%= ctxPath%>/createCar/powertrains.car?pk_carname=G90_LONG_WHEEL_BASE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; margin-top: 1.5%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="<%= ctxPath%>/createCar/powertrains.car?pk_carname=G90">견적 내기  ></a>
											</div>
										</div>



										<div style="display: flex; width: 200%;">
											<div class="card" style="height: 100%; margin-left: 0%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G80</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g80-24fl-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; margin-top: 0.27%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="margin-bottom: 9%;  font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ELECTRICFIED</h5>
												<h5 class="card-title" style="margin-bottom: 7%; margin-top: -10%; font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G80</h5>
												<img src="images/MainPage/our-models/electrified_g80_24my_gnb_thumbnail.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 7%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%;  width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G70</h5>
												<img src="images/MainPage/our-models/g70_23my_gnb_thumbnail.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>


										<div style="display: flex; width: 200%;">
											<div class="card" style="height: 100%; margin-left: 0%; margin-top: 0.2%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="margin-bottom: 9%; font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G70</h5>
												<h5 class="card-title" style="margin-bottom: 7%; margin-top: -10%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SHOOTING BRAKE</h5>
												<img src="images/MainPage/our-models/g70-sb-23my.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 7%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;GV80</h5>
												<img src="images/MainPage/our-models/gv80_24fl_gnb_thumbnail.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;GV80 COUPE</h5>
												<img src="images/MainPage/our-models/gv80-coupe-gnb-thumbnail.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>


										<div style="display: flex; width: 200%; padding-bottom: 0%;">
											<div class="card" style="height: 100%; margin-left: 0%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;GV70</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-gv70-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; margin-top: 0.27%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="margin-bottom: 9%;  font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ELECTRICFIED</h5>
												<h5 class="card-title" style="margin-bottom: 7%; margin-top: -10%; font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G70</h5>
												<img src="images/MainPage/our-models/egv70_GNB_Thumbnail.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 7%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;GV60</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-gv60-desktop-630x240-ko.png" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>
									</div>
									
								</div>  
								

							</ul>
							
						</li>
						<li class="nav-item" id="nav-item2">
							<a href="#" class="nav-link px-2 text-white">구매</a>
							<ul id="sub-menu2" class="nav-item sub-menu" >
								
								<div style="display: flex; margin-left: 5%;">	
									<div id="sidebar-wrapper" style="display: flex;  font-weight: 475;">
										<div style="display: inline; margin-top: 5%;">
											<div style="font-size: x-large; width: 100%; margin-bottom: 11%;">구매</div>
											<div style="font-size: small; width: 160%; color:#b3b3b3;">당신만의 제네시스를 찾아가는 여정을 지원합니다.</div> 
										</div>

										<div style="margin-top: 7.5%; height: 103%; opacity: 0.3;" class="vertical-line"></div>

									
									</div>

									<div style="width:30%; display: flex; margin-top: 0.7%; margin-left: 0.5%;">
										<div>
											<a id="purchase" href="#">견적내기</a> 
										</div>
										<div style="margin-left: 9%;">
											<a id="purchase" href="#">구매 상담 신청</a>
										</div>
									</div>
									
								</div>  
								
								<div style="margin-top: 0.25%; border-bottom: solid 1px #404040; opacity: 0.3;"></div>

								<div style="margin-top: 0.28%; margin-left: 11.825%; font-size: 14px; font-weight: normal;">
									<a id="purchase" href="#">시승신청 ></a>
									<a style="margin-left: 0.75%;" id="purchase" href="#">전시장 찾기 ></a>
								</div>
								
							</ul>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						
						
						<li class="nav-item" id="nav-item3">
							<a href="#" class="nav-link px-2 text-white">체험</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item4" style="margin-left: 60%;">
							<a style="margin-left: 10%; width: 100%;" href="#" class="nav-link px-2 text-white">고객센터</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item5" >
							<a style="margin-left: 10%; width: 100%;" class="nav-link px-2 text-white" href="<%= ctxPath%>/myPage/myPage.car">마이페이지</a>
						</li>
						<li class="nav-item" id="nav-item6" >
							<a style="margin-left: 70%;" class="navbar-brand" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</header>
	</nav>