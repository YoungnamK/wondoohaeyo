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
	var cust_Email = document.myform.cust_Email.value ;	
	if(cust_Email.length < 8){
		alert('이메일은 최소 8자리 이상이어야 합니다.') ;
		document.myform.cust_Email.focus();
		return false ;
	}
	var url = '<%=contextPath%>/idcheck.cu?cust_Email=' + cust_Email  ;
	window.open(url, 'mywin', 'height=150,widht=300') ;			
	}
	
	 /* 회원 가입 버튼 클릭*/
	function checkForm(){
		var isCheck = document.myform.isCheck.value ;
		if(isCheck == 'false'){
			alert('이메일 중복확인을 해주세요.');	
			return false ;	
		}
	}
	 
	/* 키보드에서 손을 떼면 호출이 되는데, isCheck를 false로 변경해 줍니다. */
	function isCheckFalse() {
		document.myform.isCheck.value = false ;
	}
	
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
<%--<h2><spring:message code="customer.register01"/></h2> --%>
	<div class="panel panel-default">
		<div class="panel" align="center">
			<font color="#84C1D9" size="12px">
				Sign Up
			</font>
		</div>
		<br><br>
		<div class="panel panel-body">
			<c:set var="apppath" value="<%=contextPath%>"/>
			<form:form modelAttribute="customer" method="post" action="${apppath}/custInsert.cu"
				class="form-horizontal" role="form" name="myform" > 
				
				<%-- jsp 주석 : isCheck가 false이면 회원 가입이 불가능합니다. --%>
				<input type="hidden" name="isCheck" value="false">
				<input type="hidden" name="cust_Pic" value="">
				<input type="hidden" name="cust_RegDate" value="">
				<input type="hidden" name="cust_Join" value="Y">
				<input type="hidden" name="remark" value="">
				
				
				<%-- cust_Email ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Email" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_Email"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Email" class="form-control" name="cust_Email" id="cust_Email"
						value="${cust_Email}"
						onkeyup="isCheckFalse();" /> 
						<form:errors path="cust_Email" cssClass="err" /> 
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn" 
							value="<spring:message code="customer.duplicatedId"/>"
							onclick="return checkDuplicateId();" > 
					</div>		
				</div>
				
				<%-- cust_PW ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_PW" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_PW"/>
					</label>
					<div class="col-sm-6">
						<input type="password" placeholder="Your Password" class="form-control" name="cust_PW" id="cust_PW"
						value="${cust_PW}">
						<form:errors path="cust_PW" cssClass="err" /> 
					</div>
				</div>
				
				<%-- cust_PW 확인 ------------------------------------------------- 
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_PW" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_PW2"/>
					</label>
					<div class="col-sm-6">
						<input type="password" placeholder="Check Password" class="form-control" name="cust_PW" id="cust_PW"
						value="${cust_PW}">
						<form:errors path="cust_PW" cssClass="err" /> 
					</div>
				</div>--%>
				
				<%-- cust_Name ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Name" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_Name"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Name" class="form-control" name="cust_Name" id="cust_Name"
						value="${cust_Name}">
						<form:errors path="cust_Name" cssClass="err" /> 
					</div>
				</div>
				
				<%-- cust_Contact ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Contact" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_Contact"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Contact" class="form-control" name="cust_Contact" id="cust_Contact"
						value="${cust_Contact}">
						<form:errors path="cust_Contact" cssClass="err" /> 
					</div>
				</div>
				
				<%-- cust_Birth ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Birth" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_Birth"/>
					</label>
					<div class="col-sm-6">
						<input type="number" placeholder="YYMMDD" class="form-control" name="cust_Birth" id="cust_Birth"
						value="${cust_Birth}">
						<form:errors path="cust_Birth" cssClass="err" /> 
					</div>
				</div>
				
				<%-- cust_Zipcode & cust_ADR01------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_Zipcode" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_ADR01"/>
					</label>
					<div class="col-sm-2">
						<input type="text" placeholder="Zipcode" class="form-control" name="fakecust_Zipcode" id="fakecust_Zipcode"
						value="${cust_Zipcode}" disabled="true">
						<input type="hidden" name="cust_Zipcode" id="cust_Zipcode" value="${cust_Zipcode}">
						<form:errors path="cust_Zipcode" cssClass="err" /> 
					</div>
                    <div class="col-sm-4">
						<input type="text" placeholder="Your Address" class="form-control" name="fakecust_ADR01" id="fakecust_ADR01"
						value="${cust_ADR01}" disabled="true">
						<input type="hidden" id="cust_ADR01" name="cust_ADR01" style="text-align:left">
						<form:errors path="cust_ADR01" cssClass="err" /> 
					</div>
					<div class="col-sm-3" align="left">
						<input type="button" class="btn" 
							value="<spring:message code="customer.findZipcode"/>" 
							onclick="javascript:findZipcode();"> 
					</div>
				</div>
				
				<%-- cust_ADR02 ------------------------------------------------- --%>
				<div class="form-group wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay=".6s">
					<label for="cust_ADR02" class="col-sm-3" style="text-align:right">
						<spring:message code="customer.cust_ADR02"/>
					</label>
					<div class="col-sm-6">
						<input type="text" placeholder="Your Detail Address" class="form-control" name="cust_ADR02" id="cust_ADR02"
						value="${cust_ADR02}">
						<form:errors path="cust_ADR02" cssClass="err" /> 
					</div>
				</div>
				
				<br><br>
				<%-- 하단 버튼------------------------------------------------- --%>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-6">
						<button type="text" class="submit">동의하고 가입하기</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
</body>


</html>