/**
 * 
 */

$(document).ready(function(){
    // 오라클에 있는 데이터를 가져온다.
    showal(areaList);
});// end of $(document).ready(function(){})--------------------------


     //   e.preventDefault(); // 링크의 기본 동작을 막음
    // alert("ALL button clicked");
    //var carSearchType = $(e.target).text() // 차 종류를 가져옴
    function showal(){
    $.ajax({
        url:"/car/drivetryApply/drivingLoungeChoice.car",
        type:"get",
        data: {"driveLoungeType" : driveLoungeType },
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