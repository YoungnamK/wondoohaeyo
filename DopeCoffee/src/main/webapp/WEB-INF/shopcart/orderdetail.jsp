<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="./../common/common.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>상품 결제 내역 정보</title>
<script type="text/javascript" src="${contextPath}/js/onedayClass.js"></script>
<link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
</head>
<body>
	<section id="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div class="top">
							<h2 class="subtitle subtitle_css wow fadeInDown"
								data-wow-duration="500ms" data-wow-delay="0.3s">상품 결제 상세 내역</h2>
							<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="0.6s">${customer.cust_Name}님의수업상세내역을확인하세요!</p>

						</div>
						<%-- =========================
									상단 부분 						
						==============================
						--%>
						<br> 고객님께서 <strong>${order.orderdate}</strong>에 구매하신 상품에 대한
						상세 결제 내역입니다.
						<hr>
						<h3 class="widget-head">구매 정보</h3>
						<div class="panel panel-primary">

							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-condensed">
										<thead>
											<tr>
												<th class="text-center">제품명</th>
												<th class="text-center">이미지</th>
												<th class="text-center">단가</th>
												<th class="text-center">수량</th>
												<th class="text-center">금액</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="totalAmount" value="0" />
											<c:forEach items="${requestScope.lists}" var="shopinfo">
												<tr>
													<td>${shopinfo.cfname}</td>
													<td><img alt="${shopinfo.image}" width="45"
														height="45" src="./upload/${shopinfo.image}"></td>
													<td class="text-center"><fmt:formatNumber
															value="${shopinfo.price}" pattern="###,###" /> 원</td>
													<td class="text-center"><fmt:formatNumber
															value="${shopinfo.qty}" pattern="###,###" /> 개</td>
													<td class="text-center"><c:set var="amount"
															value="${shopinfo.price * shopinfo.qty}" /> <c:set
															var="totalAmount" value="${totalAmount + amount}" /> <fmt:formatNumber
															value="${amount}" pattern="###,###" /> 원</td>
												</tr>
											</c:forEach>
											<tr>
												<td class="thick-line"></td>
												<td class="thick-line"></td>
												<td class="thick-line"></td>
												<td class="thick-line text-center"><strong>합계</strong></td>
												<td class="thick-line text-right"><fmt:formatNumber
														value="${totalAmount}" /> 원</td>
											</tr>
											<!-- 요금에 따른 운송비 구하기 -->
											<c:set var="shipExpense" value="0" />
											<c:choose>
												<c:when test="${totalAmount >= 100000}">
													<c:set var="shipExpense" value="0" />
												</c:when>
												<c:when test="${totalAmount >= 50000}">
													<c:set var="shipExpense" value="2000" />
												</c:when>
												<c:otherwise>
													<c:set var="shipExpense" value="4000" />
												</c:otherwise>
											</c:choose>
											<tr>
												<td class="no-line"></td>
												<td class="no-line"></td>
												<td class="no-line"></td>
												<td class="no-line text-center"><strong>운송비</strong></td>
												<td class="no-line text-right"><fmt:formatNumber
														value="${shipExpense}" pattern="###,###" /> 원</td>
											</tr>
											<tr>
												<td class="no-line"></td>
												<td class="no-line"></td>
												<td class="no-line"></td>
												<td class="no-line text-center"><strong>최종 금액</strong></td>
												<td class="no-line text-right"><c:set var="finalAmount"
														value="${totalAmount + shipExpense}" /> <strong>
														<fmt:formatNumber value="${finalAmount}" pattern="###,###" />
														원
												</strong></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<h3 class="widget-head">결제 정보</h3>
						<div class="panel panel-primary">

							<div class="panel-body">
								<div class="table-responsive">
									<table class="table ">
										<tbody>
											<tr>
												<td class="text-center gr"><strong>주문 번호</strong></td>
												<td>${order.oid}</td>
												<td class="text-center gr"><strong>주문일</strong></td>
												<td>${order.orderdate}</td>
											</tr>
											<tr>
												<td class="text-center gr"><strong>주문 총액</strong></td>
												<td><fmt:formatNumber value="${finalAmount}"
														pattern="###,###" /> 원</td>
												<td class="text-center gr"><strong>할인 금액</strong></td>
												<td>0원</td>
											</tr>
											<tr>
												<td class="text-center gr"><strong>결제 금액</strong></td>
												<td><fmt:formatNumber value="${finalAmount}"
														pattern="###,###" /> 원</td>
												<td class="text-center gr"><strong>결제 상태</strong></td>
												<td>결제 완료</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>

						<h3 class="widget-head">배송 정보</h3>
						<div class="panel panel-primary">

							<div class="panel-body">
								<div class="table-responsive">
									<table class="table ">
										<tbody>
											<tr>
												<td class="text-center gr"><strong>받으시는 분</strong></td>
												<td>${sessionScope.loginfo.cust_Name}(${sessionScope.loginfo.cust_Email})
													님</td>
											</tr>
											<tr>
												<td class="text-center gr"><strong>우편 번호 </strong></td>
												<td>${sessionScope.loginfo.cust_Zipcode}</td>
											</tr>
											<tr>
												<td class="text-center gr"><strong>주소</strong></td>
												<td>${sessionScope.loginfo.cust_ADR01}</td>
											</tr>
											<tr>
												<td class="text-center gr"><strong>상세주소</strong></td>
												<td>${sessionScope.loginfo.cust_ADR02}</td>
											</tr>
											<tr>
												<td class="text-center gr"><strong>배송 방법 </strong></td>
												<td>택배</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="detail_css">
							<button id="btn_detail" class="btn-send"
								onclick="history.back();">목록</button>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>