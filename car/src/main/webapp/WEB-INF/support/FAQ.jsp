<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
	    
		}
	
	#faq-top{
		width: 50%;
		margin: 1% auto;
	}
		
		.accordion-item {
		  border-bottom: 1px solid #ccc;
		}
		
		.accordion-title {
		  background-color: #f4f4f4;
		  padding: 10px;
		  cursor: pointer;
		}
		
		.accordion-content {
		  display: none;
		  padding: 10px;
		}

	.accordion-item{
		width: 50%;
		margin: 1% auto;
	}
 </style>


<script type="text/javascript">
 $(document).ready(function(){
	 
	 const accordionTitles = document.querySelectorAll(".accordion-title");

	  accordionTitles.forEach(title => {
	    title.addEventListener("click", function() {
	      const content = this.nextElementSibling;
	      if (content.style.display === "block") {
	        content.style.display = "none";
	      } else {
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
		<div id=faq-top>
		<h2>자주 묻는 질문</h2>
	    <input type="text" id="faq-search" placeholder="검색어를 입력해주세요." style="border-top: none; border-right: none; border-left: none; margin-top: 1%;"/>
	    <button type="submit" class="ico-search" data-ex-linkage="getSearch" title="검색">
		<span class="blind">검색</span></button>
	    </div>
	    <br><br>
	
 	 <c:if test="${empty requestScope.FAQList}">
 	
      <span style="color: red; font-weight: bold;">등록된 내용이 없습니다.</span>
   </c:if>

   <c:if test="${not empty requestScope.FAQList}">
      <c:forEach var="faqvo" items="${requestScope.FAQList}" varStatus="status">
      
         <div class="accordion-item">
            <div class="accordion-title">${faqvo.faqtitle}</div>
            <div class="accordion-content">
               ${faqvo.faqcontent}
            </div>
         </div>
      </c:forEach>
   </c:if>
</div>

</body>

<jsp:include page="support_Footer.jsp"></jsp:include>
