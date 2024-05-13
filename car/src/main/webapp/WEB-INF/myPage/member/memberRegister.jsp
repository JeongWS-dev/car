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
<title>회원가입</title>
<!-- bootstrap -->
<link rel="stylesheet" href="../../bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<style type="text/css">
	body > nav {
		height: 10%;
		background-color: black;
	}
	
	body > nav.top > img {
		margin-left: 40%;
	}
	
        body {
            font-family: Arial, sans-serif;
            margin-top: 7%;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
        }

        .title {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .description {
            font-size: 16px;
            margin-bottom: 20px;
            text-decoration: underline;
        }

        .checkbox-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .checkbox-group label {
            display: block;
            margin-bottom: 10px;
        }

        .btn-next {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-next:hover {
            background-color: #555;
        }

        .modal {
            display: none; /* 모달창은 기본적으로 숨김 */
            position: fixed; /* 모달창이 화면에 고정되도록 설정 */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 배경색을 반투명하게 설정 */
            z-index: 1; /* 모달창이 다른 요소들 위에 보이도록 설정 */
            padding-top: 100px; /* 모달창의 위쪽 여백 */
        }

        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 20px;
            border-radius: 5px;
            max-width: 400px; /* 모달창의 최대 너비 */
        }
</style>



<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
		
	<!-- Brand -->
	<img src="<%= ctxPath%>/images/myPage/logo.png" style = "width:7%;">

	<!-- Links -->
	
</nav>

</head>
<body>
    <div class="container">
        <h2 class="title">제네시스 통합계정</h2>
        <p class="description">통합계정 이용약관 및 개인정보 수집·이용에 동의해주세요.</p>
        <div class="checkbox-group">
            <label><input type="checkbox" id="agreeAll"> 모두 동의하기</label>
            <label><input type="checkbox" id="agreeTerms"> 통합계정 이용 동의 <button onclick="openModal()">더보기</button></label>
            <label><input type="checkbox" id="agreePrivacy"> 개인정보 수집·이용 동의</label>
        </div>
        <button class="btn-next" onclick="nextPage()">다음</button>
    </div>

    <!-- 모달 창 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>통합계정 이용 동의 상세보기</h3>
            <!-- 상세 내용 입력 -->
        </div>
    </div>

    <script>
        function openModal() {
            document.getElementById("myModal").style.display = "block"; // 모달창 열기
        }

        function closeModal() {
            document.getElementById("myModal").style.display = "none"; // 모달창 닫기
        }

        function nextPage() {
            // 다음 페이지로 이동하는 기능을 여기에 추가하세요
            // 예: location.href = "nextpage.html";
        }
    </script>
</body>
</html>