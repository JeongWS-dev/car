
$(document).ready(function(){


  // 홈페이지가 시작될 때 차 목록을 보여주는 함수 사용
  
  showCarList();
  swiperset();

  $("div#ALL").click(function(){
    
    carSearchType = $(this).text();
    showCarList();
    swiperset();
  });
  
  $("div#SEDAN").click(function(){
    
    carSearchType = $(this).text();
    showCarList();
    swiperset();
  });
  
  $("div#SUV").click(function(){
    
    carSearchType = $(this).text();

    showCarList();
    swiperset();
  });


/*
  $("div#ALL").click(function(){
      // 바에 있는 버튼 클릭 했을 때
     //   e.preventDefault(); // 링크의 기본 동작을 막음
    // alert("ALL button clicked");
    //var carSearchType = $(e.target).text() // 차 종류를 가져옴
    let v_html = ``;
    let carNameNew = "";
    $.ajax({
      url:"/car/estimate/carTypeJSON.car",
      type:"get",
      data: {"carSearchType" : 'ALL'},
      dataType : "json",
      
      success:function(json){ 
        
        if(json.length == 0) { // json== null하면 오류 남. 넘겨 받을 때 new 선언해서 받아서 빈 껍데기 배열이기 때문에 null이 아니고 길이가 0임.
          v_html = `현재 상품 준비중 입니다...`;
          $("div.slider_outline").html(v_html);
        }
       // console.log("~~~ 확인용 json 1=> ", JSON.stringify(json));

        else{
          $.each(json, function(index, item){
            v_html +=  `<div class="swiper-slide">
                          <div class="slide_pieces">
                            <div class="vehicle_title">
                              <div class= "vehicle_name">`
            if( item.CarPoint == 'GENERAL' || item.CarPoint.length < 11){
              carNameNew = item.Pk_CarName.split('_').join(' ');
              v_html += carNameNew; // 차량 이름의 _대신 공백.
            }
            else{
              let carname_arr = item.Pk_CarName.split('_', 1); // _을 기준으로 나눈 배열을 1개로 반환해라. (앞의 차 이름만 받아오기 위함)
              //console.log("차량~~", car[0]);
              carNameNew = carname_arr[0];
              v_html += carNameNew; // 차 이름
            }

            v_html += `</div>
                      <span class=icon>`
            
            if(item.CarLogo != null){
              if(item.CarLogo == 'NEW'){
                v_html +=`<img src="../images/Estimate/new_50x24.png" />`
              }
              else if(item.CarLogo == 'EV'){
                v_html +=`<img src="../images/Estimate/ev_20x24.png" />`
              }
            }

            v_html += `</span> </div> <div class="brand_title">`

            if(item.CarPoint.length > 8){
              v_html += item.CarPoint.split('_').join(' '); // CarPoint의 _대신 공백
            }

            v_html += `</div> <div class="bar_image">
                      <img src="../images/Estimate/${item.Pk_CarName}.png" class="car_image" /> 
                      </div>
                      </div>
                      </div>`;
            
          });// end of each------------

          $("div#img_slider").empty();
          $("div#img_slider").append(v_html);
          console.log(v_html);

        }// end of else-----------

      
        
       // console.log("~~~ 확인용 json => ", JSON.stringify(json));
       // alert("확인용 carSearchType : " + carSearchType);
       //  console.log("~~~~~~3"+carSearchType);
             
     
        
      },// end of success---------
        error: function(request, status, error){
        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }

    });// end of ajax---------
  });// end of  $("div#ALL").click(function(){*/
});// end of $(document).ready(function(){---------

/*
const tabButtons = document.querySelectorAll('.tab-btn');
var hide_car;

tabButtons.forEach(button => {
    button.addEventListener('click', function(event) {
        // 기본 이벤트 동작을 막습니다. (페이지 새로고침 방지)
        event.preventDefault();

        // 클릭된 버튼의 아이디 값
        const buttonId = this.getAttribute('id');

        if(id='BLACK'){
            hide_car = document.querySelectorAll('.swiper-slide:not(#g90new_title)');
            element.style.display = 'none';
        }
        else if(id='SEDAN'){
            window.location.href = 'estimate_sedan.jsp'; 
        }
        else if(id='SUV'){
            window.location.href = 'estimate_suv.jsp'; 
        }

        // 여기서 원하는 로직을 수행하면 됩니다.
        // 예를 들어, 해당 아이디 값을 변수에 저장하거나 다른 함수를 호출할 수 있습니다.

    });
});


    const btnShareTw = document.querySelector('.bar_share_tw');

    btnShareTw.addEventListener('click', () => {
    const sendText = '제네시스 견적내기';
    const pageUrl = `${pageContext.request.contextPath}/estimate/estimate.car`;
    window.open(`https://twitter.com/intent/tweet?text=${sendText}&url=${pageUrl}`);
    });


    const btnShareFb = document.querySelector('.bar_share_fb');

    btnShareFb.addEventListener('click', () => {
    const pageUrl = `${pageContext.request.contextPath}/estimate/estimate.car`;
    window.open(`http://www.facebook.com/sharer/sharer.php?u=${pageUrl}`);
    });
   




var swiper = new Swiper('.swiper-container', {
    // 슬라이더 옵션 설정
  });

  // 슬라이더 슬라이드 변경 시 이벤트 처리
  swiper.on('slideChange', function () {
    if (swiper.activeIndex === 0) {
      $('.left-slide').hide();
      $('.right-slide').show();
    } else if (swiper.activeIndex === swiper.slides.length - 3) {
      $('.left-slide').show();
      $('.right-slide').hide();
    } else {
      $('.left-slide').show();
      $('.right-slide').show();
    }
  });
*/

let carSearchType = 'ALL';
let v_html = ``;
let carNameNew = "";

function showCarList(){
        // 바에 있는 버튼 클릭 했을 때
     //   e.preventDefault(); // 링크의 기본 동작을 막음
    // alert("ALL button clicked");
    //var carSearchType = $(e.target).text() // 차 종류를 가져옴

    $.ajax({
      url:"/car/estimate/carTypeJSON.car",
      type:"get",
      data: {"carSearchType" : carSearchType },
      dataType : "json",
      
      success:function(json){ 
      //  console.log("~~carSearchType 확인", carSearchType);
        if(json.length == 0) { // json== null하면 오류 남. 넘겨 받을 때 new 선언해서 받아서 빈 껍데기 배열이기 때문에 null이 아니고 길이가 0임.
          v_html = `현재 상품 준비중 입니다...`;
        }
       // console.log("~~~ 확인용 json 1=> ", JSON.stringify(json));

        else{
          v_html ="";
          $.each(json, function(index, item){
            v_html +=  `<div class="swiper-slide">
                          <div class="slide_pieces">
                            <div class="vehicle_title">
                              <div class= "vehicle_name">`
            if( item.CarPoint == 'GENERAL' || item.CarPoint.length < 11){
              carNameNew = item.Pk_CarName.split('_').join(' ');
              v_html += carNameNew; // 차량 이름의 _대신 공백.
            }
            else{
              let carname_arr = item.Pk_CarName.split('_', 1); // _을 기준으로 나눈 배열을 1개로 반환해라. (앞의 차 이름만 받아오기 위함)
              //console.log("차량~~", car[0]);
              carNameNew = carname_arr[0];
              v_html += carNameNew; // 차 이름
            }

            v_html += `</div>
                      <span class=icon>`
            
            if(item.CarLogo != null){
              if(item.CarLogo == 'NEW'){
                v_html +=`<img src="../images/Estimate/new_50x24.png" />`
              }
              else if(item.CarLogo == 'EV'){
                v_html +=`<img src="../images/Estimate/ev_20x24.png" />`
              }
            }

            v_html += `</span> </div> <div class="brand_title">`

            if(item.CarPoint.length > 8){
              v_html += item.CarPoint.split('_').join(' '); // CarPoint의 _대신 공백
            }

            v_html += `</div> <div class="bar_image">
                      <img src="../images/Estimate/${item.Pk_CarName}.png" class="car_image" /> 
                      </div>
                      </div>
                      </div>`;
            
          });// end of each------------

         
        }// end of else-----------
        $("div#img_slider").empty();
        $("div#img_slider").append(v_html);
 //       console.log(v_html);    
        
       // console.log("~~~ 확인용 json => ", JSON.stringify(json));
       // alert("확인용 carSearchType : " + carSearchType);
       //  console.log("~~~~~~3"+carSearchType);
             
     
        
      },// end of success---------
        error: function(request, status, error){
        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }

    });// end of ajax---------
}

var swiper = null;

function swiperset(){

  if (swiper != null) {
    swiper.destroy();
  }

  // 새로운 Swiper 객체를 생성합니다.
  swiper = new Swiper('.swiper-container', {
    loop: false,
    slidesPerView: 4, // 한 번에 표시할 슬라이드 수
    navigation: {
      nextEl: '.swiper-button-next', // 다음 버튼 요소 (선택 사항)
      prevEl: '.swiper-button-prev', // 이전 버튼 요소 (선택 사항)
    },
    freeModeSticky: false,
    autoHeight : true,  // 현재 활성 슬라이드높이 맞게 높이조정
    slidesOffsetBefore: 30,
    variableWidth: true,
  });
}
/*

    if (swiper.activeIndex==0) {
      $('.swiper-button-prev').hide();
      $('.swiper-button-next').show();
    } else if (swiper.realIndex == swiper.slides.length-4) { // swiper.realIndex는 현재 활성 슬라이드이고 swiper.slides.length는 슬라이드의 길이이다. 길이보다 -4 적을 땐 오른쪽 화살표 안보이게.
      $('.swiper-button-prev').show();
      $('.swiper-button-next').hide();
    }
    else{
      $('.swiper-button-prev').show();
      $('.swiper-button-next').show();
    }
    // 현재 활성 슬라이드의 인덱스 확인
    var currentIndex = swiper.realIndex; // 또는 swiper.activeIndex
    console.log("현재 활성 슬라이드의 인덱스:", currentIndex);
      console.log("swiper.activeIndex???", swiper.activeIndex);
      console.log("swiper.slides.length!!!", swiper.slides.length);
      console.log("swiper.realIndex~~~", swiper.realIndex);
*/

  
 

  



