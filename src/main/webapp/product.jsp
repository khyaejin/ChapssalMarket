<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<html>
<head>
 <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
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
                <p><%= (product.getDescription() != null) ? product.getDescription() : "" %></p>
                <p><b>상품코드 :</b> <span class="badge bg-danger"><%=product.getProductId()%></span></p>                           
                <p><b>등록자 :</b> <%=product.getRegistrant()%></p>    
                <p><b>출판일 :</b> <%=product.getReleaseDate()%></p>                    
                <p><b>분류 :</b> <%=product.getCategory()%></p>
                <p><b>상태 :</b> <%=product.getConditions()%></p>
                <h4><%=product.getUnitPrice()%>원</h4>
                <%-- 장바구니에 추가하는 부분 --%>
                <%
                    // 장바구니에 추가할 상품을 request에 바로 저장합니다.
                    request.setAttribute("productToAddToCart", product);
                %>
				<a href="./addCart.jsp?id=<%=product.getProductId()%>" class="btn btn-warning" onclick="addToCart()"> 장바구니에 추가 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-primary" style="background-color: #ffc107; color: black; border-color: #ffc107;"> 장바구니로 이동 &raquo;</a>
                <a href="./products.jsp" class="btn btn-primary" style="background-color: ivory; color: black; border-color: transparent;"> 상품 목록 보기 &raquo;</a>
			</div>
        </div>
    <jsp:include page="footer.jsp" />
</div>
<script>
	function addToCart() {
		if(confirm('장바구니에 추가가 완료되었습니다.')) {
		}
	}
</script>
</body>
</html>
