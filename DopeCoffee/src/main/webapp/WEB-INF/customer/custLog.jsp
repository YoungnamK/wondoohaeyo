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
<link rel="stylesheet" href="${contextPath}/css/custLog-style.css">
<script type="text/javascript">

	
	function logincheck(){
		var cust_Email = $('#cust_Email').val();
		var cust_PW = $('#cust_PW').val();
		if(cust_Email == '' || cust_PW == ''){
			$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
			$('#modal-body').text('입력한 값을 확인하세요!');
			return false;
		} else {
			return true; 
			}
	}

</script>
</head>
<body>
<div align="center" class="container col-md-12">
	<form class="form-horizontal" role="form" action="<%=contextPath%>/custLog.cu" method="post">

                <div class="wrappercontainer">
			      
			      <div class="signup">개인회원</div>
			      <div class="login">사업자회원</div>
			      
			      <%-- 개인회원 로그인 -------------------------------------------------- --%>
			       <div class="signup-form">
			       	<%-- email --%>
			          <input type="text" placeholder="Your Email Address" 
			          class="input" name="cust_Email" id="cust_Email"
			          data-toggle="tooltip" data-placement="top" 
						title="이메일을 입력해주세요." value="">
			         <span class="err">${errid}</span>
			         <br />
			         
			         <%-- password --%>
			          <input type="password" placeholder="Password" 
			          data-toggle="tooltip" data-placement="top" 
						title="비밀번호를 입력해주세요." value=""
			          class="input" name="cust_PW" id="cust_PW">                     
			          <span class="err">${errpassword}</span>
					   <br />	   
					          
			          <button class="btn" type="submit" data-toggle="modal" data-target="#myModal" onclick="return logincheck();">Sign In</button>
			          <button class="btn_kakao" type="submit">Kakao Account</button>
			          
			       </div>
			
			       <%-- 사업자회원 로그인 -------------------------------------------------- --%>
<%-- 			      <div class="login-form">
			          <input type="text" placeholder="Your Email Address" class="input">
			        <br/>
			          <input type="password" placeholder="Password" class="input"><br />
			          <div class="btn">로그인</div>
			          <span><a href="<%=contextPath%>/sellIdSearch.cu">I forgot my username</a></span>
			          <span><a href="<%=contextPath%>/sellPWSearch.cu">I forgot my password</a></span>
			       </div> --%>
			  	</div>
			  	</form>
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
	          <button type="button" class="btn btn-default" data-dismiss="modal" style="font-size: 13px">닫기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function(){
    		$('[data-toggle="tooltip"]').tooltip();    		
		});
	</script>
</body>
</html>