<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>상품 등록</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp"%>   

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">상품 등록</h1>
            <p class="col-md-8 fs-4">Product Addition</p>      
        </div>
    </div>

    <div class="row align-items-md-stretch">     
        <form name="newProduct" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data">      
            <div class="mb-3 row">
                <label class="col-sm-2">상품 코드</label>
                <div class="col-sm-3">
                    <input type="text" name="productId" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">상품명</label>
                <div class="col-sm-3">
                    <input type="text" name="name" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">가격</label>
                <div class="col-sm-3">
                    <input type="text" name="unitPrice" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">판매자</label>
                <div class="col-sm-3">
                    <input type="text" name="registrant" class="form-control">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">설명</label>
                <div class="col-sm-5">
                    <textarea name="description" cols="50" rows="2" class="form-control" placeholder="상품 설명을 입력하세요"></textarea>
                </div>
            </div>          
            <div class="mb-3 row">
                <label class="col-sm-2">카테고리</label>
                <div class="col-sm-3">
                    <input type="text" name="category" class="form-control" >
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">출시일</label>
                <div class="col-sm-3">
                    <input type="text" name="releaseDate" class="form-control">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2">상태</label>
                <div class="col-sm-5">
                    <input type="radio" name="condition" value="New"> 새 상품 
                    <input type="radio" name="condition" value="Used"> 중고 상품 
                </div>              
            </div>      
            <div class="mb-3 row">
                <label class="col-sm-2">이미지</label>
                <div class="col-sm-5">
                    <input type="file" name="productImage" class="form-control">
                </div>
            </div>
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <input type="submit" class="btn btn-warning" value="등록" >
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
</div>  
</body>
</html>
