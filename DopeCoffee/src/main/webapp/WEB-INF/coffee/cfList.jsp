
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<section class="works service-page">

		<div class="container">
			<div class="top">
				<h2 class="wow fadeInLeft animated portfolio-item"
					data-wow-duration="500ms" data-wow-delay="0ms">coffee bean</h2>
				<span class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
					data-wow-delay="0.1s" id="search_btn" data-toggle="tooltip"
					title="클릭하세요!" onclick="search();"> <i class="fas fa-search"></i>
					검색
				</span> <br>
			</div>


			<%-- [검색 모드] 
		   		==== 시작 ==== 
		   	--%>
			<form id="contact-form search" method="get" action="${contextPath}/cfList.cf" role="form">
				<div id="search">
					<select class="form-control" name="mode" id="mode"
						data-toggle="tooltip" title="검색할 조건을 선택하세요!">
						<option class="form-control" value="all">전체</option>
						<option class="form-control" value="c_type">타입</option>
						<option class="form-control" value="c_origin">나라별</option>
						<option class="form-control" value="c_weight">무게</option>
					</select> <input type="text" class="form-control"
						placeholder="검색할 내용을 입력하세요" id="keyword" name="keyword">
					<button type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
			<%-- ==== 끝 ==== --%>
			<p class="list_top">${requestScope.totalCount}개의상품</p>
			<c:forEach var="bean" items="${requestScope.lists}" varStatus="status">
				<c:if test="${status.count % 3 == 0}">
				<div class="row">
					<div class="col-sm-4">
						<input type="hidden" value="${bean.c_type}">
						<!-- 주제 -->
						<input type="hidden" value="${bean.c_origin}">
						<!-- 지역 -->
						<input type="hidden" id="c_no" value="${bean.c_no}">
						<!-- 코드  -->
						<figure class="wow fadeInLeft animated portfolio-item"
							data-wow-duration="500ms" data-wow-delay="0ms">
							<div class="img-wrapper">
								<img src="./upload/${bean.c_image}" class="img-responsive"
									alt="image">
								<div class="overlay">
									<div class="buttons">
										<a href="${contextPath}/cfdetailview.cf?c_no=${bean.c_no}">
										 	상품 보기
										 </a>
										<c:if test="${bean.c_seller_email eq sessionScope.loginfo_seller.sell_Email}">
											<a href="${contextPath}/cfupdate.cf?c_no=${bean.c_no}">관리</a>
											<a data-toggle="modal" data-target="#myModal">삭제</a>
										</c:if>
									</div>
								</div>
							</div>
							<figcaption>
								<h4>
									<a href="#detail.jsp">${bean.c_name}</a>
								</h4>
								<div class="list_bottom">
									<p id="list_price">
										<i class="fas fa-won-sign"></i>&nbsp;${bean.c_price}
									</p>

								</div>
							</figcaption>
						</figure>
					</div>
				</div>
				</c:if>
				<c:if test="${status.count % 3 != 0}">
				<div class="col">
					<div class="col-sm-4">
						<input type="hidden" value="${bean.c_type}">
						<!-- 주제 -->
						<input type="hidden" value="${bean.c_origin}">
						<!-- 지역 -->
						<input type="hidden" id="c_no" value="${bean.c_no}">
						<!-- 코드  -->
						<figure class="wow fadeInLeft animated portfolio-item"
							data-wow-duration="500ms" data-wow-delay="0ms">
							<div class="img-wrapper">
								<img src="./upload/${bean.c_image}" class="img-responsive"
									alt="image">
								<div class="overlay">
									<div class="buttons">
										<a href="${contextPath}/cfdetailview.cf?c_no=${bean.c_no}">
										 	상품 보기
										 </a>
										<c:if test="${bean.c_seller_email eq sessionScope.loginfo_seller.sell_Email}">
											<a href="${contextPath}/cfupdate.cf?c_no=${bean.c_no}">관리</a>
											<a data-toggle="modal" data-target="#myModal">삭제</a>
										</c:if>
									</div>
								</div>
							</div>
							<figcaption>
								<h4>
									<a href="#detail.jsp">${bean.c_name}</a>
								</h4>
								<div class="list_bottom">
									<p id="list_price">
										<i class="fas fa-won-sign"></i>&nbsp;${bean.c_price}
									</p>

								</div>
							</figcaption>
						</figure>
					</div>
				</div>
				</c:if>
			</c:forEach>
		</div>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
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
							<i class="fas fa-exclamation-circle"></i>
						</h4>
					</div>
					<div class="modal-body">
						<p id="modal-body" style="font-size: 13px">정말 삭제 하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="font-size: 13px" onclick="delete_check();">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="font-size: 13px">아니오</button>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>