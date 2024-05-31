




$(document).ready(function(){

    const ctx = $("input.ctx").val();

    carMenu(ctx);
    

    $("a#cartype").click(function(){

        $('#carList').empty();
        const cartype1 = $(this).text().trim();
        //alert(cartype1);
        displayHIT(cartype1, ctx);
        
    });

});//제이쿼리


function carMenu(ctx){
    $.ajax({

        url:"indexControllerJSON.car",
        //type:"get",
        dataType:"json",  
        success:function(json){
            /*   
            console.log(json);
            console.log(typeof json); // object
            
            const str_json = JSON.stringify(json); // JSON 객체를 string 타입으로 변경시켜주는 것. 
            console.log(typeof str_json); // string
            console.log(str_json); 
            
            const obj_json = JSON.parse(str_json); // JSON 모양으로 되어진 string 을 실제 JSON 객체로 변경시켜주는 것. 
            console.log(typeof obj_json); // object
            console.log(obj_json);
            */
            /*
            json ==> 
            */
            let v_html=``;

            if(json.length > 0 ){
                // 데이터가 존재하는 경우

        
                /*   
                // 자바스크립트 사용하는 경우
                json.forEach(function(item, index, array){
                
                });
                */ 
                
                // jQuery 를 사용하는 경우
                $.each(json, function(index, item){
                    if((index+1)%3 == 1 || index == 0){
                        console.log(index);
                        v_html +=`<div style="display: inline-flex; width: 200%;">`;
                    };
                    v_html +=`<div style="margin-left: 0.8%; margin-top: 0.6%; ">
                                <div id="cartype" class="card" style="height: 100%; width: 21rem; background-color:#141414; border: solid 0px red;" >`;
                    
                    if(item.carpoint == 'ELECTRIFIED'){
                        v_html += `<h5 class="card-title" style="font-size: 16px; margin-top: -9%; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`;
                        v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -3%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                    };

                    if(item.carpoint != 'ELECTRIFIED' && item.carpoint != 'LONG_WHEEL_BASE' && item.carpoint != 'SHOOTING_BRAKE'){
                        v_html += `<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                    };

                    if(item.carpoint == 'LONG_WHEEL_BASE' || item.carpoint == 'SHOOTING_BRAKE'){
                        v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -10%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                        v_html += `<h5 class="card-title" style="margin-bottom: 7%; margin-top: -4%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`
                    };            
                    
                    v_html += `<img src="${ctx}/images/MainPage/our-models/${item.carfullname}.png" class="card-img-top" id="${item.carfullname}" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
                                    <div class="card-body" style="text-align: center; padding-bottom: 6%;">
                                        <a href="${ctx}/carDetail/carDetail.car?carname=${item.carfullname}" class="custom-button">자세히 보기</a>
                                    </div>
                                    <a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="${ctx}/createCar/powertrains.car?pk_carname=${item.carfullname}">견적 내기 ></a>
                                </div>
                                    
                            </div>`;

                    if((index+1)%3 == 0){
                        v_html +=`</div>`;
                    };
                });//end of $.each(json, function(index, item){}--------------
                
                //HIT상품 결과를 출력하기
                //어디에?
                $("div#carList").append(v_html);
                //html 덮어씌움 append 더하기 
                

            }//end of  else if(json.length > 0 ){}------------------
            
        },
        error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        }     
    });
}



function displayHIT(cartype1, ctx){
    

    if(cartype1 != 'BLACK' && cartype1 != 'ALL'){
        $.ajax({

            url:"indexControllerJSON.car",
            //type:"get",
            data:{"cartype":cartype1},  // 8    8    8     8     8
            dataType:"json",  
            success:function(json){
                /*   
                console.log(json);
                console.log(typeof json); // object
                
                const str_json = JSON.stringify(json); // JSON 객체를 string 타입으로 변경시켜주는 것. 
                console.log(typeof str_json); // string
                console.log(str_json); 
                
                const obj_json = JSON.parse(str_json); // JSON 모양으로 되어진 string 을 실제 JSON 객체로 변경시켜주는 것. 
                console.log(typeof obj_json); // object
                console.log(obj_json);
                */
                /*
                json ==> 
                */
                let v_html=``;

                if(json.length > 0 ){
                    // 데이터가 존재하는 경우

            
                    /*   
                    // 자바스크립트 사용하는 경우
                    json.forEach(function(item, index, array){
                    
                    });
                    */ 


                    if(cartype1 == "SEDAN"){
                        // jQuery 를 사용하는 경우
                        $.each(json, function(index, item){
                            if((index+1)%3 == 1 || index == 0){
                                console.log(index);
                                v_html +=`<div style="display: inline-flex; width: 200%;">`;
                            };
                            v_html +=`<div style="margin-left: 1.38%; margin-top: 1.05%; ">
                                        <div id="cartype" class="card" style="height: 100%; width: 21rem; background-color:#141414; border: solid 0px red;" >`;
                            
                            if(item.carpoint == 'ELECTRIFIED'){
                                v_html += `<h5 class="card-title" style="font-size: 16px; margin-top: -9%; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`;
                                v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -3%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                            };
        
                            if(item.carpoint != 'ELECTRIFIED' && item.carpoint != 'LONG_WHEEL_BASE' && item.carpoint != 'SHOOTING_BRAKE'){
                                v_html += `<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                            };
        
                            if(item.carpoint == 'LONG_WHEEL_BASE' || item.carpoint == 'SHOOTING_BRAKE'){
                                v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -10%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                                v_html += `<h5 class="card-title" style="margin-bottom: 7%; margin-top: -4%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`
                            };            
                            
                            v_html += `<img src="${ctx}/images/MainPage/our-models/${item.carfullname}.png" class="card-img-top" id="${item.carfullname}" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
                                            <div class="card-body" style="text-align: center; padding-bottom: 6%;">
                                                <a href="${ctx}/carDetail/carDetail.car?carname=${item.carfullname}" class="custom-button">자세히 보기</a>
                                            </div>
                                            <a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="${ctx}/createCar/powertrains.car?pk_carname=${item.carfullname}">견적 내기 ></a>
                                        </div>
                                            
                                    </div>`;
        
                            if((index+1)%3 == 0){
                                v_html +=`</div>`;
                            };
                        });//end of $.each(json, function(index, item){}--------------
                        
                        //HIT상품 결과를 출력하기
                        //어디에?
                        $("div#carList").append(v_html);
                        //html 덮어씌움 append 더하기 
                    }

                    if(cartype1 == "SUV"){
                        // jQuery 를 사용하는 경우
                        $.each(json, function(index, item){
                            if((index+1)%3 == 1 || index == 0){
                                console.log(index);
                                v_html +=`<div style="display: inline-flex; width: 200%;">`;
                            };
                            v_html +=`<div style="margin-left: 1.95%; margin-top: 1.45%; ">
                                        <div id="cartype" class="card" style="height: 100%; width: 21rem; background-color:#141414; border: solid 0px red;" >`;
                            
                            if(item.carpoint == 'ELECTRIFIED'){
                                v_html += `<h5 class="card-title" style="font-size: 16px; margin-top: -9%; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`;
                                v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -3%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                            };
        
                            if(item.carpoint != 'ELECTRIFIED' && item.carpoint != 'LONG_WHEEL_BASE' && item.carpoint != 'SHOOTING_BRAKE'){
                                v_html += `<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                            };
        
                            if(item.carpoint == 'LONG_WHEEL_BASE' || item.carpoint == 'SHOOTING_BRAKE'){
                                v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -10%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                                v_html += `<h5 class="card-title" style="margin-bottom: 7%; margin-top: -4%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`
                            };            
                            
                            v_html += `<img src="${ctx}/images/MainPage/our-models/${item.carfullname}.png" class="card-img-top" id="${item.carfullname}" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
                                            <div class="card-body" style="text-align: center; padding-bottom: 6%;">
                                                <a href="${ctx}/carDetail/carDetail.car?carname=${item.carfullname}" class="custom-button">자세히 보기</a>
                                            </div>
                                            <a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="${ctx}/createCar/powertrains.car?pk_carname=${item.carfullname}">견적 내기 ></a>
                                        </div>
                                            
                                    </div>`;
        
                            if((index+1)%3 == 0){
                                v_html +=`</div>`;
                            };
                        });//end of $.each(json, function(index, item){}--------------
                        
                        //HIT상품 결과를 출력하기
                        //어디에?
                        $("div#carList").append(v_html);
                        //html 덮어씌움 append 더하기 
                    }




                }//end of  else if(json.length > 0 ){}------------------
                


            },
            error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }     
        });
    }
    else{
        $.ajax({

            url:"indexControllerJSON.car",
            //type:"get",
            dataType:"json",  
            success:function(json){
                /*   
                console.log(json);
                console.log(typeof json); // object
                
                const str_json = JSON.stringify(json); // JSON 객체를 string 타입으로 변경시켜주는 것. 
                console.log(typeof str_json); // string
                console.log(str_json); 
                
                const obj_json = JSON.parse(str_json); // JSON 모양으로 되어진 string 을 실제 JSON 객체로 변경시켜주는 것. 
                console.log(typeof obj_json); // object
                console.log(obj_json);
                */
                /*
                json ==> 
                */
                let v_html=``;

                if(json.length > 0 ){
                    // 데이터가 존재하는 경우

            
                    /*   
                    // 자바스크립트 사용하는 경우
                    json.forEach(function(item, index, array){
                    
                    });
                    */ 


                    if(cartype1 == "ALL"){
                        // jQuery 를 사용하는 경우
                        $.each(json, function(index, item){
                            if((index+1)%3 == 1 || index == 0){
                                console.log(index);
                                v_html +=`<div style="display: inline-flex; width: 200%;">`;
                            };
                            v_html +=`<div style="margin-left: 0.8%; margin-top: 0.6%; ">
                                        <div id="cartype" class="card" style="height: 100%; width: 21rem; background-color:#141414; border: solid 0px red;" >`;
                            
                            if(item.carpoint == 'ELECTRIFIED'){
                                v_html += `<h5 class="card-title" style="font-size: 16px; margin-top: -9%; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`;
                                v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -3%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                            };
        
                            if(item.carpoint != 'ELECTRIFIED' && item.carpoint != 'LONG_WHEEL_BASE' && item.carpoint != 'SHOOTING_BRAKE'){
                                v_html += `<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                            };
        
                            if(item.carpoint == 'LONG_WHEEL_BASE' || item.carpoint == 'SHOOTING_BRAKE'){
                                v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -10%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                                v_html += `<h5 class="card-title" style="margin-bottom: 7%; margin-top: -4%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`
                            };            
                            
                            v_html += `<img src="${ctx}/images/MainPage/our-models/${item.carfullname}.png" class="card-img-top" id="${item.carfullname}" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
                                            <div class="card-body" style="text-align: center; padding-bottom: 6%;">
                                                <a href="${ctx}/carDetail/carDetail.car?carname=${item.carfullname}" class="custom-button">자세히 보기</a>
                                            </div>
                                            <a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="${ctx}/createCar/powertrains.car?pk_carname=${item.carfullname}">견적 내기 ></a>
                                        </div>
                                            
                                    </div>`;
        
                            if((index+1)%3 == 0){
                                v_html +=`</div>`;
                            };
                        });//end of $.each(json, function(index, item){}--------------
                        
                        //HIT상품 결과를 출력하기
                        //어디에?
                        $("div#carList").append(v_html);
                        //html 덮어씌움 append 더하기 
                    }

                    if(cartype1 == "BLACK"){
                        // jQuery 를 사용하는 경우
                        
                        $.each(json, function(index, item){
                            if(item.carpoint == 'BLACK'){
                                if((index+1)%3 == 1 || index == 0){
                                    console.log(index);
                                    v_html +=`<div style="display: inline-flex; width: 200%;">`;
                                };
                                v_html +=`<div style="margin-left: 9.47%; margin-top: 7.45%; ">
                                            <div id="cartype" class="card" style="height: 100%; width: 21rem; background-color:#141414; border: solid 0px red;" >`;
                                
                                if(item.carpoint == 'ELECTRIFIED'){
                                    v_html += `<h5 class="card-title" style="font-size: 16px; margin-top: -9%; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`;
                                    v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -3%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                                };
            
                                if(item.carpoint != 'ELECTRIFIED' && item.carpoint != 'LONG_WHEEL_BASE' && item.carpoint != 'SHOOTING_BRAKE'){
                                    v_html += `<h5 class="card-title" style="font-size: 28px; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                                };
            
                                if(item.carpoint == 'LONG_WHEEL_BASE' || item.carpoint == 'SHOOTING_BRAKE'){
                                    v_html += `<h5 class="card-title" style="font-size: 28px; margin-top: -10%; font-weight: 300; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;${item.carname}</h5>`;
                                    v_html += `<h5 class="card-title" style="margin-bottom: 7%; margin-top: -4%; font-size: 16px; font-weight: 400; color: #bfbfbf; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.carpoint}</h5>`
                                };            
                                
                                v_html += `<img src="${ctx}/images/MainPage/our-models/${item.carfullname}.png" class="card-img-top" id="${item.carfullname}" style="width: 90%; margin-left: 5%; margin-top: 10%;" />
                                                <div class="card-body" style="text-align: center; padding-bottom: 6%;">
                                                    <a href="${ctx}/carDetail/carDetail.car?carname=${item.carfullname}" class="custom-button">자세히 보기</a>
                                                </div>
                                                <a id="geon" style="font-size: 15px; font-weight: 500; margin-left: 7.5%;" href="${ctx}/createCar/powertrains.car?pk_carname=${item.carfullname}">견적 내기 ></a>
                                            </div>
                                                
                                        </div>`;
            
                                if((index+1)%3 == 0){
                                    v_html +=`</div>`;
                                };
                            }
                        });//end of $.each(json, function(index, item){}--------------
                        
                        //HIT상품 결과를 출력하기
                        //어디에?
                        $("div#carList").append(v_html);
                        //html 덮어씌움 append 더하기 
                    }




                }//end of  else if(json.length > 0 ){}------------------
                


            },
            error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }     
        });
    }   

}
