<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
    
<jsp:include page="../login_myPage_Header.jsp" />

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/memberEdit.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/user/memberEdit.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // 정보 수정하기 링크 클릭 시 Ajax 요청 보내기
        $('#update-link').click(function(e) {
            e.preventDefault();
            
            // 사용자가 입력한 정보 가져오기
            var userId = "${sessionScope.loginuser.pk_userid}";
            var formData = {
                userId: userId,
                username: $("#username").text(),
                email: $("#email").text(),
                phone: $("#phone").text(),
                address: $("#address").text()
            };
            
            // 폼 생성
            var form = $("<form>")
                .attr("method", "post")
                .attr("action", "<%= ctxPath %>/myPage/member/myinfoEdit2.car");

            // 데이터를 폼에 추가
            $.each(formData, function(key, value) {
                $("<input>")
                    .attr("type", "hidden")
                    .attr("name", key)
                    .val(value)
                    .appendTo(form);
            });

            // 폼을 body에 추가하고 제출
            $("body").append(form);
            form.submit();
        });
    });
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin-top: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 3%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #a4a4a4; /* 각 정보 사이에 연한 밑줄 추가 */
            padding-bottom: 1%; /* 밑줄과 정보 사이의 간격 조정 */
        }
        .info {
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd; /* 각 정보 사이에 연한 밑줄 추가 */
            padding-bottom: 1%; /* 밑줄과 정보 사이의 간격 조정 */
        }
        .info label {
            font-weight: bold;
        }
        .info p {
            margin: 5px 0;
        }
         .update-link {
            text-align: right;
        }
        .update-link a {
            color: #007bff;
            text-decoration: none;
            font-size: 15px;
        }
    </style>
    
    
</head>
<body>
    <div class="container">
        <h1>회원 정보</h1>
        <br><br>
        <div class="info">
            <label for="username">아이디</label>
            <p id="username">${sessionScope.loginuser.pk_userid}</p>
        </div>
        <div class="info">
            <label for="email">이메일</label>
            <p id="email">${sessionScope.loginuser.useremail}</p>
        </div>
        <div class="info">
            <label for="phone">연락처</label>
            <p id="phone">${sessionScope.loginuser.usermobile}</p>
        </div>
        <div class="info">
            <label for="address">우편번호</label>
            <p id="address">${sessionScope.loginuser.userpostcode}</p>
        </div>
        <div class="info">
            <label for="address">주소</label>
            <p id="address">${sessionScope.loginuser.useraddress}</p>
            <p>${sessionScope.loginuser.userdetailaddress}</p>
        </div>
          <div class="update-link">
            <a href="#" id="update-link">정보 수정하기 ▷</a>
        </div>
    </div>
</body>
</html>

<jsp:include page="../login_myPage_Footer.jsp" />