
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
   

    $("a.tab-btn").click(function(){
        // 바에 있는 버튼 클릭 했을 때
        e.preventDefault(); // 링크의 기본 동작을 막음

        var cartype = $(this).text() // 차 종류를 가져옴

        $.ajax({
            url:`estimate_all.up`,
            type:"get",
            data: {"cartype" : cartype},
                 dataType:"json",
                 success:function(json){ 
                  // json 은 {"group_id":"R2GWPBT7UoW308sI","success_count":1,"error_count":0} 처럼 된다. 
                
                  if(json.success_count == 1) {
                  $("div#smsResult").html("<span style='color:red; font-weight:bold;'>문자전송이 성공되었습니다.^^</span>");
                }
                else if(json.error_count != 0) {
                   $("div#smsResult").html("<span style='color:red; font-weight:bold;'>문자전송이 실패되었습니다.ㅜㅜ</span>");
                }
                
                $("div#smsResult").show();
                $("textarea#smsContent").val("")
             },
             error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
        });

    });
});

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




/*

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

