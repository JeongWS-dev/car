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
		<header id="header" class="p-3 bg-black text-white" style="position: relative;">
			<div class="container"  style="margin-left: 2%;">
				<div id="1"  class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
					
					<ul class="nav col-6 col-lg-auto me-lg-auto mb-4 justify-content-center mb-md-0">
						<li class="nav-item" id="nav-item1"> 
							<a href="#" class="nav-link px-2 text-white">모델</a>
							<ul class="nav-item sub-menu" >
								
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
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; margin-top: 1.5%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; margin-top: 1.5%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>



										<div style="display: flex; width: 200%;">
											<div class="card" style="height: 100%; margin-left: 0%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 6%;  width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>


										<div style="display: flex; width: 200%;">
											<div class="card" style="height: 100%; margin-left: 0%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 7%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 7%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>


										<div style="display: flex; width: 200%; padding-bottom: 15%;">
											<div class="card" style="height: 100%; margin-left: 0%; width: 21rem; background-color:#141414; border: solid 0px white;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 7%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>

											<div class="card" style="height: 100%; margin-left: 7%; width: 21rem; background-color:#141414; border: none;">
												<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;G90 BLACK</h5>
												<img src="images/MainPage/our-models/genesis-kr-admin-model-list-thumbnail-g90-black-desktop-630x240-ko.png" class="card-img-top" alt="G90 BLACK" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
												<div class="card-body" style="text-align: center; padding-bottom: 6%;">
													<a href="#" class="custom-button">자세히 보기</a>
												</div>
												<a style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="https://www.genesis.com/kr/ko/models/luxury-sedan-genesis/g90-black/bto/powertrains?code=BBBBBBB&packages=5SE">견적 내기  ></a>
											</div>
										</div>
									</div>
									
								</div>  
								

							</ul>
							
						</li>
						<li class="nav-item" id="nav-item2">
							<a href="#" class="nav-link px-2 text-white">구매</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item3">
							<a href="#" class="nav-link px-2 text-white">체험</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item4" style="margin-left: 60%;">
							<a href="#" class="nav-link px-2 text-white">고객센터</a>
							<ul class="nav-item sub-menu">
							</ul>
						</li>
						<li class="nav-item" id="nav-item5" >
							<a class="nav-link" href="<%= ctxPath%>/myPage/myPage.car"  class="btn">마이페이지</a>
						</li>
						<li class="nav-item" id="nav-item6" >
							<a class="navbar-brand" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</header>
	</nav>