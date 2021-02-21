/*
원데이 클래스 등록 자바 스크립트 START
 */

/* ----------------- 상단 Step Process Bar --------------------- */
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

/* -----------------다음 단계 버튼을 눌렀을 때----------------------------- */
function next_check1(){
	var c_type = $('#c_type option:selected').val();
	var c_name = $('#c_name').val();
	var c_price = $('#c_price').val();
	var c_origin = $('#c_origin').val();
	var c_weight = $('#c_weight').val();
	var c_roasting = $('#c_roasting').val();
	var c_blending = $('#c_blending').val();
	var c_crushing_status = $('#c_crushing_status').val();
	var c_qty = $('#"c_qty"').val();
	
	if(c_type == '-' || c_name == '' || c_price == '' ||
	c_origin == '' || c_weight == '' || c_roasting == '' ||
	c_blending == '' || c_crushing_status == ''|| c_qty == ''){
		$('#isCheck').val('false');
		$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
		$('#modal-body').text('입력한 값을 확인하세요!');
	}else{
		$('#isCheck').val('true');
		var result = nextTab(elem);
		return result;
	}
	
}




function nextTab(elem) {
	var isCheck = $('#isCheck').val();
	if(isCheck == 'true'){
   		$(elem).next().find('a[data-toggle="tab"]').click();
	}else{
		$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
		$('#modal-body').text('입력한 값을 확인하세요!');
	}
}
	
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}


/* --------------------------------------------------------------- */





/* --------------------------------------------------------------- */
/* ------------------- 코드 중복 검사 ajax 활용 ------------------------*/
function code_ajax() {
	var code = $('#code').val();
	//alert(code);
	$.ajax({
		type: "GET",
		url: "onedayCodeCheck.odc",
		data: { "code": code },
		dataType: "json",          // ajax 통신으로 받는 타입
        contentType: "application/json",  // ajax 통신으로 보내는 타입
		success: function(data) { // OnedayClassCodeCheckController 컨트롤러 cnt 값
			console.log("1 = 중복 O / 0 = 중복X : " + data);
			if (data == 1) {
				// 1 : 코드가 중복 되는 문구 
				$('#code_check').text('사용중인 코드입니다.');
				$('#code_check').css('color', 'red');
				$('#contact-submit').attr("disabled", true);
			} else {

				if (codeJ.test(code)) {
					// 0 : 코드 길이 / 문자열 검사 
					$('#code_check').text('코드를 입력해주세요.');
					$('#code_check').css('color', 'red');
					$('#contact-submit').attr("disabled", false);
				} else {
					$('#code_check').text('코드는 소문자와 숫자 4~12자리만 가능합니다');
					$('#code_check').css('color', 'red');
					$('#contact-submit').attr("disabled", false);
				}
			}
		}, error: function() {
			alert("통신 실패")
		}

	});
}
/* --------------------------------------------------------------- */




/* ---------------------- 유효성 검사 --------------------------------*/
var font_color = '#5080BF';

$(document).ready(function(){ 
	// 주제
	$("select#c_type option").click(function(){
		var c_type = $('#c_type option:selected').val();
		if(c_type == 'singleorigin'){
			$('#code').val( c_type + '_');
			$("#err_type").text('');
		}else if(c_type == 'blending'){
			$('#code').val( c_type + '_');
			$("#err_c_type").text('');			
			}else if(c_type == 'capsul'){
			$('#code').val( c_type + '_');
			$("#err_c_type").text('');		
		}else{
			if(c_type == '-'){
				$('#code').val('');
				$("#err_c_type").text('커피타입를 선택하세요!');
				$("#err_c_type").css("color" , font_color);		
			}else{
				$("#err_c_type").text('');
			}
		}
	});
	
	

	// 상품명
	$("#c_name").keyup(function(){
		if($(this).val().length < 3){
			$("#err_c_name").text('3글자 이상 입력하세요!');
			$("#err_c_name").css("color" , font_color);
		}else{
			$("#err_c_name").text('');
		}
		
	});
	
	
	$("#c_name").blur(function(){
		var c_name = $('#c_name').val();

		if(c_name.length == 0){
			$("#c_name").text('상품명을 입력하세요!');
			$("#c_name").css("color" , font_color);
		}else{
			$("#c_name").text('');
		}
		
		
	});
	
	// 수강 인원	
	$("#person").blur(function(){
		var person = $('#person').val();
		
		if(person.length >= 2){
			if(person.charAt(0) == '0'){
				$("#err_person").text('인원수를 확인해주세요!');
				$("#err_person").css("color" , font_color);
			}else{
				$("#err_person").text('');
			}
		}else if(person.length == 1){
			if(person.charAt(0) == '0'){
				$("#err_person").text('1명 이상만 입력 가능합니다!');
				$("#err_person").css("color" , font_color);
			}else{
				$("#err_person").text('');
			}
		}else if(person.length == 0){
			$("#err_person").text('수업에 참여 가능한 최대 인원수를 입력하세요!');
			$("#err_person").css("color" , font_color);
		}else{
			$("#err_person").text('');
		}		
		
		
	});
	
	// 가격	
	$("#oneprice").keyup(function(){
		if($(this).val().length < 4){
			$("#err_oneprice").text('1000원 단위부터 입력 가능합니다!');
			$("#err_oneprice").css("color" , font_color);
		}else{
			$("#err_oneprice").text('');
		}
		
	});
	
	
	$("#oneprice").blur(function(){
		var oneprice = $('#oneprice').val();
		
		if(oneprice.length >= 2){
			if(oneprice.charAt(0) == '0'){
				$("#err_oneprice").text('가격을 확인해주세요!');
				$("#err_oneprice").css("color" , font_color);
			}else{
				$("#err_oneprice").text('');
			}
		}else if(oneprice.length == 1){
			if(oneprice.charAt(0) == '0'){
				$("#err_oneprice").text('1000원 단위부터 입력 가능합니다!');
				$("#err_oneprice").css("color" , font_color);
			}else{
				$("#err_person").text('');
			}
		}else if(oneprice.length == 0){
			$("#err_oneprice").text('1인 기준 가격을 입력하세요!');
			$("#err_oneprice").css("color" , font_color);
		}else{
			$("#err_oneprice").text('');
		}		
		
		
	});
	

	

	

	
	
});
/* -------------------------------------------------------------- */

