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
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${contextPath}/js/custInsert.js"></script>
<script type="text/javascript">
function checkDuplicateId(){ /* 아이디 중복 체크 */	
	var cust_Email = document.myform.cust_Email.value ;
	if(cust_Email.length < 8){
		alert('이메일은 최소 8자리 이상이어야 합니다.') ;
		document.myform.cust_Email.focus();
		return false ;
	}
	var url = '<%=contextPath%>/idcheck.cu?cust_Email=' + cust_Email  ;
	window.open(url, 'mywin', 'height=150,widht=300') ;			
};

function findZipcode(){ /* 우편 번호 찾기 */
	// alert('우편 번호 찾기') ;
	var url = '<%=contextPath%>/zipcheck.cu';
	window.open(url, 'mywin','height=450,width=600,statusbar=yes,scrollbars=yes,resizable=no');
	};

	function checkForm() { /* 회원 가입 버튼 클릭*/
		var isCheck = document.myform.isCheck.value;
		if (isCheck == 'false') {
			alert('아이디 중복 체크를 해주세요.');
			return false;
		}
	};

	function isCheckFalse() {
		/* 키보드에서 손을 떼면 호출이 되는데, isCheck를 false로 변경해 줍니다. */
		document.myform.isCheck.value = false;
	};
</script>
</head>
<body style="padding-bottom: 150px;">
	<div align="center" class="container col-sm-offset-2 col-sm-8">
		<div class="panel" align="center">
			<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">회원가입</h2>
			<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">필수 항목들을 반드시 작성해주세요!</p>
		</div>
		<div class="panel panel-body">
			<c:set var="apppath" value="<%=contextPath%>" />
			<form enctype="multipart/form-data" method="post"
				action="${apppath}/custInsert.cu" class="form-horizontal"
				role="form" name="myform" onsubmit="return chk_submit();">

				<%-- jsp 주석 : isCheck가 false이면 회원 가입이 불가능합니다. --%>
				<input type="text" name="isCheck" value="false">

				<!-- hidden으로 변경할 데이터 -->
				<input type="text" name="cust_Join" value="Y">

				<%-- 프로필사진, cust_Pic ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<div class="avatar-upload">
						<div id="imagePreview">
							<!-- 프로필사진 썸네일 -->
							<c:if test="${empty bean.cust_Pic}">
								<img src="https://2runcoffee.com/common/img/default_profile.png"
									class="avatar-preview" alt="no image">
							</c:if>
							<c:if test="${not empty bean.cust_Pic}">
								<img src="${contextPath}/upload/${bean.cust_Pic}"
									class="avatar-preview" width="200" height="200"
									alt="${bean.cust_Pic}">
							</c:if>
						</div>
						<!-- 프로필사진 업로드 -->
						<div class="avatar-edit">
							<input type="file" class="imageUpload" name="img" id="img"
								accept=".png, .jpg, .jpeg" /> <label for="imageUpload"></label>
						</div>
					</div>
				</div>
				<%-- cust_Email ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Email" class="col-sm-3" style="text-align: right">
						<spring:message code="customer.cust_Email" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Email" class="form-control"
							name="cust_Email" id="cust_Email" value="${cust_Email}"
							onkeyup="isCheckFalse();" /> <span class="valid_check"
							id="err_custEmail"></span>
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn"
							value="<spring:message code="customer.duplicatedId"/>"
							onclick="return checkDuplicateId();">
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
							value="${cust_PW}"> <span class="valid_check"
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
							name="cust_Name" id="cust_Name" value="${cust_Name}"> <span
							class="valid_check" id="err_custName"></span>
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
							name="cust_Contact" id="cust_Contact" value="${cust_Contact}">
						<span class="valid_check" id="err_custContact"></span>
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
							name="cust_Birth" id="cust_Birth" value="${cust_Birth}">
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
							value="${cust_Zipcode}" disabled="disabled"> <input
							type="hidden" name="cust_Zipcode" id="cust_Zipcode"
							value="${cust_Zipcode}">
					</div>
					<div class="col-sm-4">
						<input type="text" placeholder="Your Address" class="form-control"
							name="fakecust_ADR01" id="fakecust_ADR01" value="${cust_ADR01}"
							disabled="disabled"> <input type="hidden" id="cust_ADR01"
							name="cust_ADR01" style="text-align: left">
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
							value="${cust_ADR02}">
					</div>
				</div>
			</form>
		</div>
		<%-- 하단 버튼------------------------------------------------- --%>
			<div class="submit_btn col-sm-offset-3 col-sm-6">
				<p style="font-size: 10px; line-height: 12px;">
					<i class="fas fa-check-circle"></i>&nbsp;가입 시, 구매 이용약관, 원두 전자금융거래
					이용약관, <br />구매자 개인정보 수집 및 이용 동의에 대해 동의합니다.
				</p>
				<button type="submit" id="submit" class="submit" data-toggle="modal"
					data-target="#myModal" onclick="return checkForm();">동의하고
					가입하기</button>
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