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
<body onload="today();">
	<!-- 
        ================================================== 
            사진 Section Start
        ================================================== -->
	<section class="works service-page">
		
		<div class="container">
			<div id="top">
				<h2 class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">ONEDAY CLASS</h2>
				<span class="subtitle-des wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.1s"
				id="search_btn" data-toggle="tooltip" title="클릭하세요!" onclick="search();">
					<i class="fas fa-search"></i> 검색
				</span>
				<br>
			</div>
		
		
		   <%-- [검색 모드] 
		   		==== 시작 ==== 
		   	--%>	   
	        <form id="contact-form search" method="get" action="${contextPath}/onedayList.odc" role="form">
	        	<div id="search">
	               <select class="form-control" name="mode" id="mode" data-toggle="tooltip" title="검색할 조건을 선택하세요!">
	                      <option class="form-control" value="all">전체</option>
	                      <option class="form-control" value="type">주제</option>
	                      <option class="form-control" value="address1">지역</option>
	                      <option class="form-control" value="classname">클래스명</option>
	               </select>
	               <input type="text" class="form-control" placeholder="검색할 내용을 입력하세요" id="keyword" name="keyword">
	               <button type="submit"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <%-- ==== 끝 ==== --%>
			<p id="list_top">${requestScope.totalCount}개의 수업</p>
			<c:forEach var="bean" items="${requestScope.lists}">
				<div class="col">
					<div class="col-sm-4">
						<input type="hidden" value="${bean.type}"> <!-- 주제 -->
						<input type="hidden" value="${bean.address1}"> <!-- 주소 지역 -->
						<figure class="wow fadeInLeft animated portfolio-item"
							data-wow-duration="500ms" data-wow-delay="0ms">
							<div class="img-wrapper">
								<img src="./upload/${bean.main_image}" class="img-responsive" alt="image">
								<div class="overlay">
									<div class="buttons">
										<a href="${contextPath}/onedayDetail.odc?code=${bean.code}">자세히 보기</a>
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
								<div class="list_bottom">
									<p id="list_price">
										<i class="fas fa-won-sign"></i>&nbsp;${bean.oneprice}
									</p>
									<p class="list_person">${bean.person}개 남음</p>
								</div>
							</figcaption>
						</figure>
					</div>
				</div>
			</c:forEach>
		</div>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>	
	</section>
</body>
</html>