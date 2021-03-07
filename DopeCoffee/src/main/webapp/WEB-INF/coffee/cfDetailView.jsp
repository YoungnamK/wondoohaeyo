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
<style type="text/css">
	.form-group{
		width: 100% !important;
	}

	input.input_data_css {
    display: block;
    width: 100%;
    height: 40px;
    padding: 6px 12px;
    font-size: 13px;
    line-height: 1.428571429;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    border-radius: 1px;
    border: 1px solid rgba(111, 121, 122, 0.3);
    box-shadow: none;
    -webkit-box-shadow: none;
}
</style>
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
							<form name=form1 class="form-inline" role="form" method="post"
								action="${contextPath}/insert.sc">
								<input type="hidden" id="custid" name="custid" 
								value="${sessionScope.loginfo.cust_Email}"><!-- 회원 이메일 -->
								<input type="hidden" id="cf_no" name="cf_no" value="${bean.c_no}"> <!-- 상품 번호 -->
								<input type="hidden" disabled="disabled" id="c_qty" name="c_qty" value="${bean.c_qty}"><!-- 사업자가 지정한 수량 -->
								<div class="author-img">
									<img align="middle" width="72" height="72" src="${contextPath}/images/logo2.png">
								</div>
								<ul>

									<li>
										<div class="form-group">
											<div class="column_name">상품명</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="c_name" name="c_name" value="${bean.c_name}">
										</div>
									</li>
									<li>
									<li>
										<div class="form-group">
											<div class="column_name">원산지</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="c_origin" name="c_origin" value="${bean.c_origin}">
										</div>
									</li>
									<li>
									<li>
										<div class="form-group">
											<div class="column_name">무게</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="c_weight" name="c_weight" value="${bean.c_weight}">
										</div>
									</li>
									<li>
									<li>
										<div class="form-group">
											<div class="column_name">로스팅</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="c_roasting" name="c_roasting" value="${bean.c_roasting}">
										</div>
									</li>
									<li>
									<li>
										<div class="form-group">
											<div class="column_name">블렌딩</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="c_blending" name="c_blending" value="${bean.c_blending}">
										</div>
									</li>
									<li>
									<li>
										<div class="form-group">
											<div class="column_name">분쇄여부</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="c_crushing_status" name="c_crushing_status" value="${bean.c_crushing_status}">
										</div>
									</li>
									<li>

									<li>

										<div class="item_price1">
											<div class="column_name">수량</div>
											<span class=span2> 
												<input type="hidden" disabled="disabled" name="c_no" value="${bean.c_no}"> 
												<input type="hidden" id="total_qty" name="c_qty" value="${bean.c_qty}"> 
												<input type="text" class="form-control" name="qty" id="qty" data-toggle="popover" 
												title="수량 입력란" data-trigger="hover" data-placement="auto top" data-content="구매하시고자 하는 수량을 정수로 입력하세요" value="1">
												<button onclick="return plus();">+</button>
												<button onclick="return minus();">-</button>
											</span>

										</div>
									</li>
									<li>
										<div class="form-group">
											<div class="column_name">상품금액</div>
											<input type="hidden" class="input_data_css form-control" id="price" name="price" value="${bean.c_price}">
											<input type="text" disabled="disabled" class="input_data_css form-control" id="fake_price" name="price" value="${bean.c_price}">
										</div>
									</li>
									<li>
										<div class="form-group">
											<div class="column_name">총합계금액</div>
											<input type="text" disabled="disabled" class="input_data_css form-control" id="totalprice" name="totalprice" value="${bean.c_price}">
										</div>
									</li>

									
								</ul>
								<div class="option_total_display_area item_choice_list">

									<div class="item_price_cont">
										<div class="end_price item_tatal_box" style=""></div>
										<!-- //item_tatal_box -->
									</div>
									<!-- //item_price_cont -->
									<div class="btn_choice_box">
										<div>
											<!-- N:재입고 알림이 있을 때는 restock 클래스를 div에 같이 넣어주세요 -->
											<button type="submit" class="btn_add_order">장바구니</button>
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