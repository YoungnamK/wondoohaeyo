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
<script type="text/javascript" src="${contextPath}/js/custUpdate.js"></script>
<script type="text/javascript">
	/* 우편 번호 찾기 */
	function findZipcode(){ 
		// alert('우편 번호 찾기') ;
		var url = '<%=contextPath%>/zipcheck.cu';
		window.open(url, 'mywin','height=500,width=650,statusbar=yes,scrollbars=yes,resizable=no');
	};
</script>
</head>

<body style="padding-bottom: 150px;">
	<div align="center" class="container col-sm-offset-2 col-sm-8">
		<div class="panel" align="center">
			<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">회원 정보 수정</h2>
			<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">회원 정보 수정 페이지입니다.</p>
			<!-- 회원탈퇴 ----------------------------------------------------- -->
			<div class="delete">
				<a href="${contextPath}/custDel.cu?cust_Email=${bean.cust_Email}">
					회원탈퇴</a>
			</div>
		</div>
		<div class="panel panel-body">
			<c:set var="apppath" value="<%=contextPath%>" />
			<%-- form태그 시작 ------------------------------------------------- --%>
			<form method="post" enctype="multipart/form-data"
				action="${apppath}/custUpdate.cu" class="form-horizontal"
				role="form" name="myform" onsubmit="return chk_submit();">
				<!-- hidden으로 넘길 데이터 ------------------------------------------------- -->
				<input type="hidden" name="isCheck" value="false"> <input
					type="hidden" name="cust_Join" value="Y">

				<%-- 프로필사진, cust_Pic ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<div class="avatar-upload">
						<div id="imagePreview">
							<c:if test="${empty bean.cust_Pic}">
								<img src="https://2runcoffee.com/common/img/default_profile.png"
									class="avatar-preview" alt="no image">
							</c:if>
							<c:if test="${not empty bean.cust_Pic}">
								<img src="${contextPath}/upload/${bean.cust_Pic}"
									class="avatar-preview" width="200" height="200"
									alt="${cust_Pic}">
							</c:if>
						</div>

						<div class="avatar-edit">
							<input name="cust_Pic" type="hidden" value="${bean.cust_Pic}">
							기존 이미지 : <input type="text" name="oldimg"
								value="${bean.cust_Pic}"> <input type="file"
								class="imageUpload" name="img" id="img"
								placeholder="파일을 선택하지 않으면 기존 이미지가 유지됩니다."> <label
								for="imageUpload"></label>
						</div>
					</div>
				</div>
				<%-- cust_Email ------------------------------------------------- --%>
				<%-- 중복 체크 기능이 필요없습니다. --%>
				<%-- 이메일은 읽기 전용으로 설정하고, 숨겨서 넘기도록 합니다. --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Email" class="col-sm-3" style="text-align: right">
						<spring:message code="customer.cust_Email" />*
					</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="fakecust_Email"
							id="fakecust_Email" value="${bean.cust_Email}"
							disabled="disabled" /> <input type="hidden" name="cust_Email"
							id="cust_Email" value="${bean.cust_Email}">
					</div>
				</div>
				<%-- cust_PW ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_PW" class="col-sm-3" style="text-align: right">
						<spring:message code="customer.cust_PW" />*
					</label>
					<div class="col-sm-6">
						<input type="password" placeholder="Your Password"
							class="form-control" name="cust_PW" id="cust_PW"
							value="${bean.cust_PW}"> <span class="valid_check"
							id="err_custPW"></span>
					</div>
				</div>
				<%-- cust_Name ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Name" class="col-sm-3" style="text-align: right">
						<spring:message code="customer.cust_Name" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Name" class="form-control"
							name="cust_Name" id="cust_Name" value="${bean.cust_Name}">
						<span class="valid_check" id="err_custName"></span>
					</div>
				</div>
				<%-- cust_Contact ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Contact" class="col-sm-3"
						style="text-align: right"> <spring:message
							code="customer.cust_Contact" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Contact" class="form-control"
							name="cust_Contact" id="cust_Contact"
							value="${bean.cust_Contact}"> <span class="valid_check"
							id="err_custContact"></span>
					</div>
				</div>
				<%-- cust_Birth ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Birth" class="col-sm-3" style="text-align: right">
						<spring:message code="customer.cust_Birth" />*
					</label>
					<div class="col-sm-6">
						<input type="number" placeholder="YYMMDD" class="form-control"
							name="cust_Birth" id="cust_Birth" value="${bean.cust_Birth}">
						<span class="valid_check" id="err_custBirth"></span>
					</div>
				</div>
				<%-- cust_Zipcode & cust_ADR01------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Zipcode" class="col-sm-3"
						style="text-align: right"> <spring:message
							code="customer.cust_ADR01" />
					</label>
					<div class="col-sm-2">
						<input type="text" placeholder="Zipcode" class="form-control"
							name="fakecust_Zipcode" id="fakecust_Zipcode"
							value="${bean.cust_Zipcode}" disabled="disabled"> <input
							type="hidden" name="cust_Zipcode" id="cust_Zipcode"
							value="${bean.cust_Zipcode}">
					</div>
					<div class="col-sm-4">
						<input type="text" placeholder="Your Address" class="form-control"
							name="fakecust_ADR01" id="fakecust_ADR01"
							value="${bean.cust_ADR01}" disabled="disabled"> <input
							type="hidden" id="cust_ADR01" value="${bean.cust_ADR01}" name="cust_ADR01"
							style="text-align: left">
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn"
							value="<spring:message code="customer.findZipcode"/>"
							onclick="javascript:findZipcode();">
					</div>
				</div>
				<%-- cust_ADR02 ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_ADR02" class="col-sm-3" style="text-align: right">
						<spring:message code="customer.cust_ADR02" />
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Detail Address"
							class="form-control" name="cust_ADR02" id="cust_ADR02"
							value="${bean.cust_ADR02}">
					</div>
				</div>
				<%-- 하단 버튼------------------------------------------------- --%>
				<div class="submit_btn col-sm-offset-3 col-sm-6">
					<button type="submit" class="submit" id="cust-submit"
						data-toggle="modal" data-target="#myModal">수정 완료</button>
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