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
	function AppSubmit() {
		/* 키보드에서 손을 떼면 호출이 되는데, 
		제출시 상태를 기본값이었던 '신청전'에서 '대기중'으로 변경해 줍니다. */
		document.myform.sell_Status.value = '대기중';
	};
</script>
</head>
<body>
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
		<form enctype="multipart/form-data" method="post"
			action="${apppath}/sellApp.se" class="form-horizontal" role="form"
			name="myform" onsubmit="return chk_submit();">

			<div class="form-group">
				<div class="file-upload">
					<!-- 사업자 상태 --------------------------------------------------- -->
					<input type="text" name="sell_Status" value="${bean.sell_Status}">
					<br />
					<br />
					<!-- 파일 업로드 --------------------------------------------------- -->
					<button class="file-upload-btn" type="button"
						onclick="$('.file-upload-input').trigger( 'click' )">*Add
						Image</button>
					<div class="image-upload-wrap">
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
					<!-- 파일 업로드 --------------------------------------------------- -->
					<div class="file-upload-content">
						<img class="file-upload-image" src="#" alt="your image" />
						<div class="image-title-wrap">
							<button type="button" onclick="removeUpload()"
								class="remove-image">
								Remove <span class="image-title">Uploaded Image</span>
							</button>
						</div>
					</div>
					<br /> <br /> <br /> <br /> <br />
					<button class="file-upload-btn" type="button">*사업자번호 입력</button>
					<br />
					<br /> <input type="text" placeholder="----- License Number -----"
						style="padding: 10px; text-align: center; margin: 0px; font-size: 20pt; height: 100px;"
						class="form-control" name="sell_License" id="sell_License"
						value="${bean.sell_License}"> <span class="valid_check"
						id="err_sellLicense"></span>

				</div>
			</div>

		</form>
		<%-- 하단 버튼------------------------------------------------- --%>

		<div class="submit_btn col-sm-offset-3 col-sm-6">
			<p class="fas_text">
				<i class="fas fa-check-circle"></i>&nbsp;타인에게 사업자 명의를 빌려주거나 타인 명의로
				사업 영위할 경우, <br />국세 및 부가가치세법 등에 대한 불이익이 있을 수 있습니다.
			</p>
			<button class="appsubmit" type="submit" data-toggle="modal"
				id="submit" name="submit" data-target="#myModal"
				onkeyup="AppSubmit();">동의하고
				승인 신청하기</button>
		</div>
		
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