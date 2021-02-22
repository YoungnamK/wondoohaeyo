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
<script type="text/javascript" src="${contextPath}/js/login.js"></script>
<link rel="stylesheet" href="${contextPath}/css/custLog-style.css">
</head>
<body>
<div align="center" class="container col-md-12">
    <div class="cd-tabs">
      <nav>
        <ul class="cd-tabs-navigation">
          <li><a href="#" data-content="login" class="selected">개인회원</a></li>
          <li><a href="#" data-content="signup">사업자회원</a></li>
        </ul>
      </nav>
      <ul class="cd-tabs-content">
        <li data-content="login" class="selected">
          <form name="login-form" action="<%=contextPath%>/custLog.cu" method="post">
            <div class="form-fild">
              <input type="text" placeholder="Email Address" class="input" name="cust_Email" id="cust_Email"
                            data-toggle="tooltip" data-placement="top" title="이메일을 입력해주세요." value="">
            </div>
            <div class="form-fild">
              <input type="password" placeholder="Password" class="input" name="cust_PW" id="cust_PW"
                            data-toggle="tooltip" data-placement="top" title="비밀번호를 입력해주세요." value="">                     
            </div>
            
            <span class="error"></span>

            <div class="keepcheck">
				<input type="checkbox" id="remember">
	            <label for="remember">이메일 저장</label>
            </div>

            <button type="submit"  data-toggle="modal" data-target="#myModal" onclick="return logincheck();">로그인</button>
	         
	         <div class="search">
	          	<span><a href="<%=contextPath%>/custIdSearch.cu">I forgot my email</a></span>
				<span><a href="<%=contextPath%>/custPWSearch.cu">I forgot my password</a></span>
          	</div>
          	
          	<hr>
          	<div class="social"> <span>or sign up with social media</span></div>
          	<div class="buttons">
			    <button class="facebook"><i class="fa fa-facebook"></i>Facebook</button>
			    <button class="kakao"><i class="fa fa-comments-o"></i>Kakao</button>
			    <button class="google"><i class="fa fa-google-plus"></i>Google</button>
			 </div>
          
          </form>
        </li>
        
        <li data-content="signup">
          <form name="signup-form" action="<%=contextPath%>/sellLog.se" method="post">
            <div class="form-fild">
              <input type="text" placeholder="Business Email Address" class="input" name="sell_Email" id="sell_Email"
                            data-toggle="tooltip" data-placement="top" title="이메일을 입력해주세요." value="">
            </div>
            <div class="form-fild">
               <input type="password" placeholder="Password" class="input" name="sell_PW" id="sell_PW"
                            data-toggle="tooltip" data-placement="top" title="비밀번호를 입력해주세요." value="">                     
            </div>
            <div class="keepcheck">
			<input type="checkbox" id="remember">
            <label for="remember">이메일 저장</label>
            </div>
            <span class="error"></span>
            <button type="submit"  data-toggle="modal" data-target="#myModal" onclick="return logincheck();">로그인</button>
            
            <br>
          	<span><a href="<%=contextPath%>/sellIdSearch.se">I forgot my email</a></span>
			<span><a href="<%=contextPath%>/sellPWSearch.se">I forgot my password</a></span>
          </form>
        </li>
      </ul>
    </div> <!-- end cd-tabs -->
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

</body>
</html>