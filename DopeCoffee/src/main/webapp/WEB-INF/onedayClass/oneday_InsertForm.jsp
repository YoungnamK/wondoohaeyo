<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>원데이 클래스 등록</title>
	<link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(document).ready(function () {
	        //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();
		            
            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
		
                var $target = $(e.target);
		            
                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

		          });
		    });
		
		    function nextTab(elem) {
		        $(elem).next().find('a[data-toggle="tab"]').click();
		    }
		    function prevTab(elem) {
		        $(elem).prev().find('a[data-toggle="tab"]').click();
		    }
		    
		    /* 현재 날짜를 구해주는 함수 */
		    function today() {
		    	var today = new Date(); 
			    var year = today.getFullYear(); //년도 
			    var _month = today.getMonth() + 1; 
			    var _date = today.getDate(); 
			    var month ; // 월 
			    var date ; // 날짜 
			    
			    if (_month < 10) { // 1의 자리 일때 
					month = "0" + _month;
			    }else{
			    	month = _month;
			    }
			    
			    if (_date < 10) { // 1의 자리 일때 
			    	date = "0" + _date;
				}else{
			    	date = _date;
			    }
			    			    
			    var startdate = String(year) + String(month) + String(date) ;
			    //alert(startdate);
			    $('#fake-startdate').val(startdate);
			    $('#startdate').val(startdate);
			}
		    
		    
		    
	</script>
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
					                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
					                                <span class="round-tab">
					                                    <i class="glyphicon glyphicon-folder-open"></i>
					                                </span>
					                            </a>
					                        </li>
					    
					                        <li role="presentation" class="disabled">
					                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
					                                <span class="round-tab">
					                                    <i class="glyphicon glyphicon-pencil"></i>
					                                </span>
					                            </a>
					                        </li>
					                        <li role="presentation" class="disabled">
					                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
					                                <span class="round-tab">
					                                    <i class="glyphicon glyphicon-picture"></i>
					                                </span>
					                            </a>
					                        </li>
					    
					                        <li role="presentation" class="disabled">
					                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
					                                <span class="round-tab">
					                                    <i class="glyphicon glyphicon-ok"></i>
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
                                                    <h4 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s">기본 정보</h4>
                                                    <!-- ------------------------------------- [주제 type section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <select class="form-control" name="type">
                                                            <option class="form-control" value="-">주제</option>
                                                            <option class="form-control" value="coffee">커피</option>
                                                            <option class="form-control" value="pottery">도자기</option>
                                                        </select>
                                                    </div>
                                                    <!-- ------------------------------------- [클래스 코드 code section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <!-- coffee : c로 시작 / pottery : p로 시작 -->
                                                        <input type="text" class="form-control" placeholder="클래스 코드" id="code" name="code" >
                                                    </div>
                                                    <!-- ------------------------------------- [클래스명 classname section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="클래스명" id="classname" name="classname">
                                                    </div>
                                                    <!-- ------------------------------------- [강사명 instructor section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="강사명" id="instructor" name="instructor">
                                                    </div>
                                                    <!-- ------------------------------------- [수강인원 person section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수강인원" id="person" name="person">
                                                    </div>
                                                    <!-- ------------------------------------- [가격 oneprice section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="가격" id="oneprice" name="oneprice"">
                                                    </div>
                                                    <!-- ------------------------------------- [우편번호 zipcode section]--------------------------------------- -->
                                                    <div id="zipcode-section2" class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="우편번호" id="zipcode" name="zipcode">
                                                        <button type="button" id="zipcode-find" class="btn btn-default btn-send" >
                                                            우편번호 찾기
                                                        </button>
                                                    </div>
                                                    <!-- ------------------------------------- [주소 address1 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="주소" id="address1" name="address1">
                                                    </div>
                                                    <!-- ------------------------------------- [상세주소 address2 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="상세주소" id="address2" name="address2" >
                                                    </div>
                                                    <!-- ------------------------------------- [수업내용 content section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <textarea class="form-control" name="comment" placeholder="상품 설명"></textarea>
                                                    </div>
                                                    <ul class="list-inline pull-right wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1.2s">
                                                        <li class="step-li"><button type="button" class="btn btn-default next-step">다음 단계</button></li>
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
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="date" class="form-control" placeholder="마감일자" id="enddate" name="enddate">
                                                    </div>
                                                    <!-- ------------------------------------- [오픈시간 opentime section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수업 오픈시간" id="opentime" name="opentime">
                                                    </div>
                                                     <!-- ------------------------------------- [마감시간 opentime section]--------------------------------------- -->
                                                     <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수업 마감시간" id="closetime" name="closetime">
                                                    </div>
                                                    <!-- ------------------------------------- [추가_오픈시간 1 add_opentime1 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수업 오픈시간(추가)" id="add_opentime1" name="add_opentime1">
                                                    </div>
                                                    <!-- ------------------------------------- [추가_마감시간 1 add_closetime1 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수업 마감시간(추가)" id="add_closetime1" name="add_closetime1">
                                                    </div>
                                                    <!-- ------------------------------------- [추가_오픈시간 2 add_opentime2 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수업 오픈시간(추가)" id="add_opentime2" name="add_opentime2">
                                                    </div>
                                                    <!-- ------------------------------------- [추가_마감시간 2 add_closetime2 section]--------------------------------------- -->
                                                    <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                                                        <input type="text" class="form-control" placeholder="수업 마감시간(추가)" id="add_closetime2" name="add_closetime2">
                                                    </div>
                                                    <ul class="list-inline pull-right wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1.2s">
                                                        <li class="step-li"><button type="button" class="btn btn-default prev-step">이전 단계</button></li>
                                                        <li class="step-li"><button type="button" class="btn btn-default next-step">다음 단계</button></li>
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
                                                        <li class="step-li"><button type="button" class="btn btn-default next-step">다음 단계</button></li>
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
</body>
</html>