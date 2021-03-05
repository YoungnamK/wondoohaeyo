<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제확인</title>
<link rel="stylesheet" href="${contextPath}/css/coffee.css">
<script type="text/javascript" src="${contextPath}/js/coffee.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
								data-wow-delay="0.6s">${sessionScope.loginfo.cust_Name}님의주문/결제</p>
						</div>
						<%-- =========================
									상단 부분 						
						==============================
						--%>
						<section class="wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.8s">
							<div class="col-md-12 subtitle_css ">
								<div class="sidebar payment_css">
									<h4 class="widget-head">수령자 정보</h4>
									<hr>
									<div class="col-md-12">
										<div class="author-body text-center col-md-12">
											<div class="order_info">
												<div class="order_table_type">
													<table id="sang" class="col-md-12">
														<tbody>
															<tr>
																<th class="col-md-2" scope="row"><span>아이디</span></th>
																<td class="col-md-10" align="left">${sessionScope.loginfo.cust_Email}</td>
															</tr>
															<tr>
																<th class="col-md-2" scope="row"><span
																	class="important">수령인</span></th>
																<td class="col-md-10" align="left">${sessionScope.loginfo.cust_Name}</td>
															</tr>

															<tr>
																<th class="col-md-2" scope="row"><span
																	class="important">주소</span></th>
																<td class="col-md-10" align="left">${sessionScope.loginfo.cust_ADR01}
																	${sessionScope.loginfo.cust_ADR02}
																	${sessionScope.loginfo.cust_Zipcode}</td>
															</tr>

															<tr>
																<th class="col-md-2" scope="row"><span
																	class="important">휴대폰 번호</span></th>
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
						<section class="wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.8s">
							<div class="col-md-12 subtitle_css ">
								<div class="sidebar payment_css">
									<h4 class="widget-head">배송지 정보</h4>
									<hr>

									<div id="form_css" class="categories widget categories_css">
										<ul>
											<li>
												<div class="form-group payment_input">
													<div class="column_name">수령자</div>
													<input type="text" class="input_data form-control"
														disabled="disabled" id="fakecust_Name"
														name="fakecust_Name"
														value="${sessionScope.loginfo.cust_Name}"> <input
														type="hidden" class="input_data form-control"
														id="cust_Name" name="cust_Name"
														value="${sessionScope.loginfo.cust_Name}">
												</div>
											</li>
											<li>
													<div id="zipcode-section2" class="form-group">
                                                        <input type="text" placeholder="우편번호" disabled="disabled" class="form-control" id="fakezipcode" name="fakezipcode">
                                                        <input type="hidden" class="form-control" id="zipcode" name="zipcode">
                                                        <button type="button" id="zipcode-find" class="btn btn-default" onclick="zipCheck();">
                                                            우편번호 찾기
                                                        </button>
                                                    </div>
											</li>
											<li>
												<div class="form-group payment_input">
													<div class="column_name">전화번호</div>
													<input type="text" class="input_data form-control"
														disabled="disabled" id="fake_totalprice"
														name="fake_totalprice" value="${sessionScope.loginfo.cust_Contact}"> <input
														type="hidden" class="input_data form-control"
														id="cust_Contact" name="cust_Contact" value="${sessionScope.loginfo.cust_Contact}">
												</div>
											</li>
										</ul>
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
							<form method="get" action="${contextPath}/calculate.sc">
								<div class="col-md-12 subtitle_css ">
									<div class="sidebar payment_css">
									<input type="text" id="cfno" name="cfno" value="${shopinfo.cfno}">
										<h4 class="widget-head">상품 정보</h4>
										<hr>
										<div class="col-md-12">
											<div class="author-body text-center col-md-12">
												<table class="table table-hover">
													<thead>
														<tr>
															<th class="text-center">번호</th>
															<th class="text-center">상품명</th>
															<th class="text-center">수량</th>
															<th class="text-center">상품가격</th>
															<th class="text-center">총금액</th>
															<th class="text-center">합계금액</th>
														</tr>
													</thead>

													<c:forEach items="${sessionScope.shoplists}" var="shopinfo">
														<tr>
															<td align="center" valign="middle">${shopinfo.cfno}</td>
															<td align="center" valign="middle"><img align="left"
																src="./upload/${shopinfo.image}" class="img-rounded"
																width="60" height="72"> <br>${shopinfo.cfname}</td>
															<td align="center">${shopinfo.qty}개</td>
															<td align="center">${shopinfo.price}원</td>
															<td align="center"><fmt:formatNumber
																	value="${shopinfo.qty * shopinfo.price }"
																	pattern="###,###" /> 원</td>
															<td align="center"><fmt:formatNumber
																	value="${shopinfo.qty * shopinfo.price }"
																	pattern="###,###" /> 원</td>
															<td align="center"></td>
														</tr>
													</c:forEach>
												</table>
											</div>

										</div>
									</div>
								</div>
							

							<%-- =========================
									상단 부분 						
						==============================
						--%>

							<div class="col-md-12 subtitle_css ">
								<div class="sidebar payment_css">
									<h4 class="widget-head">결제 정보</h4>
									<hr>
									<div class=" col-md-12" id="author_widget">
										<div class="author-body text-center col-md-4"></div>
										<div class="final_payment">
											<p align="right">최종 결제 금액</p>
											<p align="right" id="price">
												<i class="fas fa-won-sign" ></i>&nbsp;원
											</p>
										</div>
										<div class="submit_detail">
										<a href="<%=contextPath%>/calculate.sc">결재하기</a>
											<input id="pay" type="submit" class="btn-send" value="일반결제"><input
												type="submit" id="kakaopay" class="btn-send"
												value="KAKAO PAY"> <input type="submit"
												id="naverpay" class="btn-send" value="NAVER PAY">
										</div>

									</div>
								</div>
							</div>
						</form>
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