
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
    slidesOffsetAfter:20,
    slidesOffsetBefore:20,
        freeModeSticky: false,
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
