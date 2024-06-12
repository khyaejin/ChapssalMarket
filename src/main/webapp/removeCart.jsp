<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%
    // 전체 장바구니 비우기
    session.removeAttribute("cartlist");
    response.sendRedirect("cart.jsp");
%>
