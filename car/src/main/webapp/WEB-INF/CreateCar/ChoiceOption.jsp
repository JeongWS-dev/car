
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
<meta charset="UTF-8">
<title>GENESIS</title>

<!-- bootstrap -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/createCar/ChoiceOption.css">

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<%-- JQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />

<!-- 내가만든 js -->
<script type = "text/javascript">
	$(document).ready(function(){
		let carname = $("input[name='sessionCarName']").val();
		$("span.model-name").text(carname.split("_").join(" "));
		$("div.MainImg").hide();
		$("div.ctxPath").hide();
		$("div.option_code").hide();
		$("div.option_defualt_desc").hide();
		$("div.ischoice").hide();

		$(".btn").click(function(e){
			if($(e.target).is("i.check_option")){
				
				if($(e.target).parent().find("input[name='ischecked']").val() == 0){
					$(e.target).parent().find("input[name='ischecked']").val("1");
					$(e.target).parent().find("div.ischoice").text("1");

					let ischecked = $(e.target).parent().find("input[name='ischecked']").val();
					$(e.target).css({"background-color":"rgba(0,0,0,0)","color":"white"});

					const MainImg = $(e.target).parent().find("div.MainImg").text();
					const ctxPath = $(e.target).parent().find("div.ctxPath").text();
					const option_title = $(e.target).parent().find("div.option_title").text();
					// alert(option_title);
					let option_price = $(e.target).parent().find("div.option_price").text();
					option_price = option_price.split(",").join("");
					option_price = option_price.substring(1,option_price.indexOf("원"))
					// console.log(option_price);
					let total_price = $("div.total_price").text().split(",").join("");
					total_price = total_price.substring(0,total_price.indexOf("원"));
					// alert(total_price);
					const choice_option_code = $(e.target).parent().find("div.option_code").text();
					// alert(choice_option_code);
					const option_defualt_desc = $(e.target).parent().find("div.option_defualt_desc").text();
					let v_html = ``;
					$.ajax({
							url : "${pageContext.request.contextPath}/createCar/choiceOptionJSON.car",
							type : "post",
							data : {"choice_option_title":choice_option_code},
							dataType:"json",
							success:function(json){
								if(json.length == 0) {
									// 데이터가 존재하는 경우
									v_html = `<ul>`;
									v_html += `<li style ="color:white;">\${option_title}</li>`;
									v_html += `</ul>`;
									// HIT상품 결과를 출력하기
									$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
									change_Main_price(json,MainImg,ctxPath,total_price,option_price,option_title,option_defualt_desc,ischecked);
								}
								else if(json.length > 0){
									// 데이터가 존재하는 경우
									v_html = `<ul>`;
									$.each(json, function(index, item){
										v_html += `<li style ="color:white;">\${item.optionname}</li>`;
									});// end of $.each(json, function(index, item){
									v_html += `</ul>`;
									// HIT상품 결과를 출력하기
									$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
									change_Main_price(json,MainImg,ctxPath,total_price,option_price,option_title,option_defualt_desc,ischecked);
									
								}// end of else if(start == "1" && json.length > 0)
							},
							error: function(request, status, error){
							alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
							}
					})
					
				}
				else{
					$(e.target).parent().find("input[name='ischecked']").val("0");
					$(e.target).parent().find("div.ischoice").text("0");

					let ischecked = $(e.target).parent().find("input[name='ischecked']").val();
					$(e.target).css({"background-color":"white","color":"black"});

					const MainImg = $(e.target).parent().find("div.MainImg").text();
					const ctxPath = $(e.target).parent().find("div.ctxPath").text();
					const option_title = $(e.target).parent().find("div.option_title").text();
					// alert(option_title);
					let option_price = $(e.target).parent().find("div.option_price").text();
					option_price = option_price.split(",").join("");
					option_price = option_price.substring(1,option_price.indexOf("원"))
					//console.log(option_price);

					let total_price = $("div.total_price").text().split(",").join("");
					total_price = total_price.substring(0,total_price.indexOf("원"));

					const choice_option_code = $(e.target).parent().find("div.option_code").text();
					// alert(choice_option_code);
					const option_defualt_desc = $(e.target).parent().find("div.option_defualt_desc").text();
					let v_html = ``;
					$.ajax({
							url : "${pageContext.request.contextPath}/createCar/choiceOptionJSON.car",
							type : "post",
							data : {"choice_option_title":choice_option_code},
							dataType:"json",
							success:function(json){
								if(json.length == 0) {
									// 데이터가 존재하는 경우
									v_html = `<ul>`;
									v_html += `<li style ="color:white;">\${option_title}</li>`;
									v_html += `</ul>`;
									// HIT상품 결과를 출력하기
									$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
									change_Main_price(json,MainImg,ctxPath,total_price,option_price,option_title,option_defualt_desc,ischecked);
								}
								else if(json.length > 0){
									// 데이터가 존재하는 경우
									v_html = `<ul>`;
									$.each(json, function(index, item){
										v_html += `<li style ="color:white;">\${item.optionname}</li>`;
									});// end of $.each(json, function(index, item){
									v_html += `</ul>`;
									// HIT상품 결과를 출력하기
									$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
									change_Main_price(json,MainImg,ctxPath,total_price,option_price,option_title,option_defualt_desc,ischecked);
									
								}// end of else if(start == "1" && json.length > 0)
							},
							error: function(request, status, error){
							alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
							}
					})
				}
			}
			else if($(e.target).is("div.option_title")){
				
				$(".choice_option").css({"opacity":"0.3", "border":""});
				$(e.target).parent().parent().css({"opacity":"1.0"});

				const MainImg = $(e.target).parent().find("div.MainImg").text();
				const ctxPath = $(e.target).parent().find("div.ctxPath").text();
				const choice_option_code = $(e.target).parent().find("div.option_code").text();
				const option_title = $(e.target).parent().find("div.option_title").text();
				const option_defualt_desc = $(e.target).parent().find("div.option_defualt_desc").text();
				let v_html = ``;
				$.ajax({
		                url : "${pageContext.request.contextPath}/createCar/choiceOptionJSON.car",
		                type : "post",
		                data : {"choice_option_title":choice_option_code},
		                dataType:"json",
		                success:function(json){
							if(json.length == 0) {
								// 데이터가 존재하는 경우
								v_html = `<ul>`;
								v_html += `<li style ="color:white;">\${option_title}</li>`;
								v_html += `</ul>`;
								// HIT상품 결과를 출력하기
								$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
								change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc);
							}
							else if(json.length > 0){
								// 데이터가 존재하는 경우
								v_html = `<ul>`;
								$.each(json, function(index, item){
									v_html += `<li style ="color:white;">\${item.optionname}</li>`;
								});// end of $.each(json, function(index, item){
								v_html += `</ul>`;
								// HIT상품 결과를 출력하기
								$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
								change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc);
							    
							}// end of else if(start == "1" && json.length > 0)
		                },
		                error: function(request, status, error){
		                   alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
		                }
				})
			}
			else if ($(e.target).is("div.option_price")){
				$(".choice_option").css({"opacity":"0.3", "border":""});
				$(e.target).parent().parent().css({"opacity":"1.0"});

				const MainImg = $(e.target).parent().find("div.MainImg").text();
				const ctxPath = $(e.target).parent().find("div.ctxPath").text();
				const choice_option_code = $(e.target).parent().find("div.option_code").text();
				const option_title = $(e.target).parent().find("div.option_title").text();
				const option_defualt_desc = $(e.target).parent().find("div.option_defualt_desc").text();
				let v_html = ``;
				$.ajax({
		                url : "${pageContext.request.contextPath}/createCar/choiceOptionJSON.car",
		                type : "post",
		                data : {"choice_option_title":choice_option_code},
		                dataType:"json",
		                success:function(json){
							if(json.length == 0) {
								// 데이터가 존재하는 경우
								v_html = `<ul>`;
								v_html += `<li style ="color:white;">\${option_title}</li>`;
								v_html += `</ul>`;
								// HIT상품 결과를 출력하기
								$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
								change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc);
							}
							else if(json.length > 0){
								// 데이터가 존재하는 경우
								v_html = `<ul>`;
								$.each(json, function(index, item){
									v_html += `<li style ="color:white;">\${item.optionname}</li>`;
								});// end of $.each(json, function(index, item){
								v_html += `</ul>`;
								// HIT상품 결과를 출력하기
								$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
								change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc);
							    
							}// end of else if(start == "1" && json.length > 0)
		                },
		                error: function(request, status, error){
		                   alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
		                }
				})
			}
			else {
				$("div.choice_option").css({"opacity":"0.3"});
				$(e.target).css({"opacity":"1.0"});
				const MainImg = $(e.target).find("div.MainImg").text();
				const ctxPath = $(e.target).find("div.ctxPath").text();
				const choice_option_code = $(e.target).find("div.option_code").text();
				const option_title = $(e.target).find("div.option_title").text();
				const option_defualt_desc = $(e.target).find("div.option_defualt_desc").text();
				let v_html = ``;
				$.ajax({
		                url : "${pageContext.request.contextPath}/createCar/choiceOptionJSON.car",
		                type : "post",
		                data : {"choice_option_title":choice_option_code},
		                dataType:"json",
		                success:function(json){
							if(json.length == 0) {
								// 데이터가 존재하는 경우
								v_html = `<ul>`;
								v_html += `<li style ="color:white;">\${option_title}</li>`;
								v_html += `</ul>`;
								// HIT상품 결과를 출력하기
								$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
								change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc);
							}
							else if(json.length > 0){
								// 데이터가 존재하는 경우
								v_html = `<ul>`;
								$.each(json, function(index, item){
									v_html += `<li style ="color:white;">\${item.optionname}</li>`;
								});// end of $.each(json, function(index, item){
								v_html += `</ul>`;
								// HIT상품 결과를 출력하기
								$(e.target).parent().parent().parent().parent().parent().find("div.detail_choice_option").html(v_html);
								change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc);
							    
							}// end of else if(start == "1" && json.length > 0)
		                },
		                error: function(request, status, error){
		                   alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
		                }
				})
		    }
		});// end of $(".btn").click(function(e){

		$("li.inner_main_option_detail").click(function(e){
			const cilck_detail_option = $(e.target).text();
			click_option_detail(cilck_detail_option);
		})// end of $("li.inner_main_option_detail").click(function(e){
	})// end of $(document).ready(function(){
		
	function change_Main_price(json,MainImg,ctxPath,total_price,option_price,option_title,option_defualt_desc,ischecked){
		if(json.length==0){
			let html = `<ul id="MainInnerUl">`;
			html += `<li class="inner_main_option_detail" style = "color:white;" onclick="click_option_detail('\${option_title}')">\${option_title}</li>`;
			html += `</ul>`;
			html += `<img name="MainImg" src="\${ctxPath}/images/createCar/choiceoption/\${MainImg}"/>`;
			$("div.option_main_flex").html(html);
			let span = "<span>"+option_defualt_desc+"</span>";
			$("div.option_main_detail_desc").html(span);
			let add_total_price = 0;
			if(ischecked == "1"){
				add_total_price = Number(total_price) + Number(option_price);
				// alert(add_total_price);
			}
			else{
				add_total_price = Number(total_price) - Number(option_price);
				total_price = Number(total_price) - Number(option_price*2);
				// alert(add_total_price)
			}
			$("input[name='add_total_price']").val(add_total_price.toLocaleString('en')+"원");
			const handle = setInterval(() => {
				$("div.total_price").html(Math.ceil(add_total_price-total_price).toLocaleString('en')+"원");

				// 목표에 도달하면 정지
				if (total_price < 1) {
					clearInterval(handle);
				}

				// 적용될 수치, 점점 줄어듬
				const step = total_price / 2;

				total_price -= step;
			}, 30);

			$("input[name='option_title']").val(option_title);
		}
		else{
			let html = `<ul id="MainInnerUl">`;
			$.each(json,function(index,item){
				html += `<li class="inner_main_option_detail" style = "color:white;" onclick="click_option_detail('\${item.optionname}')">\${item.optionname}</li>`;
			})
			html += `</ul>`;
			html += `<img name="MainImg" src="\${ctxPath}/images/createCar/choiceoption/\${MainImg}"/>`;
			$("div.option_main_flex").html(html);
			let span = "<span>"+option_defualt_desc+"</span>";
			$("div.option_main_detail_desc").html(span);
			let add_total_price = 0;
			if(ischecked == "1"){
				add_total_price = Number(total_price) + Number(option_price);
				// alert(add_total_price);
			}
			else{
				add_total_price = Number(total_price) - Number(option_price);
				total_price = Number(total_price) - Number(option_price*2);
				// alert(add_total_price)
			}
			$("input[name='add_total_price']").val(add_total_price.toLocaleString('en')+"원");
			const handle = setInterval(() => {
				$("div.total_price").html(Math.ceil(add_total_price-total_price).toLocaleString('en')+"원");

				// 목표에 도달하면 정지
				if (total_price < 1) {
					clearInterval(handle);
				}

				// 적용될 수치, 점점 줄어듬
				const step = total_price / 2;

				total_price -= step;
			}, 30);

			$("input[name='option_title']").val(option_title);
		}
	}

	function change_Main(json,MainImg,ctxPath,option_title,option_defualt_desc){
		if(json.length==0){
			let html = `<ul id="MainInnerUl">`;
			html += `<li class="inner_main_option_detail" style = "color:white;" onclick="click_option_detail('\${option_title}')">\${option_title}</li>`;
			html += `</ul>`;
			html += `<img name="MainImg" src="\${ctxPath}/images/createCar/choiceoption/\${MainImg}"/>`;
			$("div.option_main_flex").html(html);
			let span = "<span>"+option_defualt_desc+"</span>";
			$("div.option_main_detail_desc").html(span);
		}
		else{
			let html = `<ul id="MainInnerUl">`;
			$.each(json,function(index,item){
				html += `<li class="inner_main_option_detail" style = "color:white;" onclick="click_option_detail('\${item.optionname}')">\${item.optionname}</li>`;
			})
			html += `</ul>`;
			html += `<img name="MainImg" src="\${ctxPath}/images/createCar/choiceoption/\${MainImg}"/>`;
			$("div.option_main_flex").html(html);
			let span = "<span>"+option_defualt_desc+"</span>";
			$("div.option_main_detail_desc").html(span);
		}
	}// end of function change_Main(MainImg,ctxPath,total_price,option_price){

	function click_option_detail(cilck_detail_option){
		$.ajax({
				url : "${pageContext.request.contextPath}/createCar/choiceDetailOptionJSON.car",
				type : "post",
				data : {"cilck_detail_option":cilck_detail_option},
				dataType:"json",
				success:function(json){
					$.each(json,function(index,item){
						$("div.option_main_detail_desc").html(item.optiondesc);
						$("img[name='MainImg']").attr({src:`${pageContext.request.contextPath}/images/createCar/choiceoption/\${item.optionimg}`});
					})
				},
				error: function(request, status, error){
					alert("첨부된 파일의 크기의 총합이 20MB 를 초과하여 제품등록이 실패했습니다.ㅜㅜ");
				}
		})
	}// end of function click_option_detail(cilck_detail_option){

	function goNext(){
		
		let option_title = "";
		$("div.ischoice").each(function(index,item,elmt){
			if(Number($(item).text())==1){
				option_title += $(item).parent().find("div.option_title").text() + "!";
			}
		});

		$("input[name='option_title']").val(option_title);

		const frm = document.powertrainChoiceFrm;
		frm.action = "completeCreateCar.car";
		frm.method = "post";
		frm.submit();
	}// end of function goNext(){
	function exit(){
		location.href="\<%= ctxPath%>/index.car";
	}
</script>

<body>
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top top">
			<div style="width:auto; margin-right: 20px;">
				<div style="color:rgb(151, 151, 151);">GENESIS</div>
				<span class="model-name"></span>
				<input name="sessionCarName" type="hidden" value="${sessionScope.cvo.carName}"/>
			</div>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"> 
					<a class="nav-link">엔진 타입</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link">외장 컬러</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link">내장 디자인&컬러</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link" style="color:white; font-weight:bold;">선택 품목</a>
				</li>
				<span>〉</span>
				<li class="nav-item">
					<a class="nav-link">견적완료</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#exit_modal" data-dismiss="modal"><i class="fa-solid fa-xmark"></i></a>
				</li>
			</ul>
		</nav>
		<div style="margin-top:70px;"></div>

	<div class="body">
		<div class = "optionMain">
			<c:if test="${not empty requestScope.mapList}">
				<c:forEach var="paraMap" items="${requestScope.mapList}" begin="0" end="0">
					<div class="option_main_flex">
						<ul id="MainInnerUl">
							<li class = "inner_main_option_detail" style="color:white; opacity:1.0;">${paraMap.optiondesc}</li>
						</ul>
						<img name="MainImg" src="<%=ctxPath%>/images/createCar/choiceoption/${paraMap.get('option_img')}"/>
					</div>
					<div class="option_main_detail_desc"><sapn>${paraMap.optiondetaildesc}</sapn></div>
				</c:forEach>
			</c:if>
		</div>
		<div class="gap"></div>
		<div class="tab">
			<div class = "outColor">4. 선택 품목</div>
			<div class = "scrollbar" style="overflow: auto; height:430px;">
				<c:if test="${not empty requestScope.mapList}">
					<c:forEach var = "paraMap" items="${requestScope.mapList}">
							<div class= "choice_option_inner accordion" id="accordionExample">
								<div class="accordion" id="accordionExample">
									<div class="card" style = "background-color: rgba(0,0,0,0);">
										<div class="card-header" id="headingOne">
											<h2 class="mb-0">
											  	<button class="btn" type="button" data-toggle="collapse" data-target="#${paraMap.pk_optioncode}" aria-expanded="true" aria-controls="collapseOne">
													<i class="fa-solid fa-circle-check fa-2x check_option"></i>
													<div class = "option_title" style="color:white;">${paraMap.optiondesc}</div>
													<div class = "option_price" style="color:white;" value="${paraMap.get('optionprice')}">+${paraMap.optionprice}원</div>
													<div class = "MainImg">${paraMap.option_img}</div>
													<div class = "ctxPath"><%=ctxPath%></div>
													<div class = "option_code" style="color:white">${paraMap.pk_optioncode}</div>
													<div class = "option_defualt_desc" style="color:white">${paraMap.optiondetaildesc}</div>
													<input name="ischecked" type="hidden" value="0"/>
													<div class = "ischoice">0</div>
												</button>
											</h2>
										</div>
										<div id="${paraMap.pk_optioncode}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
											<!-- .collapse show 는 맨 처음에는  내용물을 보여주도록 하는 것임. -->
											<div class="card-body detail_choice_option">
											  
											</div>
										</div>
									</div>
								</div>
							</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="price">
				<div style="color:rgb(150, 150, 150)">예상 가격</div>
				<div class="total_price">${requestScope.Price}</div> <%-- 금액 변경하는거 어쩌면 for문으로 가능할지도? --%>
				<button class="before" onclick="history.back()">이전</button>
				<button class="after"  onclick="goNext()">다음</button>
			</div>
		</div>
		<form name="powertrainChoiceFrm">
			<input name="option_title" type="hidden" value=""/>
			<input name="add_total_price" type="hidden" value="${requestScope.Price}"/>
		</form>
	</div>

	<div class="modal fade" id="exit_modal"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
		<div class="modal-dialog modal-lg">
		  <div class="modal-content">
		  
			<!-- Modal header -->
			<div class="modal-header" style="background-color: black;">
			  <h4 class="modal-title" style="color:white;">EXIT</h4>
			  <button type="button" class="close idFindClose" data-dismiss="modal" style="color:white;">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body" id="add_image_modal-body" style="text-align: center; margin-top: 50px;">
				<div style="margin:auto; font-size: 20pt;">내 차 만들기를 종료하시겠습니까?</div>

				<input type="button" class="exit" onclick="exit()" value="예"/>
				<input type="button" class="cancle" value="아니오" data-dismiss="modal"/>
			</div>
		  </div>
		  
		</div>
	  </div>
</body>
