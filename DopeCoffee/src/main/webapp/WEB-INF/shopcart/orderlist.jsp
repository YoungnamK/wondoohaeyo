<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap Sample</title>
</head>
<body>
	<section id="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<%-- =========================
									상단 제목 부분 						
						==============================--%>
						<div class="top">
							<h2 class="subtitle subtitle_css wow fadeInDown"
								data-wow-duration="500ms" data-wow-delay="0.3s">상품주문 내역</h2>
							<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="0.6s">${sessionScope.loginfo.cust_Name}님의상품주문
								내역 입니다!</p>

						</div>

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">${sessionScope.loginfo.cust_Name}(${sessionScope.loginfo.cust_Email})
									님의 이전 주문 내역</h3>
							</div>


							<section class="wow fadeInDown col-md-12"
								data-wow-duration="500ms" data-wow-delay="0.8s">
								<div class="row ">
									<table class="table table-bordered table-hover dt-responsive">

										<%-- 결제 목록의 header 부분 -------------------------------------------------------%>
										<thead>
											<tr>
												<th class="text-center">주문 번호</th>
												<th class="text-center">주문 일자</th>
												<th class="text-center">상세 보기</th>
											</tr>
										</thead>

										<%-- 결제 목록의 내용 부분 -------------------------------------------------------%>
										<tbody>
											<c:forEach items="${requestScope.lists}" var="shopinfo">
												<tr class="record">
													<td align="center">${shopinfo.oid}</td>
													<td align="center">${shopinfo.orderdate}</td>
													<td align="center"><a
														href="${contextPath}/detailview.sc?oid=${shopinfo.oid}">상품상세
															보기</a></td>
												</tr>
											</c:forEach>
										</tbody>



									</table>

									<%-- 결제 목록의 하단 부분 -------------------------------------------------------%>
									<div align="center">
										<footer>${requestScope.pagingHtml}</footer>
									</div>
								</div>

							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>