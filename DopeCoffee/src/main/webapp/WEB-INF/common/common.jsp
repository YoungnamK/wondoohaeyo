<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
   String contextPath = request.getContextPath();
%>
<c:set var="contextPath" value="<%=contextPath%>" scope="application" />

<!-- whologin 변수는 로그인 상태를 저장하고 있는 변수입니다. -->
<c:set var="whologin" value="0" />
<c:if test="${empty sessionScope.loginfo}">
   <!-- 로그인 하지 않은 경우 (비회원)-->
   <c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
   <c:if test="${sessionScope.loginfo.cust_email == 'admin@gmail.com'}">
      <!-- 관리자로 로그인한 경우 -->
      <c:set var="whologin" value="1" />
   </c:if>
   <c:if test="${not empty sessionScope.loginfo.cust_email}">
      <!-- 사업자로 로그인한 경우 -->
      <c:set var="whologin" value="2" />
   </c:if>
   <c:if test="${sessionScope.loginfo.cust_email != 'admin@gmail.com'}">
      <!-- 일반 사용자로 로그인한 경우 -->
      <c:set var="whologin" value="3" />
   </c:if>
</c:if>

<!-- 부트 스트랩 -->
<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
<%!
   String YesForm = null ;
   String NoForm = null ;
%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <title>Timer Agency Template</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Template CSS Files
        ================================================== -->
        <!-- Twitter Bootstrs CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="css/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <!-- template main css file -->
        <link rel="stylesheet" href="css/main.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        
        <!-- Template Javascript Files
        ================================================== -->
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <!-- jquery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!-- owl carouserl js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- bootstrap js -->

        <script src="js/bootstrap.min.js"></script>
        <!-- wow js -->
        <script src="js/wow.min.js"></script>
        <!-- slider js -->
        <script src="js/slider.js"></script>
        <script src="js/jquery.fancybox.js"></script>
        <!-- template main js -->
        <script src="js/main.js"></script>
    </head>
    <body>
        <!--
        ==================================================
        Header Section Start
        ================================================== -->
        <header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand">
                        <a href="index.html" >
                            <img src="images/logo1.png" alt="">
                        </a>
                    </div>
                    <!-- /logo -->
                </div>
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="${contextPath}/main.co">Home</a>
                            </li>
                            <li><a href="${contextPath}/nolist.no">공지사항</a></li>
                            <li><a href="${contextPath}/cbti.cb">CBTI</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">회원 <span class="caret"></span></a>
                                <c:if test="${whologin == 0}">
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="${contextPath}/custInsert.cu">회원가입</a></li>
                                        <li><a href="${contextPath}/custLog.cu">로그인</a></li>
                                    </ul>
                                </div>
                                </c:if>
                                 <c:if test="${whologin == 1 || whologin == 3}">
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="${contextPath}/custDetail.cu">마이페이지</a></li>
                                        <li><a href="${contextPath}/custUpdate.cu">회원정보수정</a></li>
                                        <li><a href="${contextPath}/pmorderlist.pm">나의 구매내역</a></li>
                                        <li><a href="${contextPath}/custorderlist.odc">나의 수업내역</a></li>
                                        <li><a href="${contextPath}/cplist.cp">내 쿠폰함</a></li>
                                    </ul>
                                </div>
                                </c:if>
                                <c:if test="${whologin == 2}">
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="${contextPath}/sellDetail.se">마이페이지</a></li>
                                        <li><a href="${contextPath}/sellUpdate.se">회원정보수정</a></li>
                                        <li><a href="${contextPath}/sellorderlist.pm">상품관리</a></li>
                                        <li><a href="${contextPath}/sellorderlist.odc">수업관리</a></li>
                                        <li><a href="${contextPath}/sellApp.se">사업승인신청</a></li>
                                    </ul>
                                </div>
                                </c:if>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">커피 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <c:if test="${whologin == 2}">
                        				<li><a href="${contextPath}/cfInsert.cf">상품 등록</a></li>
                     					</c:if>
					                     <li><a href="${contextPath}/cfList.cf?c_type=1">싱글오리진</a></li>
					                     <li><a href="${contextPath}/cfList.cf?c_type=2">블랜딩</a></li>
					                     <li><a href="${contextPath}/cfList.cf?c_type=3">캡슐</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">용품&디저트 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <c:if test="${whologin == 2}">
                       					 <li><a href="${contextPath}">상품 등록</a></li>
                     					</c:if>
                     					<li><a href="${contextPath}/prList.pr?p_type=1">커피 용품</a></li>
                     					<li><a href="${contextPath}/prList.pr?p_type=2">쿠키</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">원데이클래스 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <c:if test="${whologin == 0}">
                       					 <li><a href="${contextPath}/onedayInsert.odc">수업등록</a></li>
                     					</c:if>
                     					<li><a href="${contextPath}/onedaylist.odc">수업목록</a></li>
                                    </ul>
                                </div>
                            </li>
                             <c:if test="${whologin == 1}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자메뉴 <span class="caret"></span></a>
                               
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="${contextPath}/adminApp.cu">사업자 권한 승인</a></li>
                     					<li><a href="${contextPath}/adminList.cu">전체 회원 관리</a></li>
                     					<li><a href="${contextPath}/adminorderlist.odc">원데이 클래스 전체 결제내역</a></li>
                     					<li><a href="${contextPath}/adminorderlist.pm">상품 전체 결제내역</a></li>
                                    </ul>
                                </div>
                            </li>
                             </c:if>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>
        
                            
           
                
        </body>
    </html>