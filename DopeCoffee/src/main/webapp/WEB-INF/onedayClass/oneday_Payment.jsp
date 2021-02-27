<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>원데이 클래스 예약 정보</title>
	<script type="text/javascript" src="${contextPath}/js/onedayClass.js"></script>
	<link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
</head>
<body onload="today();">
	<section id="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div class="top">
							<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="0.3s">원데이 클래스 예약 정보</h2>
							<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="0.1s">${customer.cust_Name}님의 원데이 클래스 예약 정보입니다!</p>
						</div>
						<%-- =========================
									상단 부분 						
						==============================
						--%>
						<div class="col-md-12">
							<div class="sidebar" id="payment_css">
								<h3 id="class_css" class="widget-head">
									상품 정보
								</h3>
								<div class="author widget col-md-12" id="author_widget">
									<div class="author-body text-center col-md-6">
										<div class="author-bio">
											<img alt="image" src="./upload/${bean.main_image}" width="150px" height="150px">
										</div>
									</div>
									<div class="author-body text-center col-md-6">
										<div class="author-bio">
											<p> 상품 정보</p>
											<p> DOPE COFFEE 는 사용자에게<br> 다양한 콘텐츠를 전달합니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<%-- =========================
									하단 부분 						
						==============================--%>
						
						<div class="col-md-12">
							<div class="sidebar">
								<%-- ========================== Form 양식 시작 부분 ====================================--%>
								<c:set var="contextPath" value="<%=contextPath%>"
									scope="application" />
								<form method="get" action="${contextPath}/onedayPayment.odc">
									<input type="hidden" id="" name="code" value="${bean.code}">
									<div id="form_css" class="categories widget">
										<h3 id="class_css" class="widget-head">
											<spring:message code="oneday.Detail_title" />
										</h3>
										<ul>
											<li>
												<div class="form-group">
													<div class="column_name">
														<spring:message code="oneday.bookdate" />
													</div>
													<input type="hidden" class="input_data form-control"
														disabled="disabled" id="enddate" name="enddate"
														value="${bean.enddate}"> <input type="text"
														class="input_data form-control datepicker"
														placeholder="예약 일자" id="bookdate" name="bookdate"
														onclick="booking_date();">
												</div>
											</li>
											<li>
												<div class="form-group">
													<!-- 파라미터 이름은 수정 할 것  -->
													<div class="column_name">
														<spring:message code="oneday.time" />
													</div>
													<select class="form-control" name="booktime" id="booktime">
														<option class="form-control" value="-">이용 시간</option>
														<option class="form-control"
															value="${requestScope.opentime}">${requestScope.opentime}</option>
														<c:if
															test="${requestScope.add_opentime1 ne 'null ~ null'}">
															<option class="form-control"
																value="${requestScope.add_opentime1}">${requestScope.add_opentime1}</option>
														</c:if>
														<c:if
															test="${requestScope.add_opentime2 ne 'null ~ null'}">
															<option class="form-control"
																value="${requestScope.add_opentime2}">${requestScope.add_opentime2}</option>
														</c:if>
													</select>
												</div>
											</li>
											<li>
												<div class="form-group">
													<div class="column_name">
														<spring:message code="oneday.oneprice" />
													</div>
													<input type="text" disabled="disabled"
														class="input_data form-control" id="oneprice"
														name="oneprice" value="${bean.oneprice}">
												</div>
											</li>
											<li>
												<div class="column_name">
													<spring:message code="oneday.person" />
												</div>
												<div id="person_css" class="form-group">
													<input type="hidden" disabled="disabled"
														class="input_data form-control" value="${bean.person}"
														id="max_person" name="max_person"> <input
														type="text" disabled="disabled"
														class="input_data form-control" value="1" id="fake_person"
														name="fake_person"> <input type="hidden"
														class="input_data form-control" id="person" name="person"
														value="1">
													<button id="plusbtn" type="button" class="btn-send pmbtn"
														data-toggle="modal" data-target="#myModal">
														<i class="fas fa-plus"></i>
													</button>
													<button id="minusbtn" type="button" class="btn-send pmbtn">
														<i class="fas fa-minus"></i>
													</button>

												</div>
											</li>
											<li>
												<div class="form-group">
													<div class="column_name">
														<spring:message code="oneday.totalprice" />
													</div>
													<input type="text" disabled="disabled"
														class="input_data form-control" value="${bean.oneprice}"
														id="fake_totalprice" name="fake_totalprice"> <input
														type="hidden" class="input_data form-control"
														value="${bean.oneprice}" id="totalprice" name="totalprice">
												</div>
											</li>
										</ul>
									</div>

									<div class="submit_detail">
										<input type="submit" id="contact-submit" class="btn-send"
											value='<spring:message code="oneday.Paymentbtn"/>'
											onclick="return payment_check();"> <input
											type="submit" id="contact-submit" class="btn-send"
											value="카카오 API"> <input type="submit"
											id="contact-submit" class="btn-send" value="네이버 API">
									</div>
								</form>
							</div>
						</div>
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
						<h4 id="modal-title" class="modal-title" style="font-size: 35px"></h4>
					</div>
					<div class="modal-body">
						<p id="modal-body" style="font-size: 13px"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="font-size: 13px">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>