<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/css/coffee.css">
<script type="text/javascript" src="${contextPath}/js/coffee.js"></script>
</head>
<body>
	<section id="blog-full-width">
		<div class="container">
			<div class="full_css col-md-12">
				<div class="subtitle_css col-md-8">
						<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay=".3s">Coffee Bean</h2>
						<article class="wow fadeInDown animated" data-wow-delay=".3s"
							data-wow-duration="500ms"
							style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
							<div class="blog-post-image">
								<div id="myCarousel" class="carousel slide carousel-fade"
									data-ride="carousel">
									<div class="carousel-inner carousel-zoom carousel-fade">
										<div class="item active">
											<img class="img-responsive" src="./upload/${bean.c_image}"
												alt="">
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
						<form class="form-inline" role="form" method="post" action="${contextPath}/insert.sc">
								<div >
									<div id="item_price1">
										<span class=span1>금액</span>
										<span class=span1>${bean.c_price}원</span>
									</div>
								</div>
								<div >
									<div id="item_price1">
										<span class=span1>원산지</span>
										<span class=span2>${bean.c_origin}</span>
									</div>
								</div>
								<div >
									<div id="item_price1">
										<span class=span1 >무게</span>
										<span class=span2>${bean.c_weight}</span>
									</div>
								</div>
								<div >
									<div id="item_price1">
										<span class=span1>로스팅</span>
										<span class=span2>${bean.c_roasting}</span>
									</div>
								</div>
								<div >
									<div id="item_price1">
										<span class=span1>블렌딩</span>
										<span class=span2>${bean.c_blending}</span>
									</div>
								</div>
								<div >
									<div id="item_price1">
										<span class=span1>분쇄여부</span>
										<span class=span2>${bean.c_crushing_status}</span>
									</div>
								</div>								
								<div class="item_price1">		
									<span class=span1>수량</span>									
									<span class=span2>										
										<input type="hidden" name="c_no" value="${bean.c_no}">
										<input type="hidden" id="total_qty" name="c_qty" value="${bean.c_qty}">
										<input type="text" class="form-control" name="c_qty" id="c_qty"
											data-toggle="popover" title="수량 입력란"
											data-trigger="hover" data-placement="auto top"
											data-content="구매하시고자 하는 수량을 정수로 입력하세요^^"
											value="1">     
										<button onclick="return plus();">+</button> 
										<button onclick="return minus();">-</button>         
									</span>
	
								</div>
								<div class="option_total_display_area item_choice_list">
	
									<div class="item_price_cont">
										<div class="end_price item_tatal_box" style="">
								<div >
									<div id="item_price1">
										<span class=span1>총 상품금액</span>
										<span class=span1>${bean.c_price}원</span>
									</div>
								</div>										
								<div >
									<div id="item_price1">
										<span class=span1>총 합계금액</span>
										<span class=span1>${bean.c_price}원</span>
									</div>
								</div>												

										</div>
										<!-- //item_tatal_box -->
									</div>
									<!-- //item_price_cont -->
									<div class="btn_choice_box">
										<div>
											<!-- N:재입고 알림이 있을 때는 restock 클래스를 div에 같이 넣어주세요 -->
											<button id="cartBtn" type="button" class="btn_add_cart">장바구니 담기</button>
											<button type="submit" class="btn_add_order">바로 구매</button>
										</div>
									</div>
								</div>
								</form>
							</div>
							
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<hr>
					<!-- 상품상세 -->
					<div class="detail_cont">
						<div class="detail_explain_box">

							<div class="image-manual">
								<!-- 이미지 -->
							</div>
							<div class="txt-manual">
								<!-- 상품상세 공통정보 관리를 상세정보 상단에 노출-->
								<h2>상품상세정보</h2>
								<p align="center" style="text-align: center;">
									<img src="./upload/detetail01.jpg"> <img
										src="./upload/detetail02.jpg"> <img
										src="./upload/detetail03.jpg"> <img
										src="./upload/detetail04.jpg"> <img
										src="./upload/detetail05.jpg">
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