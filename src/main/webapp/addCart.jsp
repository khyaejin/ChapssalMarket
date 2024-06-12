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

    // 전체 상품 목록 가져오기
    ArrayList<Product> goodsList = dao.getAllProducts();
    
    // 장바구니에 추가할 상품
    Product goods = new Product();
    
    // 해당 ID와 일치하는 상품 찾기
    for (int i = 0; i < goodsList.size(); i++) {
        goods = goodsList.get(i);
        if (goods.getProductId().equals(id)) { 			
            break;
        }
    }
    
    // 세션에서 장바구니 목록 가져오기
    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    
    // 장바구니가 비어있으면 새로운 ArrayList 생성
    if (list == null) { 
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }

    int cnt = 0;
    Product goodsQnt = new Product();
    // 이미 장바구니에 해당 상품이 있는지 확인하고 수량 증가
    for (int i = 0; i < list.size(); i++) {
        goodsQnt = list.get(i);
        if (goodsQnt.getProductId().equals(id)) {
            cnt++;
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
        }
    }

    // 장바구니에 해당 상품이 없으면 새로 추가
    if (cnt == 0) { 
        goods.setQuantity(1);
        list.add(goods);
    }

    // 장바구니에 상품 추가 후 상품 정보 페이지로 리다이렉트
    response.sendRedirect("product.jsp?id=" + id);
%>
