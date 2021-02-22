<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원데이 클래스 목록</title>
<script type="text/javascript" src="${contextPath}/js/onedayClass.js"></script>
<link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
</head>
<body>
	<!-- 
        ================================================== 
            최상단 Page Section Start
        ================================================== -->
	<section class="global-page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>Oneday Class</h2>
						<ol class="breadcrumb">
							<li><a href="${contextPath}/main.co"> <i
									class="fas fa-home"></i> HOME
							</a></li>
							<li><a href="/main.co"> <i class="fas fa-search"></i> 검색
							</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#Page header-->


	<!-- 
        ================================================== 
            사진 Section Start
        ================================================== -->
	<section class="works service-page">
		<div class="container">
			<c:forEach var="bean" items="${requestScope.lists}">
				<div class="col">
					<div class="col-sm-4">
						<figure class="wow fadeInLeft animated portfolio-item"
							data-wow-duration="500ms" data-wow-delay="0ms">
							<div class="img-wrapper">
								<img src="images/portfolio/item-1.jpg" class="img-responsive"
									alt="image">
								<div class="overlay">
									<div class="buttons">
										<a target="_blank" href="">자세히 보기</a>
										<c:if test="${bean.sell_email eq sessionScope.loginfo_seller.sell_Email}"> 
											<a target="_blank" href="">관리</a>
										</c:if>
									</div>
								</div>
							</div>
							<figcaption>
								<h4>
									<a href="#detail.jsp">${bean.classname}</a>
								</h4>
								<p>${bean.oneprice}</p>
							</figcaption>
						</figure>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>