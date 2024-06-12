<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>상품 정보</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품정보</h1>
        <p class="col-md-8 fs-4">Product Info</p>      
      </div>
    </div>
	
	<%
		String id = request.getParameter("id");
	    ProductRepository dao = ProductRepository.getInstance();
	    Product product = dao.getProductById(id);
	%>
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="./resources/images/<%=product.getFilename()%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=product.getName()%></b></h3>
				<p><%=product.getDescription()%>
				<p><b>상품코드 : </b><span class="badge text-bg-danger"> <%=product.getProductId()%></span>							
				<p><b>저자</b> : <%=product.getAuthor()%>	
				<p><b>출판사</b> : <%=product.getPublisher()%>	
				<p><b>출판일</b> : <%=product.getReleaseDate()%>					
				<p><b>분류</b> : <%=product.getCategory()%>
				<p><b>재고수</b> : <%=product.getUnitsInStock()%>
				<h4><%=product.getUnitPrice()%>원</h4>
				<p><a href="#" class="btn btn-info"> 상품주문 &raquo;</a> 
					<a href="./products.jsp" class="btn btn-secondary"> 상품목록 &raquo;</a>
			</div>
		</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
