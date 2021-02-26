<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function cartEdit(num) { /* 해당 상품에 대한 주문 수량 수정 */
		var stock = document.getElementById("c_qty").value;
		location.href = "mallCartEdit.jsp?num=" + c_no + "&c_qty=" + c_qty;
	}
</script>
</head>
<body>
<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h4>장바구니 보기</h4>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">상품명</th>
						<th class="text-center">수량</th>
						<th class="text-center">단가</th>
						<th class="text-center">포인트</th>
						<th class="text-center">금액</th>
						<th class="text-center">누적 포인트</th>
						<th class="text-center">삭제</th>
					</tr>
				</thead>
				<c:forEach items="${sessionScope.shoplists}" var="shopinfo">
					<tr>
						<td align="center" valign="middle">${shopinfo.pnum}</td>
						<td align="center" valign="middle">
							<c:if test="${applicationScope.debugMode == true}">
								이미지 경로<br>${applicationScope.uploadedPath}/${shopinfo.image}
							</c:if>
							<img align="middle"
								src="${applicationScope.uploadedPath}/${shopinfo.image}" class="img-rounded"
								width="36" height="36"> <br>${shopinfo.pname}</td>
						<td align="center">${shopinfo.c_qty} 개</td>
						<td align="center"><fmt:formatNumber value="${shopinfo.c_price}" pattern="###,###"/> 원</td>
						<td align="center">${shopinfo.c_point}원</td>
						<td align="center"><fmt:formatNumber value="${shopinfo.qty * shopinfo.price}" pattern="###,###"/> 원</td>
						<td align="center"><fmt:formatNumber value="${shopinfo.qty * shopinfo.point}" pattern="###,###"/> 원</td>
						<td align="center">
							<a href="<%=contextPath%>/delete.mall?pnum=${shopinfo.pnum}">
								삭제
							</a>
						</td>
					</tr>
				</c:forEach>
				<tr class="header">
			<td colspan="4" align="center">
				<a href="<%=contextPath%>/calculate.mall">결재하기</a>
				&nbsp;&nbsp; 
				<a href="<%=contextPath%>/list.pr">추가 주문</a>
			</td>
			<td colspan="4" align="center">
				총 금액 : <fmt:formatNumber value="${sessionScope.totalAmount}" pattern="###,###"/> 원
				&nbsp;
				총 누적 포인트 : <fmt:formatNumber value="${sessionScope.totalPoint}" pattern="###,###"/> 원
			</td>
		</tr>
			</table>
		</div>
	</div>
</body>
</html>