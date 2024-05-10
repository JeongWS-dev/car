<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<jsp:include page="Main_Header.jsp"></jsp:include>

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
					<a class="nav-link" href="<%= ctxPath%>/drivetryApply/drivetryApply.car"  class="btn">
						<img class="img-fluid card-img-top icon-image" src="<%= ctxPath%>/images/MainPage/main-middle-icon/Book-a-Test-Drive_black_60x60.gif">
						<div class="icon-text">시승신청</div>
					</a>
				</div>
			</div>
		</div>
		<!-- 5/9 -->
		<div class = "the-awards" style="background-image: url('<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-crane-white-genesis-x-convertible-exterior-660x396.jpg');">
			<span style="color:rgb(255, 255, 255); font-size: 50px; font-weight: lighter; margin-left: 15%;">THE AWARDS</span>
			<div class="row mx-auto my-auto">
				<div id="recipeCarousel" class="carousel slide mt-5" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-main-the-awards-2024-best-of-awards-mauna-red-electrified-gv70-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  									
									<h5 class="card-title">카즈닷컴 어워드 2024</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 ELECTRIFIED GV70, 美 카즈닷컴</p>
									<p class="card-text card-p1" style="font-size: 20pt;">'2024 최고의 고급차' 수상</p>
									<p class="card-p2">GV70 전동화 모델은 우아한 외관과 잘 정돈된 실내, 인상적인 주행성능을 갖춘 전기차로 인정받았습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-crane-white-genesis-x-convertible-exterior-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">카 디자인 어워드 2023</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 X 컨버터블, '올해의 콘셉트카'로 선정</p>
									<p class="card-p2">'오토 앤드 디자인'에서 주최하는 '카 디자인 어워드 2023' 에서 '올해의 콘셉트카'로 선정되며 디자인
										우수성을 인정받았습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-in-front-of-the-building-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">레드닷 어워드 2023</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">G90, 수송 디자인 분야 본상</p>
									<p class="card-p2">세계적인 디자인 상 '레드 닷 어워드'에서 '역동적인 우아함'이라는 제네시스
										디자인 정체성이 반영된 품격있는 외관으로 본상을 받았습니다</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-crane-white-genesis-x-convertible-exterior-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">카 디자인 어워드 2023</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 X 컨버터블, '올해의 콘셉트카'로 선정</p>
									<p class="card-p2">'오토 앤드 디자인'에서 주최하는 '카 디자인 어워드 2023' 에서 '올해의 콘셉트카'로 선정되며 디자인
										우수성을 인정받았습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-in-front-of-the-building-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">레드닷 어워드 2023</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">G90, 수송 디자인 분야 본상</p>
									<p class="card-p2">세계적인 디자인 상 '레드 닷 어워드'에서 '역동적인 우아함'이라는 제네시스
										디자인 정체성이 반영된 품격있는 외관으로 본상을 받았습니다</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-21-inch-diamond-cutting-wheels-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">2023 모터트렌드 올해의 차</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 G90, 모터트렌드 올해의 차</p>
									<p class="card-p2">세계적으로 권위 있는 자동차 전문지 모터트렌드의 6가지 항목 평가에서 G90가 '2023년 올해의 차 (미국 사양 기준)'에 선정되었습니다.</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-in-front-of-the-building-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">레드닷 어워드 2023</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">G90, 수송 디자인 분야 본상</p>
									<p class="card-p2">세계적인 디자인 상 '레드 닷 어워드'에서 '역동적인 우아함'이라는 제네시스
										디자인 정체성이 반영된 품격있는 외관으로 본상을 받았습니다</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-21-inch-diamond-cutting-wheels-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">2023 모터트렌드 올해의 차</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 G90, 모터트렌드 올해의 차</p>
									<p class="card-p2">세계적으로 권위 있는 자동차 전문지 모터트렌드의 6가지 항목 평가에서 G90가 '2023년 올해의 차 (미국 사양 기준)'에 선정되었습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-showroom-vehicles-tasman-blue-g90-21my-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">레드닷 어워드 2022</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스, '2022 레드 닷 어워드'에서 4개 부문 수상</p>
									<p class="card-p2">제네시스가 독일 노르트하인 베스트팔린 디자인센터가 주관하는 '2022 레드 닷 어워드'에서 총 4개의 디자인상을 수상하였습니다.</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-uyuni-white-g90-21-inch-diamond-cutting-wheels-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">2023 모터트렌드 올해의 차</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 G90, 모터트렌드 올해의 차</p>
									<p class="card-p2">세계적으로 권위 있는 자동차 전문지 모터트렌드의 6가지 항목 평가에서 G90가 '2023년 올해의 차 (미국 사양 기준)'에 선정되었습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-showroom-vehicles-tasman-blue-g90-21my-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">레드닷 어워드 2022</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스, '2022 레드 닷 어워드'에서 4개 부문 수상</p>
									<p class="card-p2">제네시스가 독일 노르트하인 베스트팔린 디자인센터가 주관하는 '2022 레드 닷 어워드'에서 총 4개의 디자인상을 수상하였습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-main-the-awards-2024-best-of-awards-mauna-red-electrified-gv70-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  									
									<h5 class="card-title">카즈닷컴 어워드 2024</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 ELECTRIFIED GV70, 美 카즈닷컴</p>
									<p class="card-text card-p1" style="font-size: 20pt;">'2024 최고의 고급차' 수상</p>
									<p class="card-p2">GV70 전동화 모델은 우아한 외관과 잘 정돈된 실내, 인상적인 주행성능을 갖춘 전기차로 인정받았습니다.</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-showroom-vehicles-tasman-blue-g90-21my-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">레드닷 어워드 2022</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스, '2022 레드 닷 어워드'에서 4개 부문 수상</p>
									<p class="card-p2">제네시스가 독일 노르트하인 베스트팔린 디자인센터가 주관하는 '2022 레드 닷 어워드'에서 총 4개의 디자인상을 수상하였습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-main-the-awards-2024-best-of-awards-mauna-red-electrified-gv70-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  									
									<h5 class="card-title">카즈닷컴 어워드 2024</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 ELECTRIFIED GV70, 美 카즈닷컴</p>
									<p class="card-text card-p1" style="font-size: 20pt;">'2024 최고의 고급차' 수상</p>
									<p class="card-p2">GV70 전동화 모델은 우아한 외관과 잘 정돈된 실내, 인상적인 주행성능을 갖춘 전기차로 인정받았습니다.</p>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3 inner-award" style="opacity: 50%;">
								<img class="img-fluid card-img-top" src="<%= ctxPath%>/images/MainPage/the-Award/genesis-kr-main-the-awards-crane-white-genesis-x-convertible-exterior-660x396.jpg">
								<div class="card"> <!-- 18rem 은 font size의 18배 크기임. 즉, 상대적 크기임. 만약에 width: 280px; 으로 하면 px 이므로 고정 크기임. -->  
									<h5 class="card-title">카 디자인 어워드 2023</h5>
									<p class="card-text card-p1" style="font-size: 20pt;">제네시스 X 컨버터블, '올해의 콘셉트카'로 선정</p>
									<p class="card-p2">'오토 앤드 디자인'에서 주최하는 '카 디자인 어워드 2023' 에서 '올해의 콘셉트카'로 선정되며 디자인
										우수성을 인정받았습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="customer-voice" style="background-image: url('<%= ctxPath%>/images/MainPage/customer-voice/genesis-kr-main-genesis-events-17-desktop-1920x960-ko-3.jpg');">
			<div style="position:relative; top:300px; color:white; font-size: 50pt; font-weight: lighter; margin:100px 0 0 200px;">GENESIS</div>
			<div style="position:relative; color:white; font-size: 20pt; font-weight: lighter; margin:330px 0 0 200px;">당신의 앞길을 응원합니다.</div>
			<button class="customer-voice-button">고객의소리</button>
		</div>
	<jsp:include page="Main_Footer.jsp"></jsp:include>