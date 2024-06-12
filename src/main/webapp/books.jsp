﻿<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<html>
<head>
 <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

<title>상품 목록</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품목록</h1>
        <p class="col-md-8 fs-4">ProductList</p>      
      </div>
    </div>
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>   
	   
	 <div class="row align-items-md-stretch text-center">	 	
	 <%
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
	  %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">	
       			<img src="./resources/images/<%=product.getFilename()%>" style="width: 250px; height:350px" />		
				<h5><b><%=product.getName()%></b></h5>
				<p><%=product.getAuthor()%>
				<br> <%=product.getPublisher()%> | <%=product.getUnitPrice()%>원
				<p> <%=product.getDescription().substring(0,60)%>...
				<p><%=product.getUnitPrice()%>원
				<p><a href="./Product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>	
		</div>			
		<%
			}
		%>	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>