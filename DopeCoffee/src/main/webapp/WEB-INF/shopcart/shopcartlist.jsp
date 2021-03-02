<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ include file="./../common/common.jsp"%>
    <%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3 ;
	int formright = twelve - formleft ;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${contextPath}/js/coffee.js"></script>
<link rel="stylesheet" href="${contextPath}/css/coffee.css">
</head>
<body>
	<div class="container">
	   <h2  class="subtitle wow fadeInDown" data-wow-duration="500ms"data-wow-delay=".3s">장바구니</h2>	
	
	<hr>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th class="text-center">번호</th>
				<th class="text-center">상품명</th>
				<th class="text-center">수량</th>
				<th class="text-center">단가</th>
				<th class="text-center">금액</th>
				<th class="text-center">삭제</th>				
			</tr>
		</thead>
	
					<c:forEach items="${sessionScope.shoplists}" var="shopinfo">
					<tr>
						<td align="center" valign="middle">${shopinfo.cfno}</td>
						<td align="center" valign="middle">
							<img align="left"
								src="./upload/${shopinfo.image}" class="img-rounded"
								width="36" height="36"> <br>${shopinfo.cfname}</td>
						<td align="center">${shopinfo.qty} 개</td>
						<td align="center"><fmt:formatNumber value="${shopinfo.price}" pattern="###,###"/> 원</td>
						<td align="center"><fmt:formatNumber value="${shopinfo.qty * shopinfo.price}" pattern="###,###"/> 원</td>
						<td align="center">
							<a href="<%=contextPath%>/delete.sc?cfno=${shopinfo.cfno}">
								삭제
							</a>
						</td>
					</tr>
				</c:forEach>
				<tr class="header">
			<td colspan="4" align="center">
				<a href="<%=contextPath%>/payment.cf">결제하기</a>
				&nbsp;&nbsp; 
				<a href="<%=contextPath%>/cfList.cf">쇼핑 계속하기</a>
			</td>
			<td colspan="4" align="center">
				총 금액 : <fmt:formatNumber value="${sessionScope.totalAmount}" pattern="###,###"/> 원
			</td>
				</tr>
			</table>
	</div>
</body>
</html>