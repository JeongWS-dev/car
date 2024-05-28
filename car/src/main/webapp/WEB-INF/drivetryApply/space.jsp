
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캐러셀 예제</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= ctxPath %>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    <!-- 내가 만든 css -->
    <link rel="stylesheet" href="<%= ctxPath %>/css/space.css">
    <!-- Font Awesome 6 Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <!-- Optional JavaScript -->
    <script src="<%= ctxPath %>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="<%= ctxPath %>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    
    <script>
        $(document).ready(function(){
            // 드롭다운 메뉴 클릭 이벤트
            $('.dropdown-item').click(function(e){
                e.preventDefault();
                var slideTo = $(this).data('slide-to');
                var selectedText = $(this).text();
                $('#space-info').carousel(slideTo);
                $('#space-dropdown').text(selectedText);
            });
        });
    </script>
</head>
<body>

<jsp:include page="../Main_Header.jsp"></jsp:include>

<div id="container">
    <video id="spaceVideo" autoplay muted loop>
        <source src="<%= ctxPath %>/video/drivetry_ApplyPage/SnapSave.io-THE GENESIS STAGE. G80 _ 제네시스-(1080p).mp4" type="video/mp4">
    </video>
    
    <div id="head-text">
        <p class="display-pc"><br>제네시스 스페이스 선택<br></p>
        <p class="el-desc"><br>시승 신청 또는 예약 내역 변경을 희망하시는 스페이스를 선택해주세요.<br><br><br><br></p>
    </div>

    <a class="nav-link dropdown-toggle h5" href="#" id="space-dropdown" data-toggle="dropdown" style="color:white">
        스페이스 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           
	</a>
    <!-- 드롭다운 항목에 data-slide-to 속성 추가 -->
    <div class="dropdown-menu our-space-Dropdown" aria-labelledby="space-dropdown" style="background-color: black;">
        <a class="dropdown-item" href="#" data-slide-to="2" style="color:white">제네시스 수지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <a class="dropdown-item" href="#" data-slide-to="0" style="color:white">제네시스 강남&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <a class="dropdown-item" href="#" data-slide-to="3" style="color:white">제네시스 스튜디오 안성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <a class="dropdown-item" href="#" data-slide-to="1" style="color:white">제네시스 스튜디오 하남&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
    </div>

    <br><br>
    <!-- 캐러셀 이미지 -->
    <div id="space-info" class="carousel slide carousel-fade" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#space-info" data-slide-to="0" class="active"></li>
            <li data-target="#space-info" data-slide-to="1"></li>
            <li data-target="#space-info" data-slide-to="2"></li>
            <li data-target="#space-info" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<%= ctxPath %>/images/drivetry_ApplyPage/genesis-kr-main-genesis-space-carousel-gangnam-desktop-2560x900-ko.jpg" class="d-block w-100" alt="...">
                <div id="space-gangnam" class="carousel-caption d-none d-md-block">
                    <span id="space-name">제네시스 강남</span>
                    <p id="space-feature">외부의 모든 자극을 차단하고 오롯이 차량에만 집중할 수 있는 공간</p>
                </div>
            </div>
            <div id="space-hanam" class="carousel-item">
                <img src="<%= ctxPath %>/images/drivetry_ApplyPage/genesis-kr-main-genesis-space-carousel-hanam-desktop-2560x900-ko.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <span id="space-name">제네시스 스튜디오 하남</span>
                    <p id="space-feature">제네시스의 브랜드 철학을 담은 첫번째 체험 공간</p>
                </div>		      
            </div>
            <div id="space-suji" class="carousel-item">
                <img src="<%= ctxPath %>/images/drivetry_ApplyPage/genesis-kr-main-genesis-space-carousel-suji-desktop-2560x900-ko.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <span id="space-name">제네시스 수지</span>
                    <p id="space-feature">제네시스 차량의 전 라인업을 경험하기에 가장 완벽한 공간</p>
                </div>		      
            </div>
            <div id="space-anseong" class="carousel-item">
                <img src="<%= ctxPath %>/images/drivetry_ApplyPage/genesis-kr-main-genesis-space-carousel-anseong-desktop-2560x900-ko.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <span id="space-name">제네시스 스튜디오 안성</span>
                    <p id="space-feature">제네시스의 끊임없는 혁신에 대한 열망을 담은 공간.</p>
                </div>		      
            </div>
        </div>
        <a class="carousel-control-prev" href="#space-info" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#space-info" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </a>
    </div>
</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>

<!-- jQuery 및 Bootstrap JS -->
<script src="<%= ctxPath %>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath %>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

</body>
</html>
