/* ===============================
	사업자회원 정보 수정 시 유효성
   ===============================
*/
		var font_color = '#5080BF';
		var sellPWCheck = false;
		var sellNameCheck = false;
		var sellContactCheck = false;
		
		$(document).ready(function() {
			$("#sell_PW").keyup(function() {
				if ($(this).val().length < 8) {
					$("#err_sellPW").text('비밀번호는 8글자 이상 입력하세요!');
					$("#err_sellPW").css("color", font_color);
				} else {
					$("#err_sellPW").text('');
					sellPWCheck = true;
				}
			});
			$("#sell_PW").blur(function() {
				var sell_PW = $('#sell_PW').val();
				if (sell_PW.length == 0) {
					$("#err_sellPW").text('필수 입력 항목입니다.');
					$("#err_sellPW").css("color", font_color);
				} else {
					$("#err_sellPW").text('');
				}
			});
			
			$("#sell_Name").keyup(function() {
				if ($(this).val().length < 1) {
					$("#err_sellName").text('이름은 1글자 이상 입력하세요!');
					$("#err_sellName").css("color", font_color);
				} else {
					$("#err_sellName").text('');
					sellNameCheck = true;
				}
			});
			$("#sell_Name").blur(function() {
				var sell_Name = $('#sell_Name').val();
				if (sell_Name.length == 0) {
					$("#err_sellName").text('필수 입력 항목입니다.');
					$("#err_sellName").css("color", font_color);
				} else {
					$("#err_sellName").text('');
				}
			});
						
			$("#sell_Contact").keyup(function() {
				if ($(this).val().length < 6) {
					$("#err_sellContact").text('연락처는 6글자 이상 입력하세요!');
					$("#err_sellContact").css("color", font_color);
				} else {
					$("#err_sellContact").text('');
					sellContactCheck = true;
				}
			});
			$("#sell_Contact").blur(function() {
				var sell_Contact = $('#sell_Contact').val();

				if (sell_Contact.length == 0) {
					$("#err_sellContact").text('필수 입력 항목입니다.');
					$("#err_sellContact").css("color", font_color);
				} else {
					$("#err_sellContact").text('');
				}
			});					
		});
		
/* ===============================
	사업자회원 수정 시 수정완료 버튼
   ===============================
*/
		function chk_submit() {
			if (sellPWCheck == false || sellNameCheck == false || sellContactCheck == false) {
				$('#sellup-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('입력한 값을 확인하세요!');
				return false;
			} 

			if($('#sell_PW').val().length < 8){
				$('#sellup-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('비밀번호를 다시 확인해주세요!');
				return false;
			} 
			if($('#sell_Name').val().length < 1){
				$('#sellup-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('이름을 다시 확인해주세요!');
				return false;
			} 			
			if($('#sell_Contact').val().length < 6){
				$('#sellup-submit').effect("shake");
				$('button#modalbtn1').attr('data-toggle', 'modal');
				$('#modal-title').html(
						'<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').text('연락처를 다시 확인해주세요!');
				return false;
			} 					

			return true;
		};
