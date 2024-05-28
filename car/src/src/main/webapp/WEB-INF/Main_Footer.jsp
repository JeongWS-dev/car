<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
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

<script type="text/javascript">
	
let targetMainMenu = $("a.nav-link");
let currentMenu = null; // 현재 열린 메뉴를 추적하는 변수

targetMainMenu.click(function() {
    var targetSubMenu = $(this).next("ul.nav-item");

    if (currentMenu && currentMenu[0] === targetSubMenu[0]) {
        // 현재 열린 메뉴와 클릭한 메뉴가 같다면 slideUp
        targetSubMenu.slideUp();
        currentMenu = null; // 현재 열린 메뉴를 초기화
    } else {
        if (currentMenu) {
            // 다른 메뉴가 열려 있다면 애니메이션 없이 닫기
            currentMenu.hide();
        }
        // 새로운 메뉴를 애니메이션 없이 열기
        targetSubMenu.show();
        // 새로운 메뉴를 slidedown으로 애니메이션 열기
        targetSubMenu.hide().slideDown();
        // 현재 메뉴로 설정
        currentMenu = targetSubMenu;
    }
});

</script>

</html>