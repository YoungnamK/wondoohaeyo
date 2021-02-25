<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>원데이 클래스 수정</title>
    <script type="text/javascript" src="${contextPath}/js/onedayClass.js"></script>
    <link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
</head>
<body onload="update();">
	<section id="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div class="top">
							<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="0.3s">원데이 클래스 수정</h2>
							<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.1s">
								사업자님! 등록하신 원데이 클래스 정보를 수정하세요.
							</p>
						</div>
						
						<div class="container">
					        <div class="row">
					            <section>
					            <div class="wizard">
					                <div class="wizard-inner wow fadeInDown " data-wow-duration="500ms" data-wow-delay="0.3s">
					                    <div class="connecting-line"></div>
					                    <ul class="nav nav-tabs" role="tablist">
					    
					                        <li role="presentation" class="active">
					                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" 
					                            title="01. <spring:message code="oneday.step1_title"/>">
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
                                        <form id="contact-form" method="post" action="${contextPath}/onedayUpdate.odc" role="form" enctype="multipart/form-data">
                                            <input type="text" id="isCheck" class="isCheck" name="isCheck" value="false">
                                            <input type="hidden" id="sell_email" name="sell_email" value="${sessionScope.loginfo_seller.sell_Email}">
                                            <div class="tab-content">
                                                <!-- step1 -->
                                                <div class="tab-pane active  wow fadeInDown"  data-wow-duration="500ms" data-wow-delay="0.6s" role="tabpanel" id="step1">
                                                    <h4 class="subtitle"><spring:message code="oneday.step1_title"/></h4>
                                                    <!-- ------------------------------------- [주제 type section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
                                                    		<spring:message code="oneday.type"/>
                                                    	</div>
                                                        <select class="form-control" name="type" id="type">
                                                            <option class="form-control" value="-">주제</option>
                                                            <option class="form-control" value="coffee" selected="selected">커피</option>
                                                            <option class="form-control" value="pottery">도자기</option>
                                                        </select>
                                                        <span class="valid_check" id="err_type"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [클래스 코드 code section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
                                                    		<spring:message code="oneday.code"/>
                                                    	</div>
                                                        <!-- coffee : c로 시작 / pottery : p로 시작 -->
                                                        <input type="text" disabled="disabled" class="form-control" id="fake_code" name="fake_code" value="${bean.code}">
                                                        <input type="hidden" class="form-control" id="code" name="code" value="${bean.code}">
                                                        <span class="valid_check" id="err_code"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [클래스명 classname section]--------------------------------------- -->
                                                    <div id="test" class="form-group">
                                                    	<div class="column_name">
                                                    		<spring:message code="oneday.classname"/>
                                                    	</div>
                                                        <input type="text" class="form-control " placeholder="클래스명" id="classname" name="classname" 
                                                        value="${bean.classname}">
                                                        <span class="valid_check" id="err_classname"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [강사명 instructor section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
                                                    		<spring:message code="oneday.instructor"/>
                                                    	</div>
                                                        <input type="text" class="form-control" placeholder="강사명" id="instructor" name="instructor"
                                                        value="${bean.instructor}">
                                                    </div>
                                                    <!-- ------------------------------------- [수강인원 person section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
                                                    		<spring:message code="oneday.person"/>
                                                    	</div>
                                                        <input type="text" class="form-control" placeholder="수강인원" id="person" name="person" 
                                                        value="${bean.person}">
                                                        <span class="valid_check" id="err_person"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [가격 oneprice section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
                                                    		<spring:message code="oneday.oneprice"/>
                                                    	</div>
                                                        <input type="text" class="form-control" placeholder="가격" id="oneprice" name="oneprice" 
                                                        value="${bean.oneprice}">
                                                        <span class="valid_check" id="err_oneprice"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [우편번호 zipcode section]--------------------------------------- -->
                                                    <div class="column_name">
                                                    	<spring:message code="oneday.zipcode"/>
                                                    </div>
                                                    <div id="zipcode-section2" class="form-group">
                                                        <input type="text" placeholder="우편번호" disabled="disabled" class="form-control" id="fakezipcode" name="fakezipcode"
                                                        value="${bean.zipcode}">
                                                        <input type="hidden" class="form-control" id="zipcode" name="zipcode" value="${bean.zipcode}">
                                                        <button type="button" id="zipcode-find" class="btn btn-default" onclick='zipCheck();'>
                                                            우편번호 찾기
                                                        </button>
                                                    </div>
                                                    <!-- ------------------------------------- [주소 address1 section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
	                                                    	<spring:message code="oneday.address1"/>
	                                                    </div>
                                                        <input type="text" placeholder="주소" disabled="disabled" class="form-control" id="fakeaddress1" 
                                                        name="fakeaddress1" value="${bean.address1}">
                                                        <input type="hidden" class="form-control" id="address1" name="address1" value="${bean.address1}">
                                                    </div>
                                                    <!-- ------------------------------------- [상세주소 address2 section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
	                                                    	<spring:message code="oneday.address2"/>
	                                                    </div>
                                                        <input type="text" class="form-control" placeholder="상세주소" id="address2" name="address2" 
                                                        value="${bean.address2}">
                                                        <span class="valid_check" id="err_address2"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [수업내용 content section]--------------------------------------- -->
                                                    <div class="form-group">
                                                    	<div class="column_name">
	                                                    	<spring:message code="oneday.content"/>
	                                                    </div>
                                                        <textarea class="form-control" id="content" name="content" placeholder="상품 설명"
                                                        value="${bean.content}"></textarea>
                                                        <span class="valid_check" id="err_content"></span>
                                                    </div>
                                                    <ul class="list-inline pull-right">
                                                        <li class="step-li"><button type="button" id="modalbtn1" class="btn btn-default next-step"  data-toggle="modal" data-target="#myModal" onclick="next_check1();">다음 단계</button></li>
                                                    </ul>
                                                </div>    
                                                <%-- ============================= step2 ==========================================================================--%>
                                                <div class="tab-pane" role="tabpanel" id="step2">
                                                    <h4 class="subtitle">수업 정보</h4>
                                                    <!-- ------------------------------------- [오픈일자 startdate section]--------------------------------------- -->
                                                    <div class="form-group">
                                                        <input type="text" disabled="disabled" class="form-control" placeholder="오픈일자" id="fake-startdate" name="fake-startdate">
                                                        <input type="hidden" class="form-control" id="startdate" name="startdate">
                                                    </div>
                                                    <!-- ------------------------------------- [마감일자 enddate section]--------------------------------------- -->
                                                    <div class="pickercss">
	                                                    <input type="text" placeholder="마감일자" id="enddate" name="enddate" class="datepicker" onclick="date();" value="20210229">
	                                                    <span class="valid_check" id="err_enddate"></span>
                                                    </div>
                                                    <!-- ------------------------------------- [오픈시간 opentime section]--------------------------------------- -->
                                                    <div class="pickercss">
	                                                     <input type="text" placeholder="수업 오픈시간" id="opentime" name="opentime" class="input_from timepicker" 
	                                                     onclick="time();" value="05:00 PM">
	                                                     <span class="valid_check" id="err_opentime"></span>
                                                     </div>
                                                     <!-- ------------------------------------- [마감시간 closetime section]--------------------------------------- -->
                                                     <div class="pickercss">
	                                                     <input type="text" placeholder="수업 마감시간" id="closetime" name="closetime" class="input_to timepicker" 
	                                                     onclick="time();" value="08:00 PM">
	                                                     <span class="valid_check" id="err_closetime"></span>
                                                     </div>
                                                     <!-- ------------------------------------- [★★★★시간 추가★★★★]--------------------------------------- -->
                                                     <div class="col-md-2 add_btn" >
                                                     	 <p class="btn_icon time_add" data-toggle="modal" data-target="#myModal"><i class="fas fa-plus"></i>  시간</p>
                                                     </div>
                                                    <!-- ------------------------------------- [추가_오픈시간 1 add_opentime1 section]--------------------------------------- -->
                                                    <section id="add1">
                                                    	<div class="pickercss">
		                                                    <input type="text" placeholder="수업 오픈시간(추가)" id="add_opentime1" name="add_opentime1" class="input_from timepicker" 
		                                                   onclick="time();">
		                                                     <span class="valid_check" id="err_add_opentime1"></span>
	                                                     </div>
	                                                    <!-- ------------------------------------- [추가_마감시간 1 add_closetime1 section]--------------------------------------- -->
	                                                    <div class="pickercss">
		                                                    <input type="text" placeholder="수업 마감시간(추가)" id="add_closetime1" name="add_closetime1" class="input_to timepicker" 
		                                                    onclick="time();">
		                                                    <span class="valid_check" id="err_add_closetime1"></span>
	                                                    </div>
                                                    <!-- ------------------------------------- [추가_오픈시간 2 add_opentime2 section]--------------------------------------- -->
                                                  		<div class="pickercss">
		                                                    <input type="text" placeholder="수업 오픈시간(추가)" id="add_opentime2" name="add_opentime2" class="input_from timepicker" 
		                                                    onclick="time();">
		                                                     <span class="valid_check" id="err_add_opentime2"></span>
	                                                     </div>
	                                                    <!-- ------------------------------------- [추가_마감시간 2 add_closetime2 section]--------------------------------------- -->
	                                                    <div class="pickercss">
		                                                    <input type="text" placeholder="수업 마감시간(추가)" id="add_closetime2" name="add_closetime2" class="input_to timepicker" onclick="time();">
		                                                     <span class="valid_check" id="err_add_closetime2"></span>
	                                                     </div>
                                                    </section>
                                                    <ul class="list-inline pull-right" >
                                                        <li class="step-li"><button type="button" class="btn btn-default prev-step">이전 단계</button></li>
                                                        <li class="step-li"><li class="step-li"><button type="button" id="modalbtn2" class="btn btn-default next-step"  data-toggle="modal" data-target="#myModal" onclick="next_check2();">다음 단계</button></li>
                                                    </ul>
                                                </div>
                                                
                                                <%-- ============================= step3 ==========================================================================--%>
                                                <div class="tab-pane wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.6s" role="tabpanel" id="step3">
                                                    <h4 class="subtitle">사진 정보</h4>
                                                    <!-- ------------------------------------- [메인 사진  main_image section]--------------------------------------- -->
                                                    <%-- ======================구분선===================== --%>
                                                    <div class="file-upload">
												        <button class="file-upload-btn" type="button" data-toggle="tooltip" title="메인 사진을 업로드 해주세요!" onclick="$('#m_img').trigger( 'click' )">사진 업로드</button>
												
												        <div id="main_wrap" class="image-upload-wrap"> 
												            <input class="file-upload-input" id="m_img" name="m_img"  type='file' onchange="readURL_main(this);" accept="image/*" />
												            <div class="drag-text">
												            <h3><i class="fas fa-paperclip"></i></h3>
												            </div>
												        </div>
												        <div id="main_content" class="file-upload-content">
												            <img class="file-upload-image" id="M_image" src="#" alt="your image" />
												            <div class="image-title-wrap">
													            <button type="button" onclick="removeUpload_main()" class="remove-image" data-toggle="tooltip" title="클릭 하면 삭제됩니다!">
													            	<span id="main_title" class="image-title">이미지 이름</span>
													            </button>
												            </div>
												        </div>
												    </div>
                                                      <!-- ------------------------------------- [★★★★사진 추가★★★★]--------------------------------------- -->
                                                     
                                                     <div class="col-md-2 add_btn">
                                                     	 <p class="pic_add btn_icon" data-toggle="modal" data-target="#myModal"><i class="fas fa-plus"></i>  사진</p>
                                                     </div>
                                                     
                                                     <section id="add2"> 
	                                                    <!-- ------------------------------------- [상세 사진 1  detail_image1 section]--------------------------------------- -->
	                                                    <div class="file-upload">
												        <button class="file-upload-btn" type="button" data-toggle="tooltip" title="세부 사진을 업로드 해주세요!" onclick="$('#d_img1').trigger( 'click' )">추가 사진 업로드</button>
												
												        <div id="detail1_wrap" class="image-upload-wrap"> 
												            <input class="file-upload-input" id="d_img1" name="d_img1"  type='file' onchange="readURL_detail1(this);" accept="image/*" />
												            <div class="drag-text">
												            <h3><i class="fas fa-paperclip"></i></h3>
												            </div>
												        </div>
												        <div id="detail1_content" class="file-upload-content">
												            <img class="file-upload-image" id="D1_image" src="#" alt="your image" />
												            <div class="image-title-wrap">
													            <button type="button" onclick="removeUpload_detail1()" class="remove-image" data-toggle="tooltip" title="클릭 하면 삭제됩니다!">
													            	<span id="detail1_title" class="image-title">이미지 이름</span>
													            </button>
												            </div>
												        </div>
													    </div>
	                                                    
	                                                    <!-- ------------------------------------- [상세 사진 2  detail_image2 section]--------------------------------------- -->
	                                                   <div class="file-upload">
												        <button class="file-upload-btn" type="button" data-toggle="tooltip" title="세부 사진을 업로드 해주세요!" onclick="$('#d_img2').trigger( 'click' )">추가 사진 업로드</button>
												
												        <div id="detail2_wrap" class="image-upload-wrap"> 
												            <input class="file-upload-input" id="d_img2" name="d_img2"  type='file' onchange="readURL_detail2(this);" accept="image/*" />
												            <div class="drag-text">
												            <h3><i class="fas fa-paperclip"></i></h3>
												            </div>
												        </div>
												        <div id="detail2_content" class="file-upload-content">
												            <img class="file-upload-image" id="D2_image" src="#" alt="your image" />
												            <div class="image-title-wrap">
													            <button type="button" onclick="removeUpload_detail2()" class="remove-image" data-toggle="tooltip" title="클릭 하면 삭제됩니다!">
													            	<span id="detail2_title" class="image-title">이미지 이름</span>
													            </button>
												            </div>
												        </div>
													    </div>
	                                                </section>
                                                    <ul class="list-inline pull-right">
                                                        <li class="step-li"><button type="button" class="btn btn-default prev-step">이전 단계</button></li>
                                                    </ul>
                                                    <div id="submit">
                                                    	<input type="submit" id="contact-submit" class="btn btn-default btn-send" value="등록 하기" 
                                                    	data-toggle="modal" data-target="#myModal" onclick="return submitCheck();">
                                                    </div>
                                                </div>
                                                
                                                <%-- ============================= step4 ==========================================================================--%>
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