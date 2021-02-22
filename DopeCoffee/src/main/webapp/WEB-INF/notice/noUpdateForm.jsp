<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	padding-top: 100px;
}
</style>
</head>
<body>
	<section id="notice-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
							data-wow-delay="0.3s">공지사항 수정</h2>

						<div class="container">
							<div class="row">
								<section>
									<div class="wizard">
										<div class="wizard-inner wow fadeInDown "
											data-wow-duration="500ms" data-wow-delay="0.3s">
											<div class="connecting-line"></div>
										</div>

										<!-- =============================================[Form 양식 시작]============================================= -->
										<div class="notice-form">
											<c:set var="contextPath" value="<%=contextPath%>"
												scope="application" />
											<form id="noti-form" method="post"
												action="${contextPath}/noupdate.no" role="form"
												enctype="multipart/form-data">
												<input type="hidden" name="pageNumber"
													value="${param.pageNumber}"> <input type="hidden"
													name="pageSize" value="${param.pageSize}"> <input
													type="hidden" name="mode" value="${param.mode}"> <input
													type="hidden" name="keyword" value="${param.keyword}">
												<input type="hidden" name="num" id="num" value="${bean.num}">
												<!-- step1 -->
												<div class="tab-pane active  wow fadeInDown"
													data-wow-duration="500ms" data-wow-delay="0.6s"
													role="tabpanel" id="step1">
													<!-- ------------------------------------- [공지사항 제목]--------------------------------------- -->
													<div class="form-group">
														제목<input type="text" class="form-control"
															placeholder="제목입력" id="title" name="title"
															value="${bean.title }"> <span class="valid_check"
															id="err_title"></span>
													</div>
													<!-- ------------------------------------- [작성자]--------------------------------------- -->
													<div id="writer" class="form-group">
														작성자<input type="text" class="form-control "
															placeholder="작성자" id="fakewriter" name="fakewriter"
															value="도프커피" disabled="disabled"> <input
															type="hidden" name="writer" id="writer"
															value="${sessionScope.loginfo.cust_Email}" />
													</div>
													<!-- ------------------------------------- [내용]--------------------------------------- -->
													<div class="form-group">
														<textarea class="form-control" id="content" name="content"
															placeholder="내용 입력" >${bean.content }</textarea>
														<span class="valid_check" id="err_content"></span>
													</div>
													<!-- ------------------------------------- [중요도]--------------------------------------- -->
													<div class="form-group">
														<select class="form-control" name="fix" id="fix">
															<option class="form-control" value="">-</option>
															<option class="form-control" value="0">일반</option>
															<option class="form-control" value="1">중요</option>
														</select> <span class="valid_check" id="err_fix"></span>
													</div>
													<!-- ------------------------------------- [사진]--------------------------------------- -->
													<div class="form-group">
														<input name="image" type="hidden" value="${bean.image}">
														<input name="oldimg" type="hidden" value="${bean.image}">
														<input type="file" class="form-control" name="img"
															id="img" placeholder="이미지를 넣어 주셔용^^">
													</div>

													<ul class="list-inline pull-right">
														<li class="step-li"><input type="submit"
															id="noti-submit" class="btn btn-default btn-send"
															value="등록 하기"></li>
													</ul>
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
	<script type="text/javascript">
		var font_color = '#5080BF';

		$(document).ready(function() {
			$("#title").keyup(function() {
				if ($(this).val().length < 3) {
					$("#err_title").text('3글자 이상 입력하세요!');
					$("#err_title").css("color", font_color);
				} else {
					$("#err_title").text('');
				}

			});
			$("#title").blur(function() {
				var classname = $('#title').val();

				if (classname.length == 0) {
					$("#err_title").text('제목을 입력하세요!');
					$("#err_title").css("color", font_color);
				} else {
					$("#err_title").text('');
				}
			});

			$("#content").keyup(function() {
				if ($(this).val().length < 10) {
					$("#err_content").text('내용은 10글자 이상 입력하세요!');
					$("#err_content").css("color", font_color);
				} else {
					$("#err_content").text('');
				}

			});
			$("#content").blur(function() {
				var classname = $('#content').val();

				if (classname.length == 0) {
					$("#err_content").text('내용을 입력하세요!');
					$("#err_content").css("color", font_color);
				} else {
					$("#err_content").text('');
				}
			});

		});

		$("select#fix option").click(function() {
			var type = $('#fix option:selected').val();
			if (type == "") {
				$("#err_type").text('중요도를 선택하세요!');
				$("#err_type").css("color", font_color);
			} else {
				$("#err_type").text('');
			}
		});
	</script>

</body>
</html>