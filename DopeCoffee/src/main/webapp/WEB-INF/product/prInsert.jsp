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
</head>
<body>

<section id="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 class="subtitle wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">상품등록</h2>
                            <p class="subtitle-des wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".5s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.5s; animation-name: fadeInDown;">
                              상품정보들 작성해주세요.
                            </p>
                            <div class="contact-form">
                             <c:set var="contextPath" value="<%=contextPath%>" scope="application" />
 							<form id="contact-form" method="post" action="${contextPath}/prInsert.pr" role="form" enctype="multipart/form-data">                       
                                            <div class="form-group">
                                          <select class="form-control" name="p_type" id="p_type">
                                              <option class="form-control" value="-">주제</option>
                                              <option class="form-control" value="1" >상품</option>
                                              <option class="form-control" value="2">디저트</option>
                                             
                                          </select>
                                          <span class="valid_check" id="err_p_type"></span>
                                      </div>
                                    
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="text" placeholder="상품명" class="form-control" name="p_name" id="p_name" value="라즈베리 쿠키">
                                        <span class="valid_check" id="err_p_name"></span>
                                    </div>
                                    
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="number" placeholder="가격" class="form-control" name="p_price" id="p_price" value="2800">
                                    	<span class="valid_check" id="err_p_price"></span>
                                    </div>
                                    
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                         <input type="text" placeholder="원산지" class="form-control" name="p_origin" id="p_origin" value="Ngozi , Mubuga">  
                                    	<span class="valid_check" id="err_p_origin"></span>
                                    </div>
                                    
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="number" placeholder="재고 수량" class="form-control" name="p_qty" id="p_qty" value="30">
                                        <span class="valid_check" id="err_p_qty"></span>
                                    </div>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="file" placeholder="이미지" class="form-control" name="p_image" id="p_image">                                       
                                    </div>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="file" placeholder="이미지" class="form-control" name="p_image2" id="p_image2">
                                    </div>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="file" placeholder="이미지" class="form-control" name="p_image3" id="p_image3">
                                    </div>
                                    
                                    <div id="submit" class="wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="submit" id="contact-submit" class="btn btn-default btn-send" value="등록">
                                    </div>              
                                    
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>

</body>
</html>