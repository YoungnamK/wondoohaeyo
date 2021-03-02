
/* ===============================
	개인회원 가입 시 유효성
   ===============================
*/
		var font_color = '#5080BF';
		var custEmailCheck = false;
		var custPWCheck = false;
		var custNameCheck = false;
		var custContactCheck = false;
		var custBirthCheck = false;
		
		$(document).ready(function() {
		
			$("#cust_Email").keyup(function() {
				if ($(this).val().length < 8) {
					$("#err_custEmail").text('이메일은 8글자 이상 입력하세요!');
					$("#err_custEmail").css("color", font_color);
				} else {
					$("#err_custEmail").text('');
					custEmailCheck = true;
				}
			});
			$("#cust_Email").blur(function() {
				var cust_Email = $('#cust_Email').val();
				if (cust_Email.length == 0) {
					$("#err_custEmail").text('필수 입력 항목입니다.');
					$("#err_custEmail").css("color", font_color);
				} else {
					$("#err_custEmail").text('');
				}
			});

			$("#cust_PW").keyup(function() {
				if ($(this).val().length < 8) {
					$("#err_custPW").text('비밀번호는 8글자 이상 입력하세요!');
					$("#err_custPW").css("color", font_color);
				} else {
					$("#err_custPW").text('');
					custPWCheck = true;
				}
			});
			$("#cust_PW").blur(function() {
				var cust_PW = $('#cust_PW').val();
				if (cust_PW.length == 0) {
					$("#err_custPW").text('필수 입력 항목입니다.');
					$("#err_custPW").css("color", font_color);
				} else {
					$("#err_custPW").text('');
				}
			});
			
			$("#cust_Name").keyup(function() {
				if ($(this).val().length < 1) {
					$("#err_custName").text('이름은 1글자 이상 입력하세요!');
					$("#err_custName").css("color", font_color);
				} else {
					$("#err_custName").text('');
					custNameCheck = true;
				}
			});
			$("#cust_Name").blur(function() {
				var cust_Name = $('#cust_Name').val();
				if (cust_Name.length == 0) {
					$("#err_custName").text('필수 입력 항목입니다.');
					$("#err_custName").css("color", font_color);
				} else {
					$("#err_custName").text('');
				}
			});
						
			$("#cust_Contact").keyup(function() {
				if ($(this).val().length < 6) {
					$("#err_custContact").text('연락처는 6글자 이상 입력하세요!');
					$("#err_custContact").css("color", font_color);
				} else {
					$("#err_custContact").text('');
					custContactCheck = true;
				}
			});
			$("#cust_Contact").blur(function() {
				var cust_Contact = $('#cust_Contact').val();

				if (cust_Contact.length == 0) {
					$("#err_custContact").text('필수 입력 항목입니다.');
					$("#err_custContact").css("color", font_color);
				} else {
					$("#err_custContact").text('');
				}
			});

			$("#cust_Birth").keyup(function() {
				if ($(this).val().length == 6) {
					$("#err_custBirth").text('생년월일은 주민등록번호 앞 6자리를 입력해주세요!');
					$("#err_custBirth").css("color", font_color);
				} else {
					$("#err_custBirth").text('');
					custBirthCheck = true;
				}

			});
			$("#cust_Birth").blur(function() {
				var cust_Birth = $('#cust_Birth').val();
				if (cust_Birth.length == 0) {
					$("#err_custBirth").text('필수 입력 항목입니다.');
					$("#err_custBirth").css("color", font_color);
				} else {
					$("#err_custBirth").text('');
				}
			});						
		});

/* ===============================
	개인회원 가입 시 등록 버튼
   ===============================
*/
		function chk_submit() {
			if (custEmailCheck == false || custPWCheck == false
					|| custNameCheck == false || custContactCheck == false || custBirthCheck == false) {
				$('#cust-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('입력한 값을 확인하세요!');
				return false;
			} 
			if($('#cust_Email').val().length < 8){
				$('#cust-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('이메일을 다시 확인해주세요!');
				return false;
			} 
			if($('#cust_PW').val().length < 8){
				$('#cust-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('비밀번호를 다시 확인해주세요!');
				return false;
			} 
			if($('#cust_Name').val().length < 1){
				$('#cust-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('이름을 다시 확인해주세요!');
				return false;
			} 			
			if($('#cust_Contact').val().length < 6){
				$('#cust-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('연락처를 다시 확인해주세요!');
				return false;
			} 					
			if($('#cust_Birth').val().length < 6){
				$('#cust-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('생년월일을 다시 확인해주세요!');
				return false;
			} 		
			return true;
		};
		
/* ===============================
	프로필사진 업로드 관련 
   ===============================
*/
function readURL(input) {
	if (input.files && input.files[0]) {

		var reader = new FileReader();

		reader.onload = function(e) {
			$('.image-upload-wrap').hide();

			$('.file-upload-image').attr('src', e.target.result);
			$('.file-upload-content').show();

			$('.image-title').html(input.files[0].name);
		};

		reader.readAsDataURL(input.files[0]);

	} else {
		removeUpload();
	}
}

function removeUpload() {
	$('.file-upload-input').replaceWith($('.file-upload-input').clone());
	$('.file-upload-content').hide();
	$('.image-upload-wrap').show();
}
$('.image-upload-wrap').bind('dragover', function() {
	$('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function() {
	$('.image-upload-wrap').removeClass('image-dropping');
});
		