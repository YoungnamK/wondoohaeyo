<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="blog-full-width">
		<div class="container">
		  <h2 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">Coffee Bean</h2>
		   <div class="row">
		    <div class="col-md-6">
		     <article class="wow fadeInDown animated" data-wow-delay=".3s" data-wow-duration="500ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
		      <div class="blog-post-image">
		       <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
		        <div class="carousel-inner carousel-zoom carousel-fade">
		         <div class="item active">
                   <img class="img-responsive" src="./upload/${bean.c_image}" alt="">
                 </div>
		        </div>
		       </div>
		      </div>
		     </article>
		   </div>
		   
		   <div class="col-md-4">
		    <div class="sidebar">
		     
              <h3 class="widget-head">${bean.c_name}</h3>
              <hr>
            
              <div class="categories widget">
	               <dl class="item_price">
	                <dt>판매가</dt>
	                 	<dd>
	                   <strong><strong>${bean.c_price}</strong></strong>원
	                                <!-- 글로벌 참조 화폐 임시 적용 -->
	                	</dd>
	                </dl>
	               <dl class="item_price">
	                <dt>원산지</dt>
	                	 <dd>
	                   <strong><strong>${bean.c_origin}</strong></strong>                    
	                	</dd>
	               </dl>
	               	               <dl class="item_price">
	                <dt>무게</dt>
	                	 <dd>
	                   <strong><strong>${bean.c_weight}</strong></strong>g                   
	                	</dd>
	               </dl>
	               	               <dl class="item_price">
	                <dt>로스팅</dt>
	                	 <dd>
	                   <strong><strong>${bean.c_roasting}</strong></strong>                    
	                	</dd>
	               </dl>
	               	               <dl class="item_price">
	                <dt>블렌딩</dt>
	                	 <dd>
	                   <strong><strong>${bean.c_blending}</strong></strong>                    
	                	</dd>
	                	</dl>
	               <div class="item_add_option_box">
                      <dl>
                            <dt>분쇄여부</dt>
                            <dd>
        					<select name="optionInput" class="status-select" onchange="" style="display: none;"></select>
                            </dd>
                        </dl>
                        
                    </div>
                    <div class="option_total_display_area item_choice_list">
                    <table class="option_display_area" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="330px">
                            <col>
                            <col width="80px">
                            <col width="40px">
                        </colgroup>
                    

</table>
                    <div class="item_price_cont">
                        <div class="end_price item_tatal_box" style="">
                            <dl class="total_goods">
                                <dt>총 상품금액</dt>
                                <dd><strong class="goods_total_price">${bean.c_price}<b>원</b></strong></dd>
                            </dl>
                            <dl class="total_discount dn">
                                <dt>총 할인금액</dt>
                                <dd><strong class="total_benefit_price"></strong></dd>
                            </dl>
                            <dl class="total_amount">
                                <dt>총 합계금액</dt>
                                <dd><strong class="total_price">${bean.c_price}<b>원</b></strong></dd>
                            </dl>
                        </div>
                        <!-- //item_tatal_box -->
                    </div>
                    <!-- //item_price_cont -->
                    <div class="btn_choice_box">
                    <div><!-- N:재입고 알림이 있을 때는 restock 클래스를 div에 같이 넣어주세요 -->
                    <button id="cartBtn" type="button" class="btn_add_cart" onmousedown="_LA.EC.CI(['1000000927'], [1]);">장바구니</button>
                    <button type="button" class="btn_add_order">바로 구매</button>
                </div>
            </div>
                </div>
              </div>
		    </div>
		   </div>
		   <div>
		   <hr>
		   		                  <!-- 상품상세 -->
              <div class="detail_cont">
            <h3>상품상세정보</h3>
            <div class="detail_explain_box">
                <div class="image-manual"><!-- 이미지 --></div>
                <div class="txt-manual">
                    <!-- 상품상세 공통정보 관리를 상세정보 상단에 노출-->
                    
                    <p align="center" style="text-align: center;">
						<img src="./upload/detetail01.jpg">
						<img src="./upload/detetail02.jpg">
						<img src="./upload/detetail03.jpg">
						<img src="./upload/detetail04.jpg">
						<img src="./upload/detetail05.jpg">
					</p>
                </div>
            </div>
            <!-- //detail_explain_box -->
        </div>
        
		 </div>
	   </div>
	</section>
         
</body>
</html>