<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${contextPath}/js/coffee.js"></script>
<link rel="stylesheet" href="${contextPath}/css/coffee.css">
</head>
<body>
<section id="contact-section">
<div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 class="subtitle wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">상품수정</h2>
                            <p class="subtitle-des wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".5s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.5s; animation-name: fadeInDown;">
                              상품정보들 수정해주세요.
                            </p>
                            <div class="contact-form">
                             <c:set var="contextPath" value="<%=contextPath%>" scope="application" />
 							<form id="contact-form" method="post" action="${contextPath}/cfupdate.cf" role="form" enctype="multipart/form-data">
 									<input type="hidden" value="abcd@naver.com" name="c_seller_email">
 														<input type="hidden" name="pageNumber" value="${param.pageNumber}"> <input type="hidden" name="pageSize" value="${param.pageSize}"> <input type="hidden" name="mode" value="${param.mode}"> <input type="hidden" name="keyword" value="${param.keyword}">
								<label>상품 번호</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="hidden" disabled="disabled" placeholder="상품번호" class="form-control" name="c_no" id="c_no" value="${bean.c_no}">
                                        <input type="hidden" name="c_no" id="c_no" value="${bean.c_no}">		                                      
                                    </div>
                        
                                     <!-- ------------------------------------- [주제 type section]--------------------------------------- -->
                                      <label>커피 타입</label>
                                      <div class="form-group">
                                          <select class="form-control" name="c_type" id="c_type">
                                              <option class="form-control" value="0">주제</option>
                                              <option class="form-control" value="1" >싱글오리진</option>
                                              <option class="form-control" value="2">블렌딩</option>
                                              <option class="form-control" value="3">캡슐</option>
                                          </select>
                                          <span class="valid_check" id="err_c_type"></span>
                                      </div>
                                    <label>상품명</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="text" placeholder="상품명" class="form-control" name="c_name" id="c_name" value="${bean.c_name}">
                                        <span class="valid_check" id="err_c_name"></span>
                                    </div>
                                    <label>상품 가격</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="number" placeholder="가격" class="form-control" name="c_price" id="c_price" value="${bean.c_price}">
                                    	<span class="valid_check" id="err_c_price"></span>
                                    </div>
                                    <label>원산지</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                         <input type="text" placeholder="원산지" class="form-control" name="c_origin" id="c_origin" value="${bean.c_origin}">  
                                    	<span class="valid_check" id="err_c_origin"></span>
                                    </div>
                                    <label>무게(g)</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="number" placeholder="무게(g)" class="form-control" name="c_weight" id="c_weight" value="${bean.c_weight}">
                                        <span class="valid_check" id="err_c_weight"></span>
                                    </div>
                                    <label>로스팅의 여부</label>
                                     <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="text" placeholder="로스팅의 여부" class="form-control" name="c_roasting" id="c_roasting" value="${bean.c_roasting}">
                                        <span class="valid_check" id="err_c_roasting"></span>
                                    </div>
                                    <label>블렌딩</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="text" placeholder="블렌딩" class="form-control" name="c_blending" id="c_blending" value="${bean.c_blending}">
                                        <span class="valid_check" id="err_c_blending"></span>
                                    </div>
                                    <label>분쇄 타입</label>
                                      <div class="form-group">
                                          <select class="form-control" name="c_crushing_status" id="c_crushing_status">
                                              <option class="form-control" value="-">--분쇄 타입--</option>
                                              <option class="form-control" value="original" >원두(분쇄안함)</option>
                                              <option class="form-control" value="handdrip">핸드드립용</option>
                                              <option class="form-control" value="coffeeport">커피포트용</option>
                                              <option class="form-control" value="franchpress">프렌치프레스용</option>
                                              <option class="form-control" value="dutchcoffee">더치커피용</option>
                                          </select>
                                          <span class="valid_check" id="err_c_crushing_status"></span>
                                      </div>
                                    <label>재고 수량</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="number" placeholder="재고 수량" class="form-control" name="c_qty" id="c_qty" value="${bean.c_qty}">
                                        <span class="valid_check" id="err_c_qty"></span>
                                    </div>
                                    <label>메인 이미지</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="file" placeholder="메인 이미지" class="form-control" name="cf_image" id="cf_image">                                       
                                    </div>
                                    
                                    <label>상세 이미지</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="file" placeholder="상세 이미지" class="form-control" name="cf_image2" id="cf_image2">
                                    </div>
                                    <label>상세 이미지</label>
                                    <div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="0.3s" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                                        <input type="file" placeholder="상세 이미지" class="form-control" name="cf_image3" id="cf_image3">
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