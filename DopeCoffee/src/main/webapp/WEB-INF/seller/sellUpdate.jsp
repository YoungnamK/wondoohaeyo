<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/css/custInsert-style.css">
<script type="text/javascript" src="${contextPath}/js/sellUpdate.js"></script>
<script type="text/javascript">
	/* 우편 번호 찾기 */
	function findZipcode(){ 
		var url = '<%=contextPath%>/zipcheck.se';
		window.open(url, 'mywin','height=500,width=650,statusbar=yes,scrollbars=yes,resizable=no');
	};
</script>
</head>
<body style="padding-bottom: 150px;">
	<div align="center" class="container col-sm-offset-2 col-sm-8">
		<div class="panel" align="center">
			<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">사업자 정보 수정</h2>
			<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">사업자 정보 수정 페이지입니다.</p>
			<!-- 회원탈퇴 ----------------------------------------------------- -->
			<div class="delete">
				<a href="${contextPath}/sellDel.se?sell_Email=${bean.sell_Email}">
					회원탈퇴</a>
			</div>
		</div>
		<div class="panel panel-body">
			<c:set var="apppath" value="<%=contextPath%>" />
			<%-- form태그 시작 ------------------------------------------------- --%>
			<form method="post" action="${apppath}/sellUpdate.se"
				class="form-horizontal" role="form" name="myform"
				onsubmit="return chk_submit();">
				<%-- sell_Email ------------------------------------------------- --%>
				<%-- 중복 체크 기능이 필요없습니다. --%>
				<%-- 이메일은 읽기 전용으로 설정하고, 숨겨서 넘기도록 합니다. --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Email" class="col-sm-3" style="text-align: right">
						<spring:message code="seller.sell_Email" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Email" class="form-control"
							name="fakesell_Email" id="fakesell_Email"
							value="${bean.sell_Email}" disabled="disabled" /> <input
							type="hidden" name="sell_Email" id="sell_Email"
							value="${bean.sell_Email}">
					</div>
				</div>
				<%-- sell_PW ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_PW" class="col-sm-3" style="text-align: right">
						<spring:message code="seller.sell_PW" />*
					</label>
					<div class="col-sm-6">
						<input type="password" placeholder="Your Password"
							class="form-control" name="sell_PW" id="sell_PW"
							value="${bean.sell_PW}"> <span class="valid_check"
							id="err_sellPW"></span>
					</div>
				</div>
				<%-- sell_Name ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Name" class="col-sm-3" style="text-align: right">
						<spring:message code="seller.sell_Name" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Name" class="form-control"
							name="sell_Name" id="sell_Name" value="${bean.sell_Name}">
						<span class="valid_check" id="err_sellName"></span>
					</div>
				</div>
				<%-- sell_Contact ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Contact" class="col-sm-3"
						style="text-align: right"> <spring:message
							code="seller.sell_Contact" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Contact" class="form-control"
							name="sell_Contact" id="sell_Contact"
							value="${bean.sell_Contact}"> <span class="valid_check"
							id="err_sellContact"></span>
					</div>
				</div>
				<%-- sell_Zipcode & sell_ADR01------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Zipcode" class="col-sm-3"
						style="text-align: right"> <spring:message
							code="seller.sell_ADR01" />
					</label>
					<div class="col-sm-2">
						<input type="text" placeholder="Zipcode" class="form-control"
							name="fakesell_Zipcode" id="fakesell_Zipcode"
							value="${bean.sell_Zipcode}" disabled="disabled"> <input
							type="hidden" name="sell_Zipcode" id="sell_Zipcode"
							value="${bean.sell_Zipcode}">
					</div>
					<div class="col-sm-4">
						<input type="text" placeholder="Your Address" class="form-control"
							name="fakesell_ADR01" id="fakesell_ADR01"
							value="${bean.sell_ADR01}" disabled="disabled"> <input
							type="hidden" id="sell_ADR01" name="sell_ADR01" value="${bean.sell_ADR01}"
							style="text-align: left">
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn"
							value="<spring:message code="seller.findZipcode"/>"
							onclick="javascript:findZipcode();">
					</div>
				</div>
				<%-- sell_ADR02 ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_ADR02" class="col-sm-3" style="text-align: right">
						<spring:message code="seller.sell_ADR02" />
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Detail Address"
							class="form-control" name="sell_ADR02" id="sell_ADR02"
							value="${bean.sell_ADR02}">
					</div>
				</div>
				<%-- 하단 버튼------------------------------------------------- --%>
				<div class="submit_btn col-sm-offset-3 col-sm-6">
					<button type="submit" class="submit" id="sellup-submit">수정
						완료</button>
				</div>
			</form>
			<%-- form태그 끝 ------------------------------------------------- --%>
		</div>
	</div>
	<!-- ------------------------------------- [모달 section]--------------------------------------- -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="modal-title" class="modal-title" style="font-size: 35px"></h4>
					</div>
					<div class="modal-body">
						<p id="modal-body" style="font-size: 13px"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="loginGo_btn btn-default"
							data-dismiss="modal" style="font-size: 13px">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>