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
<link rel="stylesheet" href="<%= ctxPath%>/css/applyCheck.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<script type="text/javascript">

// $(document).ready(function() {


    function goPay(){

            var name = document.getElementById('name').getAttribute('data-value');
            var phone = document.getElementById('phone').getAttribute('data-value');
            // 'data-value' 속성 값을 가져오기
            
            var carName = document.getElementById('carName').getAttribute('data-value');
            // 'data-value' 속성 값을 가져오기
            var schedule = document.getElementById('schedule').getAttribute('data-value');
            // 'data-value' 속성 값을 가져오기
            var place_name = document.getElementById('place_name').getAttribute('data-value');
            // 'data-value' 속성 값을 가져오기
            var payFee = document.getElementById('payFee').getAttribute('value');
            // 'data-value' 속성 값을 가져오기
            // alert(name);
            //window.location.href = "/car/drivetryApply/applyFinal.car";


            // 결제하기 버튼을 누르면 해당 정보들을 데이터베이스에 넣어준다.
        $.ajax({
            url:"/car/drivetryApply/applyCheck.car",
            data:{"name":name,
                  "phone":phone,
                  "carName":carName,
                  "schedule":schedule,
                  "place_name":place_name,
                  "payFee":payFee},
            //  ,"userid":$("input:hidden[name='userid']").val() // data 속성은 http://localhost:9090/MyMVC/member/emailDuplicateCheck.up 로 전송해야할 데이터를 말한다. 
            // type:"get",  //  type 을 생략하면 type:"get" 이다.
            
            // async:true,   // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
            //                  // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다.   
            
            dataType:"json", // Javascript Standard Object Notation.  dataType은 /MyMVC/member/emailDuplicateCheck.up 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
                            // 만약에 dataType:"xml" 으로 해주면 /MyMVC/member/emailDuplicateCheck.up 로 부터 받아오는 결과물은 xml 형식이어야 한다. 
                            // 만약에 dataType:"json" 으로 해주면 /MyMVC/member/emailDuplicateCheck.up 로 부터 받아오는 결과물은 json 형식이어야 한다. 

            success:function(json){
            let v_html = ``;
            console.log("확인용 json: " + json);
            if(json.length == 0) { // json== null하면 오류 남. 넘겨 받을 때 new 선언해서 받아서 빈 껍데기 배열이기 때문에 null이 아니고 길이가 0임.
                v_html = `드라이빙 라운지가 준비중입니다.`;
            }
            else{
                v_html ="";
                // alert(json);
                v_html = `<div id="place" style="text-align: center; background-color: lightgray; ">
                            <span style="color: gray; padding: 2% 0">지역 선택</span>
                            <div id="table">
                                <table id="areatable"> <tr>`;
                $.each(json, function(index, item){
                // alert(item.city);
                v_html += `<td><button id="areachoicebtn" onclick="choiceCity('${Area}','${item.city}')">${item.city}</button></td>`;
                });//end of each ----------------------
                v_html += `</tr> </table></div></div></div>`;
            
            }
            // alert(v_html);
            $("div#in-container").html(v_html);
            },

            
            error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
        })



    }// end of function goCoinPayment(ctxPath, userid)-------------------- 


    




// });

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
                        <td  id = "name" name="name" data-value="홍길동">홍길동</td>
                    </tr>
                    <tr>
                        <th scope="row" >휴대폰</th>
                        <td id = "phone"  name="phone" data-value="01071842459">01071842459</td>
                    </tr>
                    <tr>
                        <th scope="row"  >시승 희망 차량</th>
                        <td id = "carName"  name="carName" data-value="G90">G90</td>
                    </tr>
                    <tr>
                        <th scope="row">신청일</th>
                        <td id = "schedule" name="schedule" data-value="2024-07-01">2024-07-01</td>
                    </tr>
                    <tr>
                        <th scope="row">신청 지점</th>
                        <td  id = "place_name" name="place_name" data-value="드라이빙 라운지 성수">드라이빙 라운지 성수</td>
                    </tr>
                    <tr>
                        <th scope="row" >시승 구분</th>
                        <td>동승 시승 서비스</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="ApplyFee">
            <span style="font-size: 25pt; font-weight: 300;" id="payFee" name="payFee" value="10원">시승비 : 10원 <br></span>
        </div>

        <div id="input-button">
            <input type="button" class="cta-button type-line type-white" style="background-color: white; color: black;" value="아니오(이전 화면으로)" onclick="goBack()" />
            <input type="button"  id = "go-pay" class="cta-button type-line js-layer-opener is-async" style="background-color: black; color: white;"  value="결제 하기" onclick="goPay()"/>
        </div>
    </div>
</div>

<input >

<jsp:include page="../Main_Footer.jsp"></jsp:include> 