<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>원데이 클래스 등록</title>
    <script type="text/javascript" src="${contextPath}/js/onedayClass.js"></script>
    <link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
</head>
<body onload="today();">
	<section id="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.3s">원데이 클래스 등록</h2>
						<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.3s">
							사업자님! 개설할 원데이 클래스를 등록하세요.
						</p>
						
						<div class="container">
					        <div class="row">
					            <section>
					            <div class="wizard">
					                <div class="wizard-inner wow fadeInDown " data-wow-duration="500ms" data-wow-delay="0.6s">
					                    <div class="connecting-line"></div>
					                    <ul class="nav nav-tabs" role="tablist">
					    
					                        <li role="presentation" class="active">
					                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="01. 기본 정보">
					                                <span class="round-tab">
					                                   <i class="fas fa-id-card"></i>
					                                </span>
					                            </a>
					                        </li>
					    
					                        <li role="presentation" class="disabled">
					                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="02. 수업 정보">
					                                <span class="round-tab">
					                                    <i class="fas fa-chalkboard-teacher"></i>
					                                </span>
					                            </a>
					                        </li>
					                        <li role="presentation" class="disabled">
					                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="03. 사진 정보">
					                                <span class="round-tab">
					                                    <i class="fas fa-images"></i>
					                                </span>
					                            </a>
					                        </li>
					    
					                        <li role="presentation" class="disabled">
					                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="04. 등록 완료!">
					                                <span class="round-tab">
					                                    <i class="fas fa-check"></i>
					                                </span>
					                            </a>
					                        </li>
					                    </ul>
					                </div>
					    
                                    <!-- =============================================[Form 양식 시작]============================================= -->
                                    <div class="contact-form">
                                        <c:set var="contextPath" value="<%=contextPath%>" scope="application" />
                                        <form id="contact-form" method="post" action="${contextPath}/onedayInsert.odc" role="form">
                                            <div class="tab-content">
                                                <!-- step1 -->
                                                <div class="tab-pane active" role="tabpanel" id="step1">
                                                	<input type="text" id="isCheck" class="isCheck" name="isCheck" value="false">
                                                    <h4 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s">기본 정보</h4>
                                                    <!-- ------------------------------------- [주제 type section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <select class="form-control" name="type" id="type">
                                                            <option class="form-control" value="-">주제</option>
                                                            <option class="form-control" value="coffee" selected="selected">커피</option>
                                                            <option class="form-control" value="pottery">도자기</option>
                                                        </select>
                                                        <span class="valid_check" id="err_type"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [클래스 코드 code section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <!-- coffee : c로 시작 / pottery : p로 시작 -->
                                                        <input type="text" class="form-control" placeholder="클래스 코드" id="code" name="code" onblur="code_ajax();" value="coffee_1">
                                                        <span class="valid_check" id="err_code"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [클래스명 classname section]--------------------------------------- -->
                                                    <div id="test" class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control " placeholder="클래스명" id="classname" name="classname" value="아아아아">
                                                        <span class="valid_check" id="err_classname"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [강사명 instructor section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="강사명" id="instructor" name="instructor">
                                                    </div>
                                                    <!-- ------------------------------------- [수강인원 person section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수강인원" id="person" name="person" value="5">
                                                        <span class="valid_check" id="err_person"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [가격 oneprice section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="가격" id="oneprice" name="oneprice" value="5000">
                                                        <span class="valid_check" id="err_oneprice"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [우편번호 zipcode section]--------------------------------------- -->
                                                    <div id="zipcode-section2" class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" placeholder="우편번호" disabled="disabled" class="form-control" id="fakezipcode" name="fakezipcode">
                                                        <input type="hidden" class="form-control" id="zipcode" name="zipcode" value="12345">
                                                        <button type="button" id="zipcode-find" class="btn btn-default btn-send" onclick='zipCheck();'>
                                                            우편번호 찾기
                                                        </button>
                                                    </div>
                                                    <!-- ------------------------------------- [주소 address1 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" placeholder="주소" disabled="disabled" class="form-control" id="fakeaddress1" name="fakeaddress1">
                                                        <input type="hidden" class="form-control" id="address1" name="address1" value="테스트중">
                                                    </div>
                                                    <!-- ------------------------------------- [상세주소 address2 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="상세주소" id="address2" name="address2" value="아아아">
                                                        <span class="valid_check" id="err_address2"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [수업내용 content section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <textarea class="form-control" id="content" name="content" placeholder="상품 설명"></textarea>
                                                        <span class="valid_check" id="err_content"></span>
                                                    </div>
                                                    <ul class="list-inline pull-right wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1.2s">
                                                        <li class="step-li"><button type="button" class="btn btn-default next-step" data-toggle="modal" data-target=".modal" onclick="next_check1();">다음 단계</button></li>
                                                    </ul>
                                                </div>    
                                                <!-- step2 -->
                                                <div class="tab-pane" role="tabpanel" id="step2">
                                                    <h4 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s">수업 정보</h4>
                                                    <!-- ------------------------------------- [오픈일자 startdate section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" disabled="disabled" class="form-control" placeholder="오픈일자" id="fake-startdate" name="fake-startdate">
                                                        <input type="hidden" class="form-control" id="startdate" name="startdate">
                                                    </div>
                                                    <!-- ------------------------------------- [마감일자 enddate section]--------------------------------------- -->
                                                    <div class="pickercss">
	                                                    <input type="text" placeholder="마감일자" id="enddate" name="enddate" class="datepicker wow fadeInDown " 
	                                                    data-wow-duration="500ms" data-wow-delay="1.0s" onclick="date();">
	                                                    <span class="valid_check" id="err_enddate"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [오픈시간 opentime section]--------------------------------------- -->
                                                    <div class="pickercss">
	                                                     <input type="text" placeholder="수업 오픈시간" id="opentime" name="opentime" class="input_from timepicker wow fadeInDown " 
	                                                     data-wow-duration="500ms" data-wow-delay="1.0s" onclick="time();">
	                                                     <span class="valid_check" id="err_opentime"></span>
                                                     </div>
                                                     <!-- ------------------------------------- [마감시간 closetime section]--------------------------------------- -->
                                                     <div class="pickercss">
	                                                     <input type="text" placeholder="수업 마감시간" id="closetime" name="closetime" class="input_to timepicker wow fadeInDown " 
	                                                     data-wow-duration="500ms" data-wow-delay="1.0s" onclick="time();">
	                                                     <span class="valid_check" id="err_closetime"></span>
                                                     </div>
                                                     <!-- ------------------------------------- [★★★★시간 추가★★★★]--------------------------------------- -->
                                                     <div class="col-md-2 add_btn wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                     	 <p class="btn_icon" data-toggle="modal" data-target="#myModal"><i class="fas fa-plus"></i>  시간</p>
                                                     </div>
                                                    <!-- ------------------------------------- [추가_오픈시간 1 add_opentime1 section]--------------------------------------- -->
                                                    <section class="add">
                                                    	<div class="pickercss">
		                                                    <input type="text" placeholder="수업 오픈시간(추가)" id="add_opentime1" name="add_opentime1" class="input_from timepicker wow fadeInDown " 
		                                                    data-wow-duration="500ms" data-wow-delay="0.3s" onclick="time();">
		                                                     <span class="valid_check" id="err_add_opentime1"></span>
	                                                     </div>
	                                                    <!-- ------------------------------------- [추가_마감시간 1 add_closetime1 section]--------------------------------------- -->
	                                                    <div class="pickercss">
		                                                    <input type="text" placeholder="수업 마감시간(추가)" id="add_closetime1" name="add_closetime1" class="input_to timepicker wow fadeInDown " 
		                                                    data-wow-duration="500ms" data-wow-delay="0.3s" onclick="time();">
		                                                    <span class="valid_check" id="err_add_closetime1"></span>
	                                                    </div>
                                                    <!-- ------------------------------------- [추가_오픈시간 2 add_opentime2 section]--------------------------------------- -->
                                                  		<div class="pickercss">
		                                                    <input type="text" placeholder="수업 오픈시간(추가)" id="add_opentime2" name="add_opentime2" class="input_from timepicker wow fadeInDown " 
		                                                     data-wow-duration="500ms" data-wow-delay="0.3s" onclick="time();">
		                                                     <span class="valid_check" id="err_add_opentime2"></span>
	                                                     </div>
	                                                    <!-- ------------------------------------- [추가_마감시간 2 add_closetime2 section]--------------------------------------- -->
	                                                    <div class="pickercss">
		                                                    <input type="text" placeholder="수업 마감시간(추가)" id="add_closetime2" name="add_closetime2" class="input_to timepicker wow fadeInDown " 
		                                                     data-wow-duration="500ms" data-wow-delay="0.3s" onclick="time();">
		                                                     <span class="valid_check" id="err_add_closetime2"></span>
	                                                     </div>
                                                     </section>
                                                    <ul class="list-inline pull-right wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1.2s">
                                                        <li class="step-li"><button type="button" class="btn btn-default prev-step">이전 단계</button></li>
                                                        <li class="step-li"><button type="button" class="btn btn-default next-step" data-toggle="modal" data-target=".modal" onclick="next_check2();">다음 단계</button></li>
                                                    </ul>
                                                </div>
                                                
                                                <!-- step3 -->
                                                <div class="tab-pane" role="tabpanel" id="step3">
                                                    <h4 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s">사진 정보</h4>
                                                    <!-- ------------------------------------- [메인 사진  main_image section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="메인사진" id="main_image" name="main_image">
                                                    </div>
                                                    <!-- ------------------------------------- [상세 사진 1  detail_image1 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="세부사진(추가)" id="detail_image1" name="detail_image1">
                                                    </div>
                                                    <!-- ------------------------------------- [상세 사진 2  detail_image2 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="세부사진(추가)" id="detail_image2" name="detail_image2">
                                                    </div>
                                                    <ul class="list-inline pull-right wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.2s">
                                                        <li class="step-li"><button type="button" class="btn btn-default prev-step">이전 단계</button></li>
                                                        <li class="step-li"><button type="button" class="btn btn-default next-step" onclick="next_check();">다음 단계</button></li>
                                                    </ul>
                                                    <div id="submit" class="wow fadeInDown"
                                                    data-wow-duration="500ms" data-wow-delay="1.4s">
                                                    <input type="submit" id="contact-submit" class="btn btn-default btn-send" value="등록 하기">
                                                    </div>
                                                </div>

                                                <div class="tab-pane wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s" role="tabpanel" id="complete">
                                                    <h3>등록 완료</h3>
                                                    <p>성공적으로 등록이 되었습니다.</p>
                                                </div>
                                                <div class="clearfix"></div>

                                            </div>
                                        </form>
                                    </div>
						            <!-- =============================================[Form 양식 끝]============================================= -->
					            </div>
					        </section>
					       </div>
    					</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	
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