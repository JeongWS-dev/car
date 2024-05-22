
$(document).ready(function(){
  var swiper = null;
    // swiper 변수가 존재하고, 이전 Swiper 객체를 파괴합니다.
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
  });

  if (swiper.activeIndex===0) {
    $('.left-slide').hide()
    $('.right-slide').show()
  } else if (swiper.activeIndex === swiper.slides.length-1) {
    $('.left-slide').show()
    $('.right-slide').hide()
  }

  $("div#ALL").click(function(){
      // 바에 있는 버튼 클릭 했을 때
     //   e.preventDefault(); // 링크의 기본 동작을 막음
    // alert("ALL button clicked");
    //var carSearchType = $(e.target).text() // 차 종류를 가져옴

    $.ajax({
      url:"/car/estimate/carTypeJSON.car",
      type:"get",
      data: {"carSearchType" : 'ALL'},
      dataType : "json",
      
      success:function(json){ 
        let v_html = ``;
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
              v_html += item.Pk_CarName.split('_').join(' ');
            }
            else{
              let newcarname = item.Pk_CarName.split('_', 1); // _을 기준으로 나눈 배열을 1개로 반환해라. (앞의 차 이름만 받아오기 위함)
              //console.log("차량~~", car[0]);
              v_html += newcarname[0];
            }
             
           

            /*

            v_html +=         `</div>
                            <span class=icon>`
            
            if(CarLogo != null && CarLogo == 'NEW' ){
              v_html +=     `<img src="../images/Estimate/new_50x24.png" />`
            }
       /*     else if(CarLogo != null && CarLogo == 'EV'){

            } 

            html +=       `</span>	
                        </div>
                      <div class="brand_title">`;

            if( )
*/

            /*


              
            <div class="brand_title"></div>
            <div id="g90new_barimg" class="bar_image">
              <img src="<%= ctxPath%>/images/Estimate/G90_BLACK.png" class="car_image" />
            </div>
          </div>
        </div>
  */        
 

            
          });// end of each------------

        }// end of else-----------


      
        
       // console.log("~~~ 확인용 json => ", JSON.stringify(json));
       // alert("확인용 carSearchType : " + carSearchType);
       //  console.log("~~~~~~3"+carSearchType);
             
     
        
    }// end of success---------

    });// end of ajax---------
  });// end of  $("div#ALL").click(function(){
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

