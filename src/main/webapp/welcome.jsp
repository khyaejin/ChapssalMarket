<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>    
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>Welcome</title>
     <style>
           .btn-info {
            background-color: #ffeeba; /* 연한 노란색 */
            border-color: #ffeeba; /* 연한 노란색 */
            color: #343a40; /* 버튼 텍스트 색상 */
        }
    </style>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp"%>    
    <%!String greeting = "찹쌀마켓에 오신 것을 환영합니다";
    String tagline = "Welcome to Chapssal Market!";%>    
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold"><%=greeting%></h1>
            <p class="col-md-8 fs-4">Chapssal Market</p>      
        </div>
    </div>

    <div class="row align-items-md-stretch text-center">
        <div class="col-md-12">
            <div class="h-100 p-5">
                <h3><%=tagline%></h3>          
                <%
                    response.setIntHeader("Refresh", 5);
                    Date day = new java.util.Date();
                    String am_pm;
                    int hour = day.getHours();
                    int minute = day.getMinutes();
                    int second = day.getSeconds();
                    if (hour / 12 == 0) {
                        am_pm = "AM";
                    } else {
                        am_pm = "PM";
                        hour = hour - 12;
                    }
                    String CT = hour + ":" + minute + ":" + second + " " + am_pm;
                    out.println("현재 접속 시각: " + CT + "\n");
                %>  			
                <p><a href="products.jsp" class="btn btn-warning">상품 목록 보기 &raquo;</a></p>
            </div>
        </div>   
    </div> 	
    <%@ include file="footer.jsp"%>   
</div>
</body>
</html>
