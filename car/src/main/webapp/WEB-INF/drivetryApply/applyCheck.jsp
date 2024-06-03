<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>

<title>약관</title> 
<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/applyCheck.css" type="text/css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<script type="text/javascript">



//=== 포트원(구 아임포트) 결제를 해주는 함수 === //
function goCoinPayment(userid,ctxPath){
	
 // alert(`확인용 부모창의 함수 호출함.\n결제금액 : ${coinmoney}원, 사용자id : ${userid}`); 
	if($("input[name='reservation_date']").val()!=""){
		// >>> 포트원(구 아임포트) 결제 팝업창 띄우기 <<<
	    // 너비 1000, 높이 600 인 팝업창을 화면 가운데 위치시키기
		const width = 1000;
		const height = 600;

	    const left = Math.ceil( (window.screen.width - width)/2 ); // 정수로 만듬
	    const top = Math.ceil( (window.screen.height - height)/2 ); // 정수로 만듬
	    
	    const url = `\${ctxPath}/drivetryApply/reservation.car?userid=\${userid}`;      

	    window.open(url, "coinPurchaseEnd",
	               `left=\${left}, top=\${top}, width=\${width}, height=\${height}`);
	}
	else{
		alert("예약 일정을 선택하세요.");
	}

}// end of function goCoinPurchaseEnd(ctxPath, coinmoney, userid)----------------------------


function sendReservation(ctxPath,userid){
	alert("sendReservation 함수를 실행했습니다.");
	
	const carName = $("input[name='carname']").val();
	const date = $("input[name='reservation_date']").val();
	const place_name = $("input[name='place_name']").val();
	
	
	$.ajax({
        url : ctxPath+"/drivetryApply/sendReservationJSON.car",
        data : {"carName":carName,"date":date,"place_name":place_name}, 
        type : "post",  
        async : true,
        dataType : "json",
        success : function(json){
          
              if(json.isSuccess == 1){
            	  alert("시승 신청이 성공적으로 접수되었습니다.");
            	  location.href = ctxPath+"/index.car";
              }
              else{
            	  alert("시승 신청이 실패했습니다.")
              }
        },
        
        error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        }

    });
}
</script>

<div id="container" style="background-color: white; color: black;">
    <div id="container2">
        <h1 style="font-weight: 300; font-size: 23pt;">선택하신 정보로 시승예약하시겠습니까?</h1>
        <h1 style="font-weight: 300; font-size: 23pt; color:chocolate">'예'선택 시 시승예약이 진행됩니다.</h1>
    


        <div class="cm-table type-row left-align-2 left-align-3 display-pc">
            <table id = "applyList">
                <colgroup>
                    <col style="width:20%;">
                    <col style="width:55%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody id="appCheck">
                    <tr>
                        <th scope="row">신청자 이름</th>
                        <td  id = "name" name="name">${requestScope.username }</td>
                    </tr>
                    <tr>
                        <th scope="row" >휴대폰</th>
                        <td id = "phone"  name="phone">${requestScope.mobile }</td>
                    </tr>
                    <tr>
                        <th scope="row"  >시승 희망 차량</th>
                        <td id = "carName"  name="carName">${requestScope.carName }</td>
                    </tr>
                    <tr>
                        <th scope="row">신청일</th>
                        <td id = "schedule" name="schedule"><input name="reservation_date" type="date" value=""/></td>
                    </tr>
                    <tr>
                        <th scope="row">신청 지점</th>
                        <td  id = "place_name" name="place_name">${requestScope.place_name }</td>
                    </tr>
                    <tr>
                        <th scope="row" >시승 구분</th>
                        <td>동승 시승 서비스</td>
                    </tr>
                    <tr>
                        <th scope="row" >시승비</th>
                        <td>10,000원</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="input-button">
            <input type="button" class="cta-button type-line type-white" style="background-color: white; color: black;" value="아니오(메인 화면으로)" onclick="goMain()" />
            <input type="button" class="cta-button type-line js-layer-opener is-async" style="background-color: black; color: white;"  value="결제 하기" onclick="goCoinPayment('${requestScope.userid}','<%=ctxPath%>')"/>
        </div>
    </div>
    
	<input name="carname" type="hidden" value="${requestScope.carName}"/>
	<input name="place_name" type="hidden" value="${requestScope.place_name }"/>
</div>


<jsp:include page="../Main_Footer.jsp"></jsp:include> 