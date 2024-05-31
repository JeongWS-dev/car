/**
 * 
 */

$(document).ready(function(){

    b_area_click = true;
    // "지역" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도 
  });	
 

function choiceArea(area){
  // alert(area)
  $("input[name='areachoicebtn']").val(area);
  
  $.ajax({
    url:"/drivetryApply/drivingLoungeChoiceJSON.car",
    data:{"area":area},
    //  ,"userid":$("input:hidden[name='userid']").val() // data 속성은 http://localhost:9090/MyMVC/member/emailDuplicateCheck.up 로 전송해야할 데이터를 말한다. 
    // type:"get",  //  type 을 생략하면 type:"get" 이다.
    
    // async:true,   // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
    //                  // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다.   
    
    dataType:"json", // Javascript Standard Object Notation.  dataType은 /MyMVC/member/emailDuplicateCheck.up 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
                    // 만약에 dataType:"xml" 으로 해주면 /MyMVC/member/emailDuplicateCheck.up 로 부터 받아오는 결과물은 xml 형식이어야 한다. 
                    // 만약에 dataType:"json" 으로 해주면 /MyMVC/member/emailDuplicateCheck.up 로 부터 받아오는 결과물은 json 형식이어야 한다. 

    success:function(json){
      let m_html = ``;
      console.log("확인용 area: " + area);
    },
    
    error: function(request, status, error){
      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    }
  });


}

