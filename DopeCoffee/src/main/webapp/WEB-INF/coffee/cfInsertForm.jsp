<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="./../common/common.jsp"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>커피상품 등록</title>
    <script type="text/javascript" src="${contextPath}/css/coffee.css"></script>
    <link rel="stylesheet" href="${contextPath}/css/coffee.css">
</head>
<body onload="today();">
        <section id="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="block">
                            <h2 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">커피원두등록</h2>
                            <p class="subtitle-des wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".5s">
                               커피원두 상품정보를 등록해주세요!
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
					                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="02. 사진 정보">
					                                <span class="round-tab">
					                                    <i class="fas fa-images"></i>
					                                </span>
					                            </a>
					                        </li>
					    
					                        <li role="presentation" class="disabled">
					                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="03. 등록 완료!">
					                                <span class="round-tab">
					                                    <i class="fas fa-check"></i>
					                                </span>
					                            </a>
					                        </li>
					                    </ul>
					                </div>
                            
        <div class="contact-form">
        	 <c:set var="contextPath" value="<%=contextPath%>" scope="application" />
        	  <form id="contact-form" method="post" action="${contextPath}/cfInsert.cf" role="form">
      		   <div class="tab-content">
     		<!-- step1 -->
     <div class="tab-pane active" role="tabpanel" id="step1">
     	<input type="text" id="isCheck" class="isCheck" name="isCheck" value="false">
     	 <h4 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s">원두 정보</h4>
           <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                    <select class="form-control" name="c_type" id="c_type">
                     <option class="form-control" value="-">--커피타입--</option>
                        <option class="form-control" value="singleorigin">1.싱글오리진</option>
                        <option class="form-control" value="blending" selected="selected">2.블랜딩</option>
                        <option class="form-control" value="capsul">3.캡슐</option>
                    </select>
                    <span class="valid_check" id="err_c_type"></span>
           </div>   
              <!-- ------------------------------------- [상품명 classname section]--------------------------------------- -->
      <div id="test" class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
          <input type="text" class="form-control " placeholder="상품명" id="c_name" name="c_name" value="에티오피아 까르">
          <span class="valid_check" id="err_c_name"></span>
      </div>
      <!-- ------------------------------------- [가격 c_price section]--------------------------------------- -->
       <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
           <input type="text" class="form-control" placeholder="가격" id="c_price" name="c_price" value="5000">
           <span class="valid_check" id="err_c_price"></span>
       </div>
                 <!-- ------------------------------------- ["원산지" c_origin section]--------------------------------------- -->
     <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
         <input type="text" class="form-control" placeholder="원산지" id="c_origin" name="c_origin">
     </div>
      <!-- ------------------------------------- [상품 무게 c_price section]--------------------------------------- -->
       <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
           <input type="text" class="form-control" placeholder="상품 무게" id="c_weight" name="c_weight" value="239">
           <span class="valid_check" id="err_c_weight"></span>
       </div>
                 <!-- ------------------------------------- ["로스팅 정도" c_origin section]--------------------------------------- -->
     <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
         <input type="text" class="form-control" placeholder="로스팅 정도" id="c_roasting" name="c_roasting">
     </div>
                     <!-- ------------------------------------- ["블랜딩 여부" c_blending section]--------------------------------------- -->
     <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
         <input type="text" class="form-control" placeholder="블랜딩 여부" id="c_blending" name="c_blending">
     </div>                                    

      <!-- ------------------------------------- [분쇄 여부 c_crushing_status section]--------------------------------------- -->
      <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
          <select class="form-control" name="c_crushing_status" id="c_crushing_status">
              <option class="form-control" value="-">--분쇄 여부--</option>
              <option class="form-control" value="coffee" selected="selected">원두 (분쇄안함)</option>
              <option class="form-control" value="franchpress">프렌치프레스용</option>
              <option class="form-control" value="handdrip">핸드드립용</option>
              <option class="form-control" value="dutchcoffee">더치커피용</option>
          </select>
          <span class="valid_check" id="err_c_crushing_status"></span>
      </div>
                
      <!-- ------------------------------------- [재고 c_qty section]--------------------------------------- -->
       <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
           <input type="text" class="form-control" placeholder="재고" id="c_qty" name="c_qty" value="300">
           <span class="valid_check" id="err_c_qty"></span>
       </div>
      <ul class="list-inline pull-right wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1.2s">
           <li class="step-li"><button type="button" class="btn btn-default next-step" data-toggle="modal" data-target=".modal" onclick="next_check1();">다음 단계</button></li>
       </ul>
     </div>          	        						
       <!-- step2 -->          
          <div class="tab-pane" role="tabpanel" id="step2">   
           <h4 class="subtitle wow fadeInDown" data-wow-duration="500ms" data-wow-delay="0.8s">사진 정보</h4>
           <!-- ------------------------------------- [메인 사진  main_image section]--------------------------------------- -->
          <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
                <input type="text" class="form-control" placeholder="메인사진" id="c_image" name="c_image">
          </div>   
          <!-- ------------------------------------- [상세 사진 1  detail_image1 section]--------------------------------------- -->
          <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
              <input type="text" class="form-control" placeholder="세부사진(추가)" id="c_image2" name="c_image2">
          </div>
         <!-- ------------------------------------- [상세 사진 2  detail_image2 section]--------------------------------------- -->
         <div class="form-group wow fadeInDown " data-wow-duration="500ms" data-wow-delay="1.0s">
             <input type="text" class="form-control" placeholder="세부사진(추가)" id="c_image3" name="c_image3">
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