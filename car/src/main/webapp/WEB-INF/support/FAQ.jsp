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
    <title>���� ���� ����</title>
    
</head>
<body>
    <div class="container">
        <div class="faq">
            <h1>���� ���� ����</h1>
            <!-- ���⿡ ���� ���� ���� ��� �� ������ �߰��ϼ��� -->
        </div>
    </div>
    <div class="faq-form">
	<h2>���� ���� ����</h2>
    <input type="text" id="faq-search" placeholder="�˻�">
   
   <div class="accordion">
  <div class="accordion-item">
    <div class="accordion-title">���� 1</div>
    <div class="accordion-content">
      �亯 1�� ������ ���⿡ ���ϴ�.
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-title">���� 2</div>
    <div class="accordion-content">
      �亯 2�� ������ ���⿡ ���ϴ�.
    </div>
  </div>
  <!-- �ʿ��� ��ŭ �׸��� �߰��ϼ��� -->
</div>
   
</div>

<script>
    const faqs = document.querySelectorAll('.js-faq_block');
    faqs.forEach(faq => { new FAQ(faq); });
</script>

</div>
    
</body>

<jsp:include page="support_Footer.jsp"></jsp:include>
