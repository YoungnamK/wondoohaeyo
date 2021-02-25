<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>원데이 클래스 상세보기</title>
    <script type="text/javascript" src="${contextPath}/js/onedayClass.js"></script>
    <link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
</head>
<body class="top">
	 <section id="blog-full-width">
        <div class="container">
            <h2 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">ONEDAY CLASS</h2>
            <div class="row">
                <div class="col-md-8">
                    <article class="wow fadeInDown animated" data-wow-delay=".3s" data-wow-duration="500ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 0.3s; animation-name: fadeInDown;">
                        <div class="blog-post-image">
                            <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">

                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                  <li data-target="#myCarousel" data-slide-to="1"></li>
                                  <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>
                              
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner carousel-zoom carousel-fade">
                                        <div class="item active">
                                            <img class="img-responsive" src="./upload/${bean.main_image}" alt="">
                                        </div>
                                       <div class="item">
                                            <img class="img-responsive" src="./upload/${bean.detail_image1}" alt="">
                                        </div>
                                      <div class="item">
                                            <img class="img-responsive" src="./upload/${bean.detail_image2}" alt="">
                                      </div>
                                    <!-- Carousel nav -->
                                    
                                  </div>
                              </div>
                            </div>
                    </article>
                </div>
                <div class="col-md-4">
                    <div class="sidebar">
                        <div id="content_css" class="categories widget">
                            <h3 class="widget-head">${bean.classname}</h3>
                            <p>${bean.content}</p>
                        </div>
                        <form>
                            <div class="categories widget">
                                <h3 id="class_css" class="widget-head">수업 신청</h3>
                                <ul>
                                    <li>
                                        <div class="form-group">
                                            <input type="text" class="input_data form-control" placeholder="예약 일자" id="bookdate" name="bookdate">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-group">
                                            <!-- 파라미터 이름은 수정 할 것  -->
                                            <select class="form-control" name="type" id="time">
                                                <option class="form-control" value="-">이용시간</option>
                                                <option class="form-control" value="coffee">09 : 00 PM ~ 10 : 00 PM</option>
                                                <option class="form-control" value="pottery">09 : 00 PM ~ 10 : 00 PM</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-group">
                                            <!-- 파라미터 이름은 수정 할 것  -->
                                            <input type="text" class="input_data form-control" placeholder="1인 이용가격" id="opentime" name="opentime">
                                        </div>
                                    </li>
                                    <li>
                                        <div id="person_css" class="form-group">
                                            <input type="text" class="input_data form-control" placeholder="인원수" id="person" name="person">
                                            <button class="btn-send pmbtn"><i class="fas fa-plus"></i></button>
                                            <button class="btn-send pmbtn"><i class="fas fa-minus"></i></button>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-group">
                                            <!-- 파라미터 이름은 수정 할 것  -->
                                            <input type="text" class="input_data form-control" placeholder="총가격" id="totalprice" name="totalprice">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        
                            <div class="submit_detail">
                                <input type="submit" id="contact-submit" class="btn-send" value="결제 하기">
                                <input type="submit" id="contact-submit" class="btn-send" value="카카오 API">
                                <input type="submit" id="contact-submit" class="btn-send" value="네이버 API">
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
               
            </div>
        </section>        
</body>
</html>