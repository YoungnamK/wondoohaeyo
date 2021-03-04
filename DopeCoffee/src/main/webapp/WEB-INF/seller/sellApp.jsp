<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
int myoffset = 2;
int mywidth = twelve - 2 * myoffset;
int formleft = 3;
int formright = twelve - formleft;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/css/sellApp-style.css">
<script type="text/javascript" src="${contextPath}/js/sellApp.js"></script>
<script type="text/javascript">

/* ===============================
사업자번호 정규표현식 (숫자만)
===============================
*/
/* $(function(){
$("#sell_License").blur(function() {
	var regexp = /^[0-9]*$/;
	var sell_License = $('#sell_License').val();
	if( !regexp.test(sell_License) ) {
		$("#check_sellLicense").text("숫자만 입력해주세요 :p");
		$("#check_sellLicense").css('color', 'red');
		$("#submit").attr("disabled", true);
		$('#sell_License').val('');
      	$('#sell_License').focus();
	} else { 
       	$("#check_sellLicense").text("올바른 사업자번호 형태입니다 :)");
		$("#check_sellLicense").css('color', '#5080BF');
		$("#submit").attr("disabled", false);
}
});
});	 */

/* ===============================
sell_Status 상태가 '승인'이면, submit버튼 비활성화
===============================
*/

statusbtn()
document.getElementById("sell_Status").value = "대기중";

</script>

</head>
<body style="padding-bottom: 150px;">
	<script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<div class="panel" align="center">
		<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
			data-wow-delay="0.3s">사업자 승인 신청</h2>
		<p class="subtitle-des wow fadeInDown" data-wow-duration="500ms"
			data-wow-delay="0.3s">승인 신청이 완료되면 상품 판매와 수업 예약을 진행할 수 있어요!</p>
	</div>
	<div class="panel panel-body">
		<c:set var="apppath" value="<%=contextPath%>" />
		<%-- form태그 시작 ------------------------------------------------- --%>
		<form enctype="multipart/form-data" method="post"
			action="${apppath}/sellApp.se" class="form-horizontal" role="form"
			name="myform" onsubmit="return chk_submit();">
			
			<input type="hidden" name="sell_Email" value="${bean.sell_Email}">
			<div class="form-group">
				<div class="file-upload">
					<!-- 사업자 상태 --------------------------------------------------- -->
					<!-- 관리자만 선택할 수 있음 ------------------------------------------ -->
					<c:if test="${whologin == 1}">
						<select class="form-control" name="sell_Status" id="sell_Status">
							<c:if test="${bean.sell_Status == '신청전'}">
								<option class="form-control" value="신청전" selected="selected">신청전</option>
								<option class="form-control" value="대기중">대기중</option>
								<option class="form-control" value="승인">승인</option>
							</c:if>
							<c:if test="${bean.sell_Status == '대기중' || bean.sell_Status == ''}">
								<option class="form-control" value="신청전">신청전</option>
								<option class="form-control" value="대기중" selected="selected">대기중</option>
								<option class="form-control" value="승인">승인</option>
							</c:if>
							<c:if test="${bean.sell_Status == '승인'}">
								<option class="form-control" value="신청전">신청전</option>
								<option class="form-control" value="대기중">대기중</option>
								<option class="form-control" value="승인" selected="selected">승인</option>
							</c:if>
						</select>
					</c:if>
					<br /> <br />
					<!-- 파일 업로드 시작 --------------------------------------------------- -->
					<button class="file-upload-btn" type="button"
						onclick="$('.file-upload-input').trigger( 'click' )">*Add
						Image</button>
					<div class="image-upload-wrap">
						<input name="sell_Pic" type="hidden" value="${bean.sell_Pic}">
						기존 이미지 : <input name="oldimg" type="hidden" value="${bean.sell_Pic}">
						<input type="file" class="file-upload-input" name="img" id="img"
							onchange="readURL(this);" accept="image/*" /> <span
							class="valid_check" id="err_img"></span>
						<div class="drag-text">
							<h3>
								<span>사업자등록증을 제출해주세요.</span><br /> <br />*첨부한 내용이 육안으로 식별 불가능한
								경우, 업무처리가 지연될 수 있습니다.<br /> *제출서류가 확인된 경우에만 최종 승인이 가능합니다.
							</h3>
						</div>
					</div>
					<div class="file-upload-content">
						<img class="file-upload-image" src="#" alt="your image" />
						<div class="image-title-wrap">
							<button type="button" onclick="removeUpload()"
								class="remove-image">
								Remove <span class="image-title">Uploaded Image</span>
							</button>
						</div>
					</div>
					<!-- 파일 업로드 끝 --------------------------------------------------- -->
					<br /> <br /> <br /> <br /> <br />
					<button class="file-upload-btn" type="button">*사업자번호 입력</button>
					<br /> <br /> <input type="text"
						placeholder="----- License Number -----"
						style="padding: 10px; text-align: center; margin: 0px; font-size: 20pt; height: 100px;"
						class="form-control" name="sell_License" id="sell_License"
						value="${bean.sell_License}"> 
						<div class="valid_check" id="check_sellLicense"></div>
				</div>
			</div>
			<%-- 하단 버튼------------------------------------------------- --%>
			<div class="submit_btn col-sm-offset-3 col-sm-6">
				<p class="fas_text">
					<i class="fas fa-check-circle"></i>&nbsp;타인에게 사업자 명의를 빌려주거나 타인 명의로
					사업 영위할 경우, <br />국세 및 부가가치세법 등에 대한 불이익이 있을 수 있습니다.
				</p>
				<button class="appsubmit" type="submit" id="submit" name="submit" onclick="statusbtn()">동의하고
					승인 신청하기</button>
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
						<button type="button" class="loginGo_btn btn-default"
							data-dismiss="modal" style="font-size: 13px">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>