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
<script type="text/javascript" src="${contextPath}/js/sellInsert.js"></script>
<script type="text/javascript">
function checkDuplicateId(){ /* 아이디 중복 체크 */	
	var sell_Email = document.myform.sell_Email.value;
	if(sell_Email.length < 8){
		alert('이메일은 최소 8자리 이상이어야 합니다.');
		document.myform.sell_Email.focus();
		return false;
	}
	var url = '<%=contextPath%>/idcheck.se?sell_Email=' + sell_Email;
	window.open(url, 'mywin', 'height=150,widht=300');			
};

function findZipcode(){ /* 우편 번호 찾기 */
	// alert('우편 번호 찾기') ;
	var url = '<%=contextPath%>/zipcheck.se';
		window.open(url, 'mywin','height=450,width=600,statusbar=yes,scrollbars=yes,resizable=no');
	};

	function checkForm() { /* 회원 가입 버튼 클릭*/
		var isCheck = document.myform.isCheck.value;
		if (isCheck == 'false') {
			alert('이메일 중복 체크를 해주세요.');
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
				data-wow-delay="0.3s">사업자 회원가입</h2>
			<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
				data-wow-delay="0.3s">필수 항목들을 반드시 작성해주세요!</p>
		</div>
		<div class="panel panel-body">
			<c:set var="apppath" value="<%=contextPath%>" />
			<%-- form태그 시작 ------------------------------------------------- --%>			
			<form method="post" action="${apppath}/sellInsert.se"
				class="form-horizontal" role="form" name="myform"
				onsubmit="return chk_submit();">

				<%-- jsp 주석 : isCheck가 false이면 회원 가입이 불가능합니다. --%>
				<input type="text" name="isCheck" value="false">

				<!-- hidden으로 변경할 데이터 -->
				<input type="text" name="sell_Status" value="신청전"> 
				<input type="text" name="sell_Join" value="Y">

				<%-- sell_Email ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Email" class="col-sm-3" style="text-align: right">
						<spring:message code="seller.sell_Email" />*
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Email" class="form-control"
							name="sell_Email" id="sell_Email" value="${sell_Email}"
							onkeyup="isCheckFalse();" /> 
							<span class="valid_check" id="err_sellEmail"></span>
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn"
							value="<spring:message code="seller.duplicatedId"/>"
							onclick="return checkDuplicateId();">
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
							value="${sell_PW}"> 
							<span class="valid_check" id="err_sellPW"></span>
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
							name="sell_Name" id="sell_Name" value="${sell_Name}"> 
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
							name="sell_Contact" id="sell_Contact" value="${sell_Contact}">
						<span class="valid_check" id="err_sellContact"></span>
					</div>
				</div>

				<%-- sell_Zipcode & sell_ADR01------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Zipcode" class="col-sm-3"
						style="text-align: right"> 
						<spring:message code="seller.sell_ADR01" />
					</label>
					<div class="col-sm-2">
						<input type="text" placeholder="Zipcode" class="form-control"
							name="fakesell_Zipcode" id="fakesell_Zipcode"
							value="${sell_Zipcode}" disabled="disabled"> 
							<input type="hidden" name="sell_Zipcode" id="sell_Zipcode" value="${sell_Zipcode}">
					</div>
					<div class="col-sm-4">
						<input type="text" placeholder="Your Address" class="form-control"
							name="fakesell_ADR01" id="fakesell_ADR01" value="${sell_ADR01}"
							disabled="disabled"> 
							<input type="hidden" id="sell_ADR01" name="sell_ADR01" style="text-align: left">
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
							value="${sell_ADR02}">
					</div>
				</div>
				<%-- 하단 버튼------------------------------------------------- --%>
				<div class="col-sm-offset-3 col-sm-6">
					<p style="font-size: 10px; line-height: 12px;">
						<i class="fas fa-check-circle"></i>&nbsp;가입 시, 판매 이용약관, 원두 전자금융거래
						이용약관, <br />판매자 개인정보 수집 및 이용 동의에 대해 동의합니다.
					</p>
					<button type="submit" id="sell-submit" class="submit"
						data-toggle="modal" data-target="#myModal"
						onclick="return checkForm();">동의하고 가입하기</button>
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