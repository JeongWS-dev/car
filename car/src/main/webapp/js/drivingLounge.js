
$(document).ready(function(){

  const ctxPath = $("input[name='ctxPath']").val();
  //console.log("ctxPath", ctxPath);
  let carSearchType = 'ALL';
  let mainCar = "";
  // 홈페이지가 시작될 때 차 목록을 보여주는 함수 사용
  showCarList(carSearchType); // 가로 슬라이드 차 목록 보여주는 함수
  swiperset(); // swiper 설정 함수


 // showMain(mainCar); // 메인 화면 보여주는 함수

  $("div.btn-wrap").click(function(){
    
    carSearchType = $(this).find(".tab-btn").text();;
    showCarList(carSearchType);
    swiperset();

  });
  
  /*
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
*/

  // 슬라이드 안의 카드를 클릭 했을 때 위의 메인 화면이 바뀌는 함수
  $(document).on('click', '.card', function() {
    mainCar = $(this).find('.vehicle_name').text() + ( $(this).find('.brand_title').text() ? "_"+ $(this).find('.brand_title').text() : "");
    mainCar = mainCar.split(' ').join('_');
    showMain(mainCar, ctxPath);

  });// end of $(document).on('click', '.card', function() {

/*
  $(document).on('click', '.btn-carselect', function() {

    const frm = document.;
		frm.action = "memberEditEnd.up";
		frm.method = "post";
		frm.submit();
  });
*/

  ////////////////////////////////////////////////////////////////////////

  // 차량선택하기 버튼 클릭시 로그인 유무 알아오기
  // $("img#zipcodeSearch").click(function(){ }
  
  $('#checkLoginButton').on('click', function(e) {
    
    $.ajax({
      url:"/car/drivetryApply/drivingLounge.car",
      type:"get",
      success: function(response) {
        carNameOrigin = $("input#carName").val();
          if (!response.isLoggedIn) {
              // 로그인이 되어 있지 않으면 모달 창을 띄움
              e.preventDefault();
              $('#loginModal').modal('show');
          } else {
              // 로그인이 되어 있으면 원래 버튼의 기능을 수행
              goDrivingLounge(ctxPath,carNameOrigin);
          }
      },
      error: function() {
          console.error('Error checking login status');
      }
    });

    const isLoggedIn = getLoginStatus();

    if (!isLoggedIn) {
      // 로그인 안 한 경우
      e.preventDefault(); // 기존 동작 막기
      $('#LoginnoAccept').modal('show');
    }
    else{
      goDrivingLounge(ctxPath,carNameOrigin);
    }

  });// end of function checkLoginStatus()----------------------------


});// end of $(document).ready(function(){---------

let v_html = ``;

  // 실제 로그인 상태를 알아오는 함수
  //로그인을 안한 경우에만 모달 창을 띄우고,
  //로그인을 한 경우에는 버튼의 원래 기능을 유지하려면,
  //버튼의 클릭 이벤트 핸들러에서 로그인 상태를 확인하고,
  //로그인 상태에 따라 동작을 다르게 처리하면 됩니다.
  function getLoginStatus() {
    // if(userid == null){     // userid를 받아오는 방법 구현하기
    //   // 로그인 하지 않은 경우

    // }
    // else{
    //   // 로그인 한 경우

    // }
  }// end of function getLoginStatus()------------------------

  // 로그인이 되어있는 경우 드라이빙라운지로 이동하는 함수
  function goDrivingLounge(ctxPath,carNameOrigin){ 
    carNameOrigin = $("input#carName").val();
    // var carName = document.getElementById('carTitle').text;
    console.log("carName: " + carNameOrigin);

    location.href=`${ctxPath}/drivetryApply/drivingLoungeChoice.car?pk_carname=${carNameOrigin}`;
  }
////////////////////////////////////////////////////







// 차종 별로 리스트 보여주는 함수
function showCarList(carSearchType){

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
                          <div class="card"  style="height: 310px; width: 300px; padding : 0; margin : 3%;">
                            <div class="vehicle_title">
                              <div class= "vehicle_name">`
            if( item.Pk_CarName.length < 11){
              let carNameNew = item.Pk_CarName.split('_').join(' ');
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
        
       // console.log("~~~ 확인용 json => ", JSON.stringify(json));
       // alert("확인용 carSearchType : " + carSearchType);
       //  console.log("~~~~~~3"+carSearchType);
             
     
        
      },// end of success---------
        error: function(request, status, error){
        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }

    });// end of ajax---------
}


// swiper 세팅
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
}// end of function swiperset(){}------------------





// 메인의 차 보여주기
function showMain(mainCar, ctxPath){
//  console.log("category_main", mainCar)
  $.ajax({
      
    url:"/car/estimate/imgCardJSON.car",
    type:"get",
    data: {"mainCar" : mainCar },
    dataType : "json",
    success:function(json){ 
      let m_html = ``;
      if(json.length == 0) { // json== null하면 오류 남. 넘겨 받을 때 new 선언해서 받아서 빈 껍데기 배열이기 때문에 null이 아니고 길이가 0임.
        m_html = `현재 상품 준비중 입니다...`;
      }
      else{
        m_html ="";
        m_html += `<div class="car_select">
                    <div id="logo_image" > `;
        
        if(json.CarLogo != null){
          if(json.CarLogo == 'NEW'){
            m_html +=`<img src="../images/Estimate/new_50x24.png" />`
          }
          else if(json.CarLogo == 'EV'){
            m_html +=`<img src="../images/Estimate/ev_20x24.png" />`
          }
        }
        m_html += `</div> <div id="carTitle" style="font-size : 70px; line-height : 0.9; font-weight: lighter; font-stretch: condensed;">`;
        

        if( json.Pk_CarName.length < 11){
          const carNameOrigin = json.Pk_CarName
          let carNameNew = json.Pk_CarName.split('_').join('<br>');
          $("input#carName").val(carNameOrigin);
        
          m_html += `${carNameNew}`; // 차량 이름의 _대신 공백.
        }
        else{
          const carNameOrigin = json.Pk_CarName;
          let carname_arr = json.Pk_CarName.split('_', 1); // _을 기준으로 나눈 배열을 1개로 반환해라. (앞의 차 이름만 받아오기 위함)
          //console.log("차량~~", car[0]);
          let carNameNew = carname_arr[0];
          $("input#carName").val(carNameOrigin);
          m_html += `${carNameNew}`; // 차 이름
        }

        m_html += `</div><br><div class="main_carPoint"> `;

        if(json.CarPoint.length > 8){
          m_html += `${json.CarPoint.split('_').join(' ')}`; // CarPoint의 _대신 공백
        }

        m_html += `</div><br><div id="select_car">
        <button type="button" class="btn btn-carselect" onclick="goDrivingLounge('${ctxPath}','${json.Pk_CarName}')">차량선택</button>
      </div>
      </div>
      <div class="main_car_image">
      <img src="../images/Estimate/${json.Pk_CarName}.png" /></div>`;


      }// end of else ----------------------

      $("div.category_main").html(m_html);
      
    },// end of success---------
    error: function(request, status, error){
    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    }
  });// end of ajax---------


}

