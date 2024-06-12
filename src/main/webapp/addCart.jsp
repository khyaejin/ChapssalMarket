<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
    // 상품 ID를 파라미터로 받아옴
    String id = request.getParameter("id");
    
    // ID가 없는 경우 상품 목록 페이지로 리다이렉트
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }

    // ProductRepository 인스턴스 생성
    ProductRepository dao = ProductRepository.getInstance();

    // 상품 ID로 해당 상품 정보 가져오기
    Product product = dao.getProductById(id);
    
    // 상품이 존재하지 않는 경우 예외 처리 페이지로 리다이렉트
    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
        return;
    }

    // 세션에서 장바구니 목록 가져오기
    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    
    // 장바구니가 비어있으면 새로운 ArrayList 생성
    if (cartList == null) { 
        cartList = new ArrayList<Product>();
        session.setAttribute("cartlist", cartList);
    }

    // 장바구니에 추가할 상품이 이미 있는지 확인
    boolean alreadyInCart = false;
    for (Product cartProduct : cartList) {
        if (cartProduct.getProductId().equals(id)) {
            // 이미 장바구니에 있는 경우 수량 증가
            cartProduct.setQuantity(cartProduct.getQuantity() + 1);
            alreadyInCart = true;
            break;
        }
    }

    // 장바구니에 추가할 상품이 없는 경우 새로 추가
    if (!alreadyInCart) { 
        Product newProduct = new Product(product.getProductId(), product.getName(), product.getUnitPrice());
        newProduct.setQuantity(1);
        cartList.add(newProduct);
    }

    // 장바구니에 상품 추가 후 상품 정보 페이지로 리다이렉트
    response.sendRedirect("product.jsp?id=" + id);
%>
