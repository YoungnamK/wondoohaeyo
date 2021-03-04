<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!-- spring:message 및 properties 파일 사용을 위함  -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
int myoffset = 2;
int mywidth = twelve - 2 * myoffset;
int formleft = 3;
int formright = twelve - formleft;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 개인 회원 목록</title>
<!-- AdminList Style CSS -->
<link rel="stylesheet" href="${contextPath}/css/adminList-style.css">

<script type="text/javascript">
	/* 수정필요) 상단 search, 페이지 수 조회 부분 */
	/* 	$('table').DataTable(); */
</script>

</head>
<body>
	<%-- 관리자 권한, 회원 목록 보기 -------------------------------------------------------%>
	<div align="center" class="container col-sm-offset-2 col-sm-8">
		<div class="panel" align="center">
			<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">사업자회원 전체 목록</h2>
			<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">사업자회원 전체 목록 페이지입니다.</p>
		</div>
		<div class="row">
			<%-- 상단 페이지 수 show ---------------------------------------------------%>
			<div class="container" align="center">
				<div id="top">
					<span class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
						data-wow-delay="0.1s" id="search_btn" data-toggle="tooltip"
						title="클릭하세요!" onclick="search();"> </span> <br>
				</div>
				<%-- form태그 시작 ---------------------------------------------------%>
				<form id="contact-form search" method="get"
					action="${contextPath}/adminList.cu" role="form">
					<div id="search">
						<select class="form-control" name="mode" id="mode"
							data-toggle="tooltip" title="검색할 조건을 선택하세요!">
							<option class="form-control" value="all">전체</option>
							<option class="form-control" value="sell_Contact">연락처</option>
							<option class="form-control" value="sell_Email">이메일</option>
						</select> <input type="text" class="form-control"
							placeholder="검색할 내용을 입력하세요" id="keyword" name="keyword">
						<button type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</form>
				<%-- form태그 끝 ---------------------------------------------------%>
			</div>
			<%-- 테이블 시작 ---------------------------------------------------%>
			<table class="table table-bordered table-hover dt-responsive">
				<%-- 회원 목록의 header 부분 -------------------------------------------------------%>
				<thead>
					<tr>
						<th><spring:message code="seller.sell_Status" /></th>
						<th><spring:message code="seller.sell_Email" /></th>
						<th><spring:message code="seller.sell_Name" /></th>
						<th><spring:message code="seller.sell_Contact" /></th>
						<th><spring:message code="seller.sell_License" /></th>
						<th>사업자등록증</th>
					</tr>
				</thead>
				<%-- 회원 목록의 내용 부분 -------------------------------------------------------%>
				<tbody>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td><a href="${contextPath}/sellApp.se?sell_Email=${bean.sell_Email}">
									${bean.sell_Status}</a></td>
							<td>${bean.sell_Email}</td>
							<td><a href="${contextPath}/sellUpdate.se?sell_Email=${bean.sell_Email}">
									${bean.sell_Name} </a></td>
							<td>${bean.sell_Contact}</td>
							<!-- <td><c:if test="${bean.sell_License == 0}"> </c:if></td> -->
							<td><c:if test="${bean.sell_License != 0}">${bean.sell_License}</c:if></td>
							<td><c:if test="${not empty bean.sell_Pic}">
									<a href="./upload/${bean.sell_Pic}" data-fancybox
										data-caption="캡션" class="fancybox-img" target="_blank"> 
										<img src="./upload/${bean.sell_Pic}" class="img-responsive"
										width="50" height="50" alt="${bean.sell_Pic}"></a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
				<%-- 회원 목록의 하단 부분 -------------------------------------------------------%>
				<tfoot>
					<tr>
						<td colspan="6" align="center">${requestScope.pagingHtml}</td>
					</tr>
				</tfoot>
			</table>
			<%-- 테이블 끝 ---------------------------------------------------%>
		</div>
	</div>
</body>
</html>