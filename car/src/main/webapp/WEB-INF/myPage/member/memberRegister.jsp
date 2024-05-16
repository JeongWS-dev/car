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
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

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
           background-color: #8c8c8c;
           color: #fff;
           border: none;
           border-radius: 5px;
           cursor: pointer;
       }

       .btn-next:hover {
           background-color: #555;
       }

      .modal,
      .modal2 {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow-y: initial !imporant;
	  background-color: rgba(0, 0, 0, 0.5);
	}
	
	#myModal > div,
	#myModa2 > div {
	  background-color: #fefefe;
	  margin: 10% auto;
	  margin-buttom: 30%;
	  padding: 1%;
	  border: 1px solid #888;
	  width: 30%;
	  height: 60%; /* 내용이 많아도 모달 창의 높이가 고정되도록 설정합니다. */
	  font-size: 12px;
	}

	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		// 모달 열기
		document.getElementById('showModalBtn1').onclick = function() {
		  document.getElementById('myModal').style.display = "block";
		}
		
		document.getElementById('showModalBtn2').onclick = function() {
			  document.getElementById('myModa2').style.display = "block";
		}

		// 모달 닫기
		document.getElementsByClassName('modal-footer')[0].onclick = function() {
		  document.getElementById('myModal').style.display = "none";
		}
		document.getElementsByClassName('modal-footer').onclick = function() {
			  document.getElementById('myModal2').style.display = "none";
		}
		
		// 모달 외부를 클릭하여 닫기
		window.onclick = function(event) {
		  var modal = document.getElementById('myModal');
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		  
		  var modal2 = document.getElementById('myModal2');
		  if (event.target == modal2) {
			    modal.style.display = "none";
			  }
		}
	});

    function nextPage() {
        // 다음 페이지로 이동하는 기능을 여기에 추가하세요
        // 예: location.href = "nextpage.html";
   };
	    
</script>

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
     	<hr>
        <div class="checkbox-group">
            <label><input type="checkbox" id="agreeAll"> 모두 동의하기</label>
            <hr>
            <label><input type="checkbox" id="agreeTerms"> 통합계정 이용 동의 (필수) <a href="#" id="showModalBtn1" style="float: right; font-size: 12px;">더보기</a></label>
            <label><input type="checkbox" id="agreePrivacy"> 개인정보 수집·이용 동의 (필수) <a href="#" id="showModalBtn2" style="float: right; font-size: 12px;">더보기</a></label>
        </div>
        <hr>
        <button class="btn-next" onclick="nextPage()">다음</button>
    </div>

    <!-- 통합계정 모달 창 -->
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    
	    <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title">제네시스 통합계정 이용약관 동의</h4>
        </div>
        <div class="modal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
			제1장 총칙<br>
			<br>
			제 1 조 (목적)<br>
			본 약관은 제네시스 고객이 개별 서비스의 아이디(ID)를 통합하여 하나의 ID로 사용할 수 있도록 현대자동차 주식회사(이하 '회사')가 제공하는 '제네시스 어카운트'를 이용하는 데 필요한 회원과 회사 간의 권리, 의무 및 책임사항, 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.<br>
			<br>
			제 2 조 (약관의 효력 및 변경)<br>
			① 본 약관은 제네시스 어카운트를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다.<br>
			② 본 약관의 내용은 현대자동차 제네시스 웹사이트(www.genesis.com, 이하 '웹사이트')에 게시하거나 기타의 방법으로 회원에게 공지하고, 이에 동의한 회원이 제네시스 어카운트에 가입함으로써 효력이 발생합니다.<br>
			③ 회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 제2항과 같은 방법으로 그 적용일자 7일 전부터 공지합니다. 다만, 회원에게 불리한 약관의 변경인 경우에는 그 적용일자 30일 전부터 공지하며, E-mail, SMS 등으로 회원에게 개별 통지합니다. 단, 회원의 연락처 미기재, 변경 후 미수정 등으로 인하여 개별 통지가 어려운 경우에 한하여 본 항의 공지를 함으로써 개별 통지 한 것으로 간주합니다.<br>
			④ 회사가 제3항에 따라 변경 약관을 공지 또는 통지하면서, 회원에게 약관 변경 적용일까지 거부의사를 표시하지 아니할 경우, 약관의 변경에 동의한 것으로 간주한다는 내용을 공지 또는 통지하였음에도 회원이 명시적으로 약관 변경에 대한 거부의사를 표시하지 아니하면, 회원이 변경 약관에 동의한 것으로 간주합니다. 회원은 변경된 약관 사항에 동의하지 않으면 제네시스 어카운트 이용을 중단하고 이용 계약을 해지할 수 있습니다.<br>
			⑤ 회원은 회사가 운영하는 웹사이트를 정기적으로 방문하여 약관의 변경사항을 확인해야 합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해에 대해 회사는 귀책사유가 없는 한 책임을 지지 않습니다.<br>
			⑥ 본 약관은 제네시스 어카운트를 이용하여 접속 가능한 각 서비스에 모두 적용됩니다.<br>
			<br>
			제 3 조 (약관 외 준칙)<br>
			본 약관에 명시되지 않은 사항에 대해서는 전기통신사업법 등 관계법령을 적용합니다.<br>
			<br>
			제 4 조 (용어의 정의)<br>
			① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
			1. 제네시스 어카운트: 하나의 ID와 비밀번호(PASSWORD)로 회사가 제공하는 개별 서비스를 이용할 수 있고, 공통관리정보 ∙ 서비스 이용 신청 및 해지 등을 통합관리 할 수 있도록 회사가 정한 회원관리정책을 말합니다.<br>
			2. 회원: 본 약관에 동의하고 제네시스 어카운트 제공화면에서 이용신청을 하여 ID와 비밀번호를 발급 받은 고객을 말합니다.<br>
			3. 관계사: 회사와의 제휴를 통하여 회원에게 정보통신서비스를 제공하는 법인을 말합니다. 관계사는 추가 ∙ 변동될 수 있으며, 이 경우 본 약관 제19조에서 정한 방식으로 회원에게 공지합니다.<br>
			<br>

			</div>
		<div class="modal-footer" style="background-color: black; color: white; justify-content: center;">확인</div>
		</div>
		
	</div>
	
	    <!-- 통합계정 모달 창 -->
	<div id="myModa2" class="modal">
	  <div class="modal-content">
	    
	    <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title">제네시스 통합계정 개인정보 수집ㆍ이용 동의</h4>
        </div>
        <div class="modal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
			1. 개인정보의 수집·이용 목적 : 당사 서비스 이용을 위한 통합 계정 생성, 회원관리 및 본인확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 민원 처리, 서비스 개선 (인구통계학적 특성에 따른 분석 및 서비스 제공, 접속빈도 파악 및 서비스 이용에 대한 통계처리)<br>
			<br>
			2. 수집 항목<br>
			가) 통합 ID 가입 시 : 이메일, 비밀번호, 이름, 생년월일, 휴대폰 번호, 간편 PIN 번호, CI, DI<br>
			만 14세 미만 아동의 경우 법정 대리인 정보(법정대리인의 이름, 생년월일, 성별, 국적, CI, DI)<br>
			나) 소셜 ID 가입 시 : SNS 종류, SNS 아이디, 휴대폰 번호, 간편 PIN 번호<br>
			※ 서비스 이용중 자동 생성 : 쿠키, 방문 일시, 서비스 이용기록, 불량 이용기록<br>
			<br>
			※ 자세한 사항은 현대자동차 홈페이지의 통합계정 개인정보처리방침을 확인하시기 바라며, 회사 서비스 추가에 따라 항목이 변경될 수 있습니다.<br>
			<br><br>
			3. 수집한 개인정보의 보유 및 이용기간<br>
			가. 계정 탈퇴 시 까지 (관련 법령이 있는 경우 예외)<br>
			나. 소비자 불만 또는 분쟁 처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자 보호에 관한 법률)<br>
			다. 통신비밀보호법에 따른 서비스 이용기록, 접속로그 : 3개월<br>
			<br><br>
			※ 위와 같이 개인정보를 수집 · 이용하는데 동의를 거부할 권리가 있습니다 . 그러나 동의를 거부할 경우, 통합계정 회원가입이 제한됩니다
			<br>

			</div>
		<div class="modal-footer" style="background-color: black; color: white; justify-content: center;">확인</div>
		</div>
		
	</div>



</body>
</html>