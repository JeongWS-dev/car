<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<jsp:include page="support_Header.jsp"></jsp:include>

<style>
     body {
         font-family: Arial, sans-serif;
         margin: 0;
     }
     
     .container {
         display: flex;
         justify-content: left;
         align-items: center;
         height: 500px;
         background-image: url('<%= ctxPath%>/images/Support/F&Q_img.jpg'); 
         background-size: cover;
         background-position: center;
         color: white;
         margin: 0;
    	 padding: 0;
    	 max-width: 100%;
     }
     
     .faq {
         padding: 10%;
         text-align: center;
     }
     
     .faq-form {
	    max-width: 100%;
	    margin: 0 auto;
	    padding: 20px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    background-color: #f9f9f9;
	    text-align: center;
		}
		.accordion {
		  max-width: 600px;
		  margin: 0 auto;
		}
		
		.accordion-item {
		  border-bottom: 1px solid #ccc;
		}
		
		.accordion-item .accordion-title {
		  background-color: #f4f4f4;
		  padding: 10px;
		  cursor: pointer;
		}
		
		.accordion-item .accordion-content {
		  display: none;
		  padding: 10px;
		}

 </style>


<script type="text/javascript">
 $(document).ready(function(){
	 
 
	  const accordionItems = document.querySelectorAll(".accordion-item");

	  accordionItems.forEach(item => {
	    const title = item.querySelector(".accordion-title");
	    const content = item.querySelector(".accordion-content");

	    title.addEventListener("click", function() {
	      // 현재 아코디언 아이템이 열려있는지 체크
	      const isOpen = item.classList.contains("open");

	      // 모든 아코디언 아이템의 클래스 제거
	      accordionItems.forEach(item => {
	        item.classList.remove("open");
	        item.querySelector(".accordion-content").style.display = "none";
	      });

	      // 현재 아이템이 닫혀있으면 열고, 열려있으면 닫기
	      if (!isOpen) {
	        item.classList.add("open");
	        content.style.display = "block";
	      }
	    });
	  });
	});
 
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    
</head>
<body>
    <div class="container">
        <div class="faq">
            <h1>자주 묻는 질문</h1>
            <!-- 여기에 자주 묻는 질문 목록 및 내용을 추가하세요 -->
        </div>
    </div>
    <div class="faq-form">
	<h2>자주 묻는 질문</h2>
    <input type="text" id="faq-search" placeholder="검색">
    <div class="accordion">
  <!-- 여기에 FAQ 카테고리, 제목, 내용이 동적으로 들어갈 것입니다. -->
	</div>
    <!-- 추가 질문 및 답변은 위의 형식을 따라 계속해서 추가하세요 -->
</div>
    
</body>

<jsp:include page="support_Footer.jsp"></jsp:include>
