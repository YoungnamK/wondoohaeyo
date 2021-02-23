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
			${sessionScope.loginfo.cust_Name}&nbsp;회원님의 가입 정보입니다.
		</p>
		</div>
		<div class="panel panel-body">
			<table class="table table-condendes table-striped" >
				<%-- cust_Email ------------------------------------------------- --%>
					<tr>
						<td width="25%"><label for="cust_PW" style="text-align:right">
							<spring:message code="customer.cust_Email"/>
						</label>
						</td>
						<td width="75%">
							${sessionScope.loginfo.cust_Email}
						</td>
					</tr>

				<%-- cust_Name ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="cust_Name" style="text-align:right">
							<spring:message code="customer.cust_Name"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.cust_Name}
					</td>
				</tr>
				<%-- cust_Contact ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="cust_Contact" style="text-align:right">
							<spring:message code="customer.cust_Contact"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.cust_Contact}
					</td>
				</tr>

				<%-- cust_Birth ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="cust_Birth" style="text-align:right">
							<spring:message code="customer.cust_Birth"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.cust_Birth}
					</td>
				</tr>
				
				<%-- cust_Zipcode ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="cust_Zipcode" style="text-align:right">
							<spring:message code="customer.cust_Zipcode"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.cust_Zipcode}
					</td>
				</tr>

				<%-- cust_ADR01 ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="cust_ADR01" style="text-align:right">
							<spring:message code="customer.cust_ADR01"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.cust_ADR01}
					</td>
				</tr>

				<%-- cust_ADR02 ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="cust_ADR02" style="text-align:right">
							<spring:message code="customer.cust_ADR02"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.cust_ADR02}
					</td>
				</tr>

                <%-- savepoint ------------------------------------------------- --%>
				<tr>
					<td width="25%">
						<label for="savepoint" style="text-align:right">
							<spring:message code="customer.savepoint"/>
					</label>
					</td>
					<td width="75%">
							${sessionScope.loginfo.savepoint}
					</td>
				</tr>
			</table>
		</div>
			<%-- 하단 버튼------------------------------------------------- --%>
			<div class="submit_btn col-sm-offset-3 col-sm-6">
			<button class="submit" onclick="location.href='${contextPath}/custUpdate.cu' ">회원정보 수정하기</button>
		</div>
	</div>
</div>
<br><br><br>
</body>
</html>