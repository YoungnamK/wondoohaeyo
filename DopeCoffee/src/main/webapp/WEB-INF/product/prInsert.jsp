<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="${contextPath}/js/product.js"></script>
 <link rel="stylesheet" href="${contextPath}/css/product.css">
</head>
<body>

  <div class="col-12 container mt-3">
        <h2>원데이 클래스 등록</h2>
        <p>사업자님! 개설할 원데이 클래스를 등록해주세요.</p>
        <div class="insert_position">
            <form action="" method="post">
                <!-- [주제] type section : 시작  -->

                <!-- [클래스 코드] code section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                       
                    </span>
                    </div>
                    <!-- coffee : c로 시작 / pottery : p로 시작 -->
                    <input type="text" class="form-control" placeholder="상품 타입" id="p_type" name="p_type">
                </div>
                <!-- [클래스명] classname section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                     
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="상품명" id="p_name" name="p_name">
                </div>
                <!-- [강사명] instructor section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                     
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="가격" id="p_price" name="p_price">
                </div>
                <!-- [수강인원] person section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                       
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="원산지" id="p_origin" name="p_origin">
                </div>
                                <!-- [수강인원] person section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                     
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="재고" id="p_qty" name="p_qty">
                </div>
             
                <!-- [메인 사진] main_image section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        
                    </span>
                    </div>
                    <input type="file" class="form-control" placeholder="메인사진" id="p_image" name="p_image">
                </div>
                <!-- [상세 사진 1] detail_image1 section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                      
                    </span>
                    </div>
                    <input type="file" class="form-control" placeholder="세부사진(추가)" id="p_image2" name="p_image2">
                </div>
                <!-- [상세 사진 2] detail_image2 section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                   
                    </span>
                    </div>
                    <input type="file" class="form-control" placeholder="세부사진(추가)" id="p_image3" name="p_image3">
                </div>

                <!-- 전송 버튼 -->
                <div class="col-6 btnckick">
                    <button type="submit" class="col-3 btn btn-primary">등록하기</button>         
                </div>
                <!-- --------- -->
            </form>
        </div>
    </div>
</body>
</html>