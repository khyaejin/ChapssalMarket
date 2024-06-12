<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
    String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>

<div class="container py-4">
   <%@ include file="menu.jsp"%>   

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">장바구니</h1>
        <p class="col-md-8 fs-4">Cart</p>      
      </div>
    </div>
    
     <div class="row align-items-md-stretch ">      
        <div class="row">
            <table width="100%">
                <tr>
                    <td align="left"><a href="./removeCart.jsp" class="btn btn-danger">전체 삭제</a></td>
                    <td align="right"><a href="#" class="btn btn-success" onclick="order()">주문하기</a></td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                </tr>
                <%              
                    int sum = 0;
                    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
                    if (cartList == null)
                        cartList = new ArrayList<Product>();

                    for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
                        Product product = cartList.get(i);
                        int total = product.getUnitPrice() * product.getQuantity();
                        sum = sum + total;
                %>
                <tr>
                    <td><%=product.getProductId()%> - <%=product.getName()%></td>
                    <td><%=product.getUnitPrice()%></td>
                    <td><%=product.getQuantity()%></td>
                    <td><%=total%></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%=sum%></th>
                </tr>
            </table>
            <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</div>

<script>
    function order() {
        // 주문 처리 로직을 여기에 추가하세요.
        alert("주문이 완료되었습니다.");
        // 주문이 완료되면 장바구니 비우기
        window.location.href = "./removeCart.jsp";
    }
</script>

</body>
</html>
