<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<section id="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div class="top">
							<h2 class="subtitle subtitle_css wow fadeInDown"
								data-wow-duration="500ms" data-wow-delay="0.3s">주문/결제</h2>
							<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="0.6s">${customer.cust_Name}님의주문/결제</p>
						</div>
						<%-- =========================
									상단 부분 						
						==============================
						--%>
						<section class="wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.8s">
							<div class="col-md-12 subtitle_css ">

								<div class="sidebar payment_css">
									<h3 class="widget-head">수령자 정보</h3>
									<div class="author widget col-md-12" id="author_widget">
										<div class="author-body text-center col-md-12">
											<div class="order_info">
												<div class="order_table_type">

													<table  class="col-md-12">
														<colgroup>
															<col style="width: 30%;">
															<col style="width: 70%;">
														</colgroup>

														<tbody>

															<tr>
																<th class="col-md-2" scope="row"><span class="important">수령인</span></th>
																<td class="col-md-10" align="left">${sessionScope.loginfo.cust_Name}</td>
															</tr>
															<tr>
																<th class="col-md-2"scope="row"><span class="important">주소</span></th>
																<td class="col-md-10" align="left">${sessionScope.loginfo.cust_ADR01}
																	${sessionScope.loginfo.cust_ADR02}
																	${sessionScope.loginfo.cust_Zipcode}</td>
															</tr>

															<tr>
																<th class="col-md-2"scope="row"><span class="important">휴대폰
																		번호</span></th>
																<td class="col-md-10" align="left">${sessionScope.loginfo.cust_Contact}</td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>
										</div>

									</div>
								</div>
							</div>

						</section>
						<%-- =========================
									상단 부분 						
						==============================
						--%>
						<section class="wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.8s">
							<div class="col-md-12 subtitle_css ">
								<div class="sidebar payment_css">
									<h3 class="widget-head">상품 정보</h3>
									<div class="author widget col-md-12" id="author_widget">
										<div class="author-body text-center col-md-12">
											<table class="table table-striped table-hover">
												<thead>
													<tr>
														<th class="text-center">번호</th>
														<th class="text-center">상품명</th>
														<th class="text-center">수량</th>
														<th class="text-center">총금액</th>
													</tr>
												</thead>

												<c:forEach items="${sessionScope.shoplists}" var="shopinfo">
													<tr>
														<td align="center" valign="middle">${shopinfo.cfno}</td>
														<td align="center" valign="middle"><img align="left"
															src="./upload/${shopinfo.image}" class="img-rounded"
															width="60" height="72"> <br>${shopinfo.cfname}</td>
														<td align="center">${shopinfo.qty}개</td>
														<td align="center"><fmt:formatNumber
																value="${shopinfo.qty * shopinfo.price}"
																pattern="###,###" /> 원</td>
														<td align="center"></td>
													</tr>
												</c:forEach>
											</table>
										</div>

									</div>
								</div>
							</div>

						</section>
						<%-- =========================
									상단 부분 						
						==============================
						--%>
						<section class="wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.8s">
							<div class="col-md-12 subtitle_css ">
								<div class="sidebar payment_css">
									<h3 class="widget-head">결제 정보</h3>
									<div class="author widget col-md-12" id="author_widget">
										<div class="author-body text-center col-md-4"></div>

									</div>
								</div>
							</div>

						</section>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ------------------------------------- [모달 section]--------------------------------------- -->
	<div class="container">

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="modal-title" class="modal-title" style="font-size: 35px">
						</h4>
					</div>
					<div class="modal-body">
						<p id="modal-body" style="font-size: 13px"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="font-size: 13px">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="font-size: 13px">아니오</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>