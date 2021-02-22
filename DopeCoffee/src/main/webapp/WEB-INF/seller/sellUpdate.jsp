<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/common.jsp" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<link rel="stylesheet" href="${contextPath}/css/custInsert-style.css">
<script type="text/javascript">

	/* 아이디 중복 체크 */
	function checkDuplicateId(){ 	
	var sell_Email = document.myform.sell_Email.value ;	
	if(sell_Email.length < 8){
		alert('이메일은 최소 8자리 이상이어야 합니다.') ;
		document.myform.sell_Email.focus();
		return false ;
	}
	
	var url = '<%=contextPath%>/idcheck.cu?sell_Email=' + sell_Email  ;
	window.open(url, 'mywin', 'height=150,widht=300') ;			
	}

	/* 회원 가입 버튼 클릭*/
/* 	function checkForm(){
		var isCheck = document.myform.isCheck.value ;
		if(isCheck == 'false'){
			alert('이메일 중복확인을 해주세요.');	
			return false ;	
		}
	} */
	 
	/* 키보드에서 손을 떼면 호출이 되는데, isCheck를 false로 변경해 줍니다. */
/* 	function isCheckFalse() {
		document.myform.isCheck.value = false ;
	} */

	/* 우편 번호 찾기 */
	function findZipcode(){ 
		// alert('우편 번호 찾기') ;
		var url = '<%=contextPath%>/zipcheck.cu'  ;
		window.open(url, 'mywin', 'height=500,width=650,statusbar=yes,scrollbars=yes,resizable=no') ;
	}

</script>
</head>
<body>
<div align="center" class="container col-sm-offset-2 col-sm-8">
	<div class="panel">
		<div class="panel" align="center">
	<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
	data-wow-delay="0.3s">사업자 정보 수정</h2>
	<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.3s">
		사업자 정보 수정 페이지입니다.
	</p>
		</div>
		<div class="panel panel-body">		
<%--		<form class="form-horizontal" role="form" name="myform" action="<%=YesForm%>" method="post">
			<input type="hidden" name="command" value="custUpdate.cu">--%>		
			
			<c:set var="apppath" value="<%=contextPath%>"/>
			<form:form modelAttribute="seller" method="post" action="${apppath}/sellUpdate.se"
				class="form-horizontal" role="form" name="myform" >  
				
				<%-- jsp 주석 : isCheck가 false이면 회원 가입이 불가능합니다. --%>
				<input type="text" name="sell_Status" value="신청전">
				<input type="text" name="sell_Join" value="Y">
				
				<%-- sell_Email ------------------------------------------------- --%>
				<%-- 중복 체크 기능이 필요없습니다. --%>
			 	<%-- 이메일은 읽기 전용으로 설정하고, 숨겨서 넘기도록 합니다. --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Email" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_Email"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Email" class="form-control" name="fakesell_Email" id="fakesell_Email"
						value="${seller.sell_Email}" disabled="disabled"/>
					</div>
				</div>
				
				<%-- sell_PW ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_PW" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_PW"/>
					</label>
					<div class="col-sm-6">
						<input type="password" placeholder="Your Password" class="form-control" name="sell_PW" id="sell_PW"
						value="${sell_PW}">
						<form:errors path="sell_PW" cssClass="err" /> 
					</div>
				</div>
				
				<%-- sell_PW 확인 ------------------------------------------------- --%>
<%-- 				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_PW" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_PW2"/>
					</label>
					<div class="col-sm-6">
						<input type="password" placeholder="Check Password" class="form-control" name="sell_PW" id="sell_PW"
						value="${sell_PW}">
						<form:errors path="sell_PW" cssClass="err" /> 
					</div>
				</div> --%>
				
				<%-- sell_Name ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Name" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_Name"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Name" class="form-control" name="sell_Name" id="sell_Name"
						value="${sell_Name}">
						<form:errors path="sell_Name" cssClass="err" /> 
					</div>
				</div>
				
				<%-- sell_License ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_License" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_License"/>
					</label>
					<div class="col-sm-6">
						<input type="number" placeholder="Business License Number" class="form-control" name="sell_License" id="sell_License"
						value="${sell_License}">
						<form:errors path="sell_License" cssClass="err" /> 
					</div>
				</div>
				
				<%-- sell_Contact ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Contact" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_Contact"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Contact" class="form-control" name="sell_Contact" id="sell_Contact"
						value="${sell_Contact}">
						<form:errors path="sell_Contact" cssClass="err" /> 
					</div>
				</div>

				<%-- sell_Zipcode & sell_ADR01------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_Zipcode" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_ADR01"/>
					</label>
					<div class="col-sm-2">
						<input type="text" placeholder="Zipcode" class="form-control" name="fakesell_Zipcode" id="fakesell_Zipcode"
						value="${seller.sell_Zipcode}" disabled="disabled">
						<input type="hidden" name="sell_Zipcode" id="sell_Zipcode" value="${seller.sell_Zipcode}">
						<form:errors path="sell_Zipcode" cssClass="err" /> 
					</div>
                    <div class="col-sm-4">
						<input type="text" placeholder="Your Address" class="form-control" name="fakesell_ADR01" id="fakesell_ADR01"
						value="${seller.sell_ADR01}" disabled="disabled">
						<input type="hidden" id="sell_ADR01" name="sell_ADR01" style="text-align:left">
						<form:errors path="sell_ADR01" cssClass="err" /> 
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn" 
							value="<spring:message code="seller.findZipcode"/>" 
							onclick="javascript:findZipcode();"> 
					</div>
				</div>
				
				<%-- sell_ADR02 ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="sell_ADR02" class="col-sm-3" style="text-align:right">
						<spring:message code="seller.sell_ADR02"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Detail Address" class="form-control" name="sell_ADR02" id="sell_ADR02"
						value="${sell_ADR02}">
						<form:errors path="sell_ADR02" cssClass="err" /> 
					</div>
				</div>
				<br><br>
				<%-- 하단 버튼------------------------------------------------- --%>
				<div class="form-group">
					<div class="submit_btn col-sm-offset-3 col-sm-6">
						<button type="submit" class="submit">수정 완료</button>
					</div>
				</div>
<%--			</form>--%>
 			</form:form>
 		</div>
	</div>
</div>
</body>


</html>