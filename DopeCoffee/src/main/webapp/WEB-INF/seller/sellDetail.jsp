<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="./../common/common.jsp"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3 ;
	int formright = twelve - formleft ; 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/css/custInsert-style.css">
</head>
<body>

<div align="center" class="container col-sm-offset-2 col-sm-8">
	<div class="panel">
		<div class="panel" align="center">
		<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
		data-wow-delay="0.3s">마이페이지</h2>
		<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.3s">
			${sessionScope.loginfo_seller.sell_Name}&nbsp;사업자님의 가입 정보입니다.
		</p>
		</div>
		<div class="panel panel-body">
			<table class="table table-condendes table-striped" >
				<%-- sell_Email ------------------------------------------------- --%>
					<tr>
						<td width="25%"><label for="sell_PW" style="text-align:right">
							<spring:message code="seller.sell_Email"/>
						</label>
						</td>
						<td width="75%">
							${sessionScope.loginfo_seller.sell_Email}
						</td>
					</tr>

				<%-- sell_Name ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_Name" style="text-align:right">
							<spring:message code="seller.sell_Name"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_Name}
					</td>
				</tr>
				<%-- sell_Contact ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_Contact" style="text-align:right">
							<spring:message code="seller.sell_Contact"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_Contact}
					</td>
				</tr>

				<%-- sell_License ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_Birth" style="text-align:right">
							<spring:message code="seller.sell_License"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_License}
					</td>
				</tr>
				
				<%-- sell_Zipcode ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_Zipcode" style="text-align:right">
							<spring:message code="seller.sell_Zipcode"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_Zipcode}
					</td>
				</tr>

				<%-- sell_ADR01 ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_ADR01" style="text-align:right">
							<spring:message code="seller.sell_ADR01"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_ADR01}
					</td>
				</tr>

				<%-- sell_ADR02 ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_ADR02" style="text-align:right">
							<spring:message code="seller.sell_ADR02"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_ADR02}
					</td>
				</tr>

                <%-- savepoint ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="sell_Status" style="text-align:right">
							<spring:message code="seller.sell_Status"/>
					</label>
					</td>
					<td width="75%">
						${sessionScope.loginfo_seller.sell_Status}
					</td>
				</tr>
			</table>
		</div>
			<%-- 하단 버튼------------------------------------------------- --%>
			<div class="submit_btn col-sm-offset-3 col-sm-6">
			<button class="submit" onclick="location.href='${contextPath}/sellUpdate.se' ">사업자정보 수정하기</button>
			</div>
	</div>
</div>
<br><br><br>
</body>
</html>