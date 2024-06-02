<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>

<title>드라이빙 라운지 선택</title> 
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/drivingLoungeChoice.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- jQuery -->
    <script src="<%= ctxPath %>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= ctxPath %>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    <!-- Bootstrap JS -->
    <script src="<%= ctxPath %>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <!-- Kakao Maps -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8cd36a9ca80015c17a395ab719b2d8d"></script>
    
 
<script type="text/javascript">

function choiceArea(area){
	// alert(area);
	$.ajax({
		url : "${pageContext.request.contextPath}/drivetryApply/choiceDrivingLoungCityJSON.car",
		type : "post",
		data : {"area":area},
		dataType:"json",
		success:function(json){
			let html = `<table id="areatable">`;
			
			$.each(json,function(index,item){
				html += `<tr>`;
				html += `<td><button id="areachoicebtn" onclick="choiceLounge('\${item.place_name}')">\${item.place_name}</button>`;
				html += `</tr>`;
			})
				html += `<tr>`;
				html += `<td><button id="areachoicebtn" onclick="backLounge()">이전</button>`;
				html += `</tr>`;
        	html += `</table>`;
        	
        	$("div#table").html(html);
		},
		error: function(request, status, error){
		alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
		}
	})
}// end of function choiceArea(area)

function backLounge(){
	
	$.ajax({
		url : "<%=ctxPath%>/drivetryApply/backLoungJSON.car",
		type : "post",
		dataType:"json",
		success:function(json){
			let html = `<table id="areatable">`;
			
			$.each(json,function(index,item){
				html += `<tr>`;
				html += `<td><button id="areachoicebtn" onclick="choiceArea('\${item.area_name}')">\${item.area_name}</button>`;
				html += `</tr>`;
			})
			
        	html += `</table>`;
        	
        	$("div#table").html(html);
		},
		error: function(request, status, error){
		alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
		}
	})
}// end of function backLounge()


function choiceLounge(placeName){
	
	var positionArr = [];
	var mapContainer = document.getElementById("map");
	
	// 지도를 생성할때 필요한 기본 옵션
	var options = {
		 	center: new kakao.maps.LatLng(37.556513150417395, 126.91951995383943), // 지도의 중심좌표. 반드시 존재해야함.
		 	<%--
			  	center 에 할당할 값은 kakao.maps.LatLng 클래스를 사용하여 생성한다.
			  	kakao.maps.LatLng 클래스의 2개 인자값은 첫번째 파라미터는 위도(latitude)이고, 두번째 파라미터는 경도(longitude)이다.
			 --%>
		 	level: 4  // 지도의 레벨(확대, 축소 정도). 숫자가 클수록 축소된다. 4가 적당함.
	 };
	
	// 지도 생성 및 생성된 지도객체 리턴
	var mapobj = new kakao.maps.Map(mapContainer, options);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성함. 	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도 타입 컨트롤을 지도에 표시함.
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미함.	
	mapobj.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
	
	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성함.	
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 지도에 표시함.
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 RIGHT는 오른쪽을 의미함.	 
	mapobj.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	if(navigator.geolocation) {
		// HTML5의 geolocation으로 사용할 수 있는지 확인한다 
		
		// GeoLocation을 이용해서 웹페이지에 접속한 사용자의 현재 위치를 확인하여 그 위치(위도,경도)를 지도의 중앙에 오도록 한다.
		navigator.geolocation.getCurrentPosition(function(position) {
			var latitude = position.coords.latitude;   // 현위치의 위도
			var longitude = position.coords.longitude; // 현위치의 경도
		//	console.log("현위치의 위도: "+latitude+", 현위치의 경도: "+longitude);
			// 현위치의 위도: 37.5499076, 현위치의 경도: 126.9218479
			
			// 마커가 표시될 위치를 geolocation으로 얻어온 현위치의 위.경도 좌표로 한다   
			var locPosition = new kakao.maps.LatLng(latitude, longitude);
	        
		    // 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
		    var imageOption = {offset: new kakao.maps.Point(15, 39)};
	
		    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성한다. 
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
		    // == 마커 생성하기 == //
			var marker = new kakao.maps.Marker({ 
				map: mapobj, 
		        position: locPosition // locPosition 좌표에 마커를 생성 
			}); 
		    
			marker.setMap(mapobj); // 지도에 마커를 표시한다
	     
			
			// === 인포윈도우(텍스트를 올릴 수 있는 말풍선 모양의 이미지) 생성하기 === //
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능함.
			var iwContent = "<div style='padding:5px; font-size:15pt;'>현재 위치</div>";
			
			// 인포윈도우 표시 위치
		    var iwPosition = locPosition;
			
		 // removeable 속성을 true 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됨
		    var iwRemoveable = true; 
	
		    // == 인포윈도우를 생성하기 == 
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
	
			// == 마커 위에 인포윈도우를 표시하기 == //
			infowindow.open(mapobj, marker);
	
			// == 지도의 센터위치를 locPosition로 변경한다.(사이트에 접속한 클라이언트 컴퓨터의 현재의 위.경도로 변경한다.)
		    mapobj.setCenter(locPosition);
			
	    });
	}
	else {
		// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정한다.
		var locPosition = new kakao.maps.LatLng(37.556513150417395, 126.91951995383943);     
	    
		// 위의 
		// 마커이미지를 기본이미지를 사용하지 않고 다른 이미지로 사용할 경우의 이미지 주소 
		// 부터
		// 마커 위에 인포윈도우를 표시하기 
		// 까지 동일함.
		
	 // 지도의 센터위치를 위에서 정적으로 입력한 위.경도로 변경한다.
	    mapobj.setCenter(locPosition);
		
	}// end of if~else------------------------------------------
	
	$.ajax({
		url:"<%= ctxPath%>/drivetryApply/choiceLoungLocationJSON.car",
		data : {"area":placeName},
		async:false, // !!!!! 지도는 비동기 통신이 아닌 동기 통신으로 해야 한다.!!!!!!
		dataType:"json",
		success:function(json){
			
		    // console.log(JSON.stringify(json));
			// JSON.stringify(json) 은 자바스크립트의 객체(배열)인 json 을 string 타입으로 변경시켜주는 것이다.
		<%--	
			[{"storeurl":"https://place.map.kakao.com/7858517","lng":126.98187860455485,"storename":"롯데백화점 본점","storeimg":"lotte02.png","storeaddress":"서울 중구 을지로 30 (T)02-771-2500","lat":37.56511284953554,"zIndex":1}
			,{"storeurl":"https://place.map.kakao.com/7969138","lng":126.98098265772731,"storename":"신세계백화점 본점","storeimg":"shinsegae.png","storeaddress":"서울 중구 소공로 63 (T)1588-1234","lat":37.56091181255155,"zIndex":2}
			,{"storeurl":"https://place.map.kakao.com/13057692","lng":126.98512381778167,"storename":"미래에셋센터원빌딩","storeimg":"miraeeset.png","storeaddress":"서울 중구 을지로5길 26 (T)02-6030-0100","lat":37.567386065415086,"zIndex":3}
			,{"storeurl":"https://place.map.kakao.com/21695719","lng":126.935699,"storename":"현대백화점신촌점","storeimg":"hyundai01.png","storeaddress":"서울 서대문구 신촌로 83 현대백화점신촌점 (T)02-3145-2233","lat":37.556005,"zIndex":4}
			,{"storeurl":"https://place.map.kakao.com/16530319","lng":126.919557,"storename":"쌍용강북교육센터","storeimg":"sist01.jpg","storeaddress":"서울 마포구 월드컵북로 21 풍성빌딩 2~4층 (T)02-336-8546","lat":37.556583,"zIndex":5}
			]
		--%>	
			
			$.each(json, function(index, item){
				var position = {};
				
				position.content = "<div class='mycontent'>"+
				                   "  <div class='title'>"+
				                   "    <strong>"+item.place_name+"</strong>"+
				                   "  </div>"+
				                   "  <div class='desc'>"+
				                   "    <span class='address'>주소 : "+item.d_address+"  <br>전화번호 : "+item.phone+"</span>"+
				                    
				                   "  </div>"+
				                   "</div>";
				                   
				position.latlng = new kakao.maps.LatLng(item.lat, item.lng);
				position.zIndex = item.zIndex;
				
				positionArr.push(position);
			});// end of $.each(json, function(index, item){})---------------
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    }
	});// end of $.ajax({})----------------------
	
	
	// infowindowArr 은 인포윈도우를 가지고 있는 객체 배열의 용도이다. 
	var infowindowArr = new Array();
	
	// === 객체 배열 만큼 마커 및 인포윈도우를 생성하여 지도위에 표시한다. === //
	for(var i=0; i<positionArr.length; i++){
		
		// == 마커 생성하기 == //
		var marker = new kakao.maps.Marker({ 
			map: mapobj, 
	        position: positionArr[i].latlng   
		}); 
		
		// 지도에 마커를 표시한다.
		marker.setMap(mapobj);
		
		// == 인포윈도우를 생성하기 == 
		var infowindow = new kakao.maps.InfoWindow({
			content: positionArr[i].content,
			removable: true,
			zIndex : i+1
		});
		
		// 인포윈도우를 가지고 있는 객체배열에 넣기 
		infowindowArr.push(infowindow);
		
		// == 마커 위에 인포윈도우를 표시하기 == //
		// infowindow.open(mapobj, marker);
		
		// == 마커 위에 인포윈도우를 표시하기 == //
		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 등록합니다 
	    // for문에서 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(mapobj, marker, infowindow, infowindowArr)); 
		
	}// end of for----------------
}

$(document).ready(function(){    
	// 지도를 담을 영역의 DOM 레퍼런스
	var mapContainer = document.getElementById("map");
	
	// 지도를 생성할때 필요한 기본 옵션
	var options = {
    	 	center: new kakao.maps.LatLng(37.556513150417395, 126.91951995383943), // 지도의 중심좌표. 반드시 존재해야함.
    	 	<%--
    		  	center 에 할당할 값은 kakao.maps.LatLng 클래스를 사용하여 생성한다.
    		  	kakao.maps.LatLng 클래스의 2개 인자값은 첫번째 파라미터는 위도(latitude)이고, 두번째 파라미터는 경도(longitude)이다.
    		 --%>
    	 	level: 4  // 지도의 레벨(확대, 축소 정도). 숫자가 클수록 축소된다. 4가 적당함.
     };
	
	// 지도 생성 및 생성된 지도객체 리턴
	var mapobj = new kakao.maps.Map(mapContainer, options);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성함. 	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도 타입 컨트롤을 지도에 표시함.
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미함.	
	mapobj.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
	
	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성함.	
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 지도에 표시함.
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 RIGHT는 오른쪽을 의미함.	 
	mapobj.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	if(navigator.geolocation) {
		// HTML5의 geolocation으로 사용할 수 있는지 확인한다 
		
		// GeoLocation을 이용해서 웹페이지에 접속한 사용자의 현재 위치를 확인하여 그 위치(위도,경도)를 지도의 중앙에 오도록 한다.
		navigator.geolocation.getCurrentPosition(function(position) {
			var latitude = position.coords.latitude;   // 현위치의 위도
			var longitude = position.coords.longitude; // 현위치의 경도
		//	console.log("현위치의 위도: "+latitude+", 현위치의 경도: "+longitude);
			// 현위치의 위도: 37.5499076, 현위치의 경도: 126.9218479
			
			// 마커가 표시될 위치를 geolocation으로 얻어온 현위치의 위.경도 좌표로 한다   
			var locPosition = new kakao.maps.LatLng(latitude, longitude);
	        
		    // 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
		    var imageOption = {offset: new kakao.maps.Point(15, 39)};

		    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성한다. 
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

		    // == 마커 생성하기 == //
			var marker = new kakao.maps.Marker({ 
				map: mapobj, 
		        position: locPosition // locPosition 좌표에 마커를 생성 
			}); 
		    
			marker.setMap(mapobj); // 지도에 마커를 표시한다
	     
			
			// === 인포윈도우(텍스트를 올릴 수 있는 말풍선 모양의 이미지) 생성하기 === //
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능함.
			var iwContent = "<div style='padding:5px; font-size:15pt;'>현재 위치</div>";
			
			// 인포윈도우 표시 위치
		    var iwPosition = locPosition;
			
		 // removeable 속성을 true 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됨
		    var iwRemoveable = true; 

		    // == 인포윈도우를 생성하기 == 
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});

			// == 마커 위에 인포윈도우를 표시하기 == //
			infowindow.open(mapobj, marker);

			// == 지도의 센터위치를 locPosition로 변경한다.(사이트에 접속한 클라이언트 컴퓨터의 현재의 위.경도로 변경한다.)
		    mapobj.setCenter(locPosition);
			
	    });
	}
	else {
		// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정한다.
		var locPosition = new kakao.maps.LatLng(37.556513150417395, 126.91951995383943);     
        
		// 위의 
		// 마커이미지를 기본이미지를 사용하지 않고 다른 이미지로 사용할 경우의 이미지 주소 
		// 부터
		// 마커 위에 인포윈도우를 표시하기 
		// 까지 동일함.
		
     // 지도의 센터위치를 위에서 정적으로 입력한 위.경도로 변경한다.
	    mapobj.setCenter(locPosition);
		
	}// end of if~else------------------------------------------
	
	
	// ============ 지도에 매장위치 마커 보여주기 시작 ============ //
	// 매장 마커를 표시할 위치와 내용을 가지고 있는 객체 배열
	var positionArr = [];
	
	$.ajax({
		url:"<%= ctxPath%>/drivetryApply/drivingLoungLocationJSON.car",
		async:false, // !!!!! 지도는 비동기 통신이 아닌 동기 통신으로 해야 한다.!!!!!!
		dataType:"json",
		success:function(json){
			
		    // console.log(JSON.stringify(json));
			// JSON.stringify(json) 은 자바스크립트의 객체(배열)인 json 을 string 타입으로 변경시켜주는 것이다.
		<%--	
			[{"storeurl":"https://place.map.kakao.com/7858517","lng":126.98187860455485,"storename":"롯데백화점 본점","storeimg":"lotte02.png","storeaddress":"서울 중구 을지로 30 (T)02-771-2500","lat":37.56511284953554,"zIndex":1}
			,{"storeurl":"https://place.map.kakao.com/7969138","lng":126.98098265772731,"storename":"신세계백화점 본점","storeimg":"shinsegae.png","storeaddress":"서울 중구 소공로 63 (T)1588-1234","lat":37.56091181255155,"zIndex":2}
			,{"storeurl":"https://place.map.kakao.com/13057692","lng":126.98512381778167,"storename":"미래에셋센터원빌딩","storeimg":"miraeeset.png","storeaddress":"서울 중구 을지로5길 26 (T)02-6030-0100","lat":37.567386065415086,"zIndex":3}
			,{"storeurl":"https://place.map.kakao.com/21695719","lng":126.935699,"storename":"현대백화점신촌점","storeimg":"hyundai01.png","storeaddress":"서울 서대문구 신촌로 83 현대백화점신촌점 (T)02-3145-2233","lat":37.556005,"zIndex":4}
			,{"storeurl":"https://place.map.kakao.com/16530319","lng":126.919557,"storename":"쌍용강북교육센터","storeimg":"sist01.jpg","storeaddress":"서울 마포구 월드컵북로 21 풍성빌딩 2~4층 (T)02-336-8546","lat":37.556583,"zIndex":5}
			]
		--%>	
			
			$.each(json, function(index, item){
				var position = {};
				
				position.content = "<div class='mycontent'>"+
				                   "  <div class='title'>"+
				                   "    <strong>"+item.place_name+"</strong>"+
				                   "  </div>"+
				                   "  <div class='desc'>"+
				                   "    <span class='address'>주소 : "+item.d_address+"  <br>전화번호 : "+item.phone+"</span>"+
				                    
				                   "  </div>"+
				                   "</div>";
				                   
				position.latlng = new kakao.maps.LatLng(item.lat, item.lng);
				position.zIndex = item.zIndex;
				
				positionArr.push(position);
			});// end of $.each(json, function(index, item){})---------------
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    }
	});// end of $.ajax({})----------------------
	
	
	// infowindowArr 은 인포윈도우를 가지고 있는 객체 배열의 용도이다. 
	var infowindowArr = new Array();
	
	// === 객체 배열 만큼 마커 및 인포윈도우를 생성하여 지도위에 표시한다. === //
	for(var i=0; i<positionArr.length; i++){
		
		// == 마커 생성하기 == //
		var marker = new kakao.maps.Marker({ 
			map: mapobj, 
	        position: positionArr[i].latlng   
		}); 
		
		// 지도에 마커를 표시한다.
		marker.setMap(mapobj);
		
		// == 인포윈도우를 생성하기 == 
		var infowindow = new kakao.maps.InfoWindow({
			content: positionArr[i].content,
			removable: true,
			zIndex : i+1
		});
		
		// 인포윈도우를 가지고 있는 객체배열에 넣기 
		infowindowArr.push(infowindow);
		
		// == 마커 위에 인포윈도우를 표시하기 == //
		// infowindow.open(mapobj, marker);
		
		// == 마커 위에 인포윈도우를 표시하기 == //
		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 등록합니다 
	    // for문에서 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(mapobj, marker, infowindow, infowindowArr)); 
		
	}// end of for----------------
	// ============ 지도에 매장위치 마커 보여주기 끝 ============ //
	
	
	// ================== 지도에 클릭 이벤트를 등록하기 시작 ======================= //
	// 지도를 클릭하면 클릭한 위치에 마커를 표시하면서 위,경도를 보여주도록 한다.
	
	// == 마커 생성하기 == //
	// 1. 마커이미지 변경
	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';       
        
	// 2. 마커이미지의 크기 
    var imageSize = new kakao.maps.Size(34, 39);   
		      
    // 3. 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
    var imageOption = {offset: new kakao.maps.Point(15, 39)};   
      
    // 4. 이미지정보를 가지고 있는 마커이미지를 생성한다. 
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		    
    var movingMarker = new kakao.maps.Marker({ 
		map: mapobj
	});
    
    // === 인포윈도우(텍스트를 올릴 수 있는 말풍선 모양의 이미지) 생성하기 === //
	var movingInfowindow = new kakao.maps.InfoWindow({
	    removable : false
	  //removable : true   // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됨
	});
	
    
	kakao.maps.event.addListener(mapobj, 'click', function(mouseEvent) {         
		    
		 // 클릭한 위도, 경도 정보를 가져옵니다 
		 var latlng = mouseEvent.latLng;
		 
		 // 마커 위치를 클릭한 위치로 옮긴다.
		 movingMarker.setPosition(latlng);
		 
		 // 인포윈도우의 내용물 변경하기 
		 movingInfowindow.setContent("<div style='padding:5px; font-size:9pt;'>여기가 어디에요?<br/><a href='https://map.kakao.com/link/map/여기,"+latlng.getLat()+","+latlng.getLng()+"' style='color:blue;' target='_blank'>큰지도</a> <a href='https://map.kakao.com/link/to/여기,"+latlng.getLat()+","+latlng.getLng()+"' style='color:blue' target='_blank'>길찾기</a></div>");  
		 
		 // == 마커 위에 인포윈도우를 표시하기 == //
		 movingInfowindow.open(mapobj, movingMarker);
		 
		 var htmlMessage = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, '; 
		     htmlMessage += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		 var resultDiv = document.getElementById("latlngResult"); 
		 resultDiv.innerHTML = htmlMessage;
	});
    // ================== 지도에 클릭 이벤트를 등록하기 끝 ======================= //
	
});

//!! 인포윈도우를 표시하는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만드는 함수(카카오에서 제공해준것임)입니다 !! // 
	function makeOverListener(mapobj, marker, infowindow, infowindowArr) {
	    return function() {
	    	// alert("infowindow.getZIndex()-1:"+ (infowindow.getZIndex()-1));
		    	
	    	for(var i=0; i<infowindowArr.length; i++) {
	    		if(i == infowindow.getZIndex()-1) {
		    			infowindowArr[i].open(mapobj, marker);
	    		}
	    		else{
	    			infowindowArr[i].close();
	    		}
	    	}
	    };
	    
	}// end of function makeOverListener(mapobj, marker, infowindow, infowindowArr)--------
	
	
</script>

<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<div id="container">
    <div id="map" style="margin-left:25%; width:75%; height:900px;"></div>
    <div id="latlngResult" style="display: none;"></div>
    
 
    <div id="in-container">
        <div id="place" style="text-align: center; background-color: lightgray; ">
            <span style="color: gray; padding: 2% 0">지역 선택</span>
            <c:if test="${not empty requestScope.areaList}">
                <div id="table">
                    
                    <table id="areatable">
                        
                        <c:forEach var = "area_map" items="${requestScope.areaList}">
                            <tr>
                                <td><button id="areachoicebtn" onclick="choiceArea('${area_map.Area}')">${area_map.Area}</button></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </c:if>

        </div>
        
    </div>

</div>

<jsp:include page="../Main_Footer.jsp"></jsp:include>