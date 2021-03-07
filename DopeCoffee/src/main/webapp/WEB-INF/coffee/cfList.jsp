<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${contextPath}/js/coffee.js"></script>
<link rel="stylesheet" href="${contextPath}/css/coffee.css">
<style type="text/css">
		/*이미지 hover 되었을 때 전체*/
	.overlay{
	    width: 100% !important;
	}
	
	/*이미지 hover 되었을 때 버튼*/
	.buttons{
	    width: inherit !important;
	    position: absolute !important;
	    top: 45% !important;
	    left: 0% !important;
	}
	
	/* 이미지 클래스명 ,상품명 부분 */
	figure figcaption h4 a {
	    color: #5080BF !important;
	}
	
	figure figcaption h4 a:hover {
	    color: #5080BF !important;
	}
	.list_bottom{
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		align-content: center;
	}

	.list_bottom p.list_person {
		font-size: 13px !important;
		border-radius: 20px;
	    background-color: #84C1D9;
		padding: 5px 10px 5px 10px;
		color: #fff;
		font-weight: bold !important;
		margin-top: 10px !important;
	}
	#list_price{
		font-size: 20px;
	}
	
	
	/* 검색 부분  시작*/
#search_btn{
	cursor: pointer;
}


#search {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	padding-left : 15px;
	padding-right : 5px;
	margin: 10px 0px 10px 0px;
}


select#mode{
	width: 10%;
    height: 40px;
    font-size: 13px;
    line-height: 1.428571429;
    background-color: #fff;
    background-image: none;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    border-radius: 1px;
    border: 1px solid rgba(111, 121, 122, 0.3);	
}

input#keyword{
	display: block !important;
	width: 20%;
    height: 40px !important;
    padding: 6px 12px !important;
    font-size: 13px !important;
    line-height: 1.428571429 !important;
    background-color: #fff !important;
    background-image: none !important;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s !important;
    border-radius: 1px !important;
    border: 1px solid rgba(111, 121, 122, 0.3) !important;
    -webkit-box-shadow: none !important;
}

#search button{
	height: 40px;
    font-size: 13px;
    line-height: 1.428571429;
    background-color: #fff;
    background-image: none;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    border-radius: 1px;
    border: 1px solid rgba(111, 121, 122, 0.3);	
}

@media( max-width : 585px ) {
	select#mode{
		width: 30%;
	} 
	
	input#keyword{
		width: 60%;
	}
	
	button {
		width: 10%;
	}
	
	
}

/* 검색 부분  끝*/
	
</style>
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
										<i class="fas fa-won-sign"></i>&nbsp;
										<fmt:formatNumber pattern="###,###" value="${bean.c_price}" />
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
											<a href="${contextPath}/cfdelete.cf?c_no=${bean.c_no}">삭제</a>
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
</body>
</html>