
$(document).ready(function(){

    $("a#cartype").click(function(){
        //alert($(this).text().trim());
        goCarType($(this).text().trim());
        
    });

});


// === 차종으로 분류하여 이미지 나타내기 === //
function goCarType(text){

    if(text == "SUV"){
        //alert(text);
        $("div#SEDAN").hide(); 
        $("div#SUV").show();
    }

    if(text == "SEDAN"){
        //alert(text);
        $("div#SUV").hide(); 
        $("div#SEDAN").show();
    }

    if(text == "ALL"){
        //alert(text);
        $("div#SEDAN").show();
        $("div#SUV").show();
    }

    if(text == "BLACK") {
        //alert(text);
        $("div#SEDAN").hide();
        $("div#SUV").hide();

        if($("#G90_BLACK").length > 0) {
            $("#G90_BLACK").parent("div").show(); // 이미지 태그가 속한 부모 div를 보여줌
        }
    }

}