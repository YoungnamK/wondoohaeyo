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
	var type = $('#type option:selected').val();
	var code = $('#code').val();
	var classname = $('#classname').val();
	var person = $('#person').val();
	var oneprice = $('#oneprice').val();
	var zipcode = $('#zipcode').val();
	var address1 = $('#address1').val();
	var address2 = $('#address2').val();
	
	
	if(type == '-' || code == '' || classname == '' ||
	person == '' || oneprice == '' || zipcode == '' ||
	address1 == '' || address2 == ''){
		$('#isCheck').val('false');
		$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
		$('#modal-body').text('입력한 값을 확인하세요!');
	}else{
		$('#isCheck').val('true');
		var result = nextTab(elem);
		return result;
	}
	
}

function next_check2(){
	var enddate = $('#enddate').val();
	var opentime = $('#opentime').val();
	var closetime = $('#closetime').val();
	
	if(enddate == '' || opentime == '' || closetime == ''){
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

/* ------------------ 현재 날짜를 구해주는 함수 --------------------------*/
function today() {
	var today = new Date();
	var year = today.getFullYear(); //년도 
	var _month = today.getMonth() + 1;
	var _date = today.getDate();
	var month; // 월 
	var date; // 날짜 

	if (_month < 10) { // 1의 자리 일때 
		month = "0" + _month;
	} else {
		month = _month;
	}

	if (_date < 10) { // 1의 자리 일때 
		date = "0" + _date;
	} else {
		date = _date;
	}

	var startdate = String(year) + String(month) + String(date);
	//alert(startdate);
	$('#fake-startdate').val(startdate);
	$('#startdate').val(startdate);
	
	// 로드 되었을 때 , 추가 시간은 안보이게 처리 
	$('.add').hide();
}
/* +시간 버튼을 눌러야지 추가 시간 section 이 보이게 처리 */
$(document).ready(function(){ 
	$('.btn_icon').click(function (){
		var enddate = $('#enddate').val();
		var opentime = $('#opentime').val();
		var closetime = $('#closetime').val();
		
		$(".btn_icon").attr("data-toggle", "modal"); // 에러가 났을 때 지워놨던 modal 속성 원복
		
		if(enddate != '' && opentime != '' && closetime != ''){
			$('.btn_icon').removeAttr('data-toggle');
			$('.add').toggle();
		}else{
			$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
			$('#modal-body').text('기본 수업 정보를 먼저 입력하세요!');
		}
		
	});
	
});



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
/* -----------------------우편번호 찾기------------------------------ */
function zipCheck(){
	var width = 500; //팝업의 너비
	var height = 600; //팝업의 높이
	new daum.Postcode({
		width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
  		height: height,
        oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
			document.getElementById('fakezipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            document.getElementById("fakeaddress1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open({
		left: (window.screen.width / 2) - (width / 2),
    	top: (window.screen.height / 2) - (height / 2)
	});
}

/* --------------------------------------------------------------- */
/* ------------------- pickadate 날짜 지정 / pickatime 시간 지정--------------------------*/
function date(){
	$('.datepicker').pickadate({
		  monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
		  format: 'yyyymmdd', // 데이터 형식
		  min: 1, // 당일 이후 부터 선택 가능
	      max : false, // 값 선택은 최대로 지정
		  showMonthsShort: true
	});
}

function time(){
	var from_$input = $('.input_from').pickatime(),
    from_picker = from_$input.pickatime('picker')

	var to_$input = $('.input_to').pickatime({
        formatLabel: function( timeObject ) {
            var minObject = this.get( 'min' ),
                hours = timeObject.hour - minObject.hour,
                mins = ( timeObject.mins - minObject.mins ) / 60,
                pluralize = function( number, word ) {
                    return number + ' ' + ( number === 1 ? word : word + 's' )
                }
            return '<b>HH</b>:i <!i>A</!i> '
        }
    }),
	to_picker = to_$input.pickatime('picker')
	
	// Check if there’s a “from” or “to” time to start with.
	if ( from_picker.get('value') ) {
	  to_picker.set('min', from_picker.get('select'))
	}
	if ( to_picker.get('value') ) {
	  from_picker.set('max', to_picker.get('select') )
	}

	// When something is selected, update the “from” and “to” limits.
	from_picker.on('set', function(event) {
	  if ( event.select ) {
	    to_picker.set('min', from_picker.get('select'))
	  }
	})
	to_picker.on('set', function(event) {
	  if ( event.select ) {
	    from_picker.set('max', to_picker.get('select'))
	  }
	})
	
}

/* ---------------------- 유효성 검사 --------------------------------*/
var font_color = '#5080BF';

$(document).ready(function(){ 
	// 주제
	$("select#type option").click(function(){
		var type = $('#type option:selected').val();
		if(type == 'coffee'){
			$('#code').val( type + '_');
			$("#err_type").text('');
		}else if(type == 'pottery'){
			$('#code').val( type + '_');
			$("#err_type").text('');
		}else{
			if(type == '-'){
				$('#code').val('');
				$("#err_type").text('주제를 선택하세요!');
				$("#err_type").css("color" , font_color);		
			}else{
				$("#err_type").text('');
			}
		}
	});
	
	// 클래스 코드 
	$("#code").blur(function(){
		var code = $('#code').val();

		if(code.length == 0){
			$("#err_code").text('클래스 코드를 입력하세요!');
			$("#err_code").css("color" , font_color);
		}else if(code.length > 0){
			if(code.indexOf('coffee_') == 0 || code.indexOf('pottery_') == 0){
				$("#err_code").text('');
			}else{
				$("#err_code").text('언더바 다음부터 입력이 가능합니다! 주제를 다시 선택하세요.');
			}
		}else{
			$("#err_code").text('');
		}
		
	});
	
	$("#code").keyup(function(){
		var code = $('#code').val();
		if(code.length > 0){
			$("#err_code").text('반드시 클래스 코드를 기억해주세요! 코드는 중복 불가합니다.');
			$("#err_code").css("color" , font_color);
		}
	});
	

	// 클래스명
	$("#classname").keyup(function(){
		if($(this).val().length < 4){
			$("#err_classname").text('4글자 이상 입력하세요!');
			$("#err_classname").css("color" , font_color);
		}else{
			$("#err_classname").text('');
		}
		
	});
	
	
	$("#classname").blur(function(){
		var classname = $('#classname').val();

		if(classname.length == 0){
			$("#err_classname").text('클래스 명을 입력하세요!');
			$("#err_classname").css("color" , font_color);
		}else{
			$("#err_classname").text('');
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
	
	// 상세 주소
	$("#address2").blur(function(){
		var address2 = $('#address2').val();

		if(address2.length == 0){
			$("#err_address2").text('상세 주소를 입력하세요!');
			$("#err_address2").css("color" , font_color);
		}else{
			$("#err_address2").text('');
		}
		
		
	});
	
	// 상품 설명
	$("#content").keyup(function(){
		if($(this).val().length > 0){
			$("#err_content").text('해당 내용은 원데이 클래스 세부 목록에 기재됩니다.');
			$("#err_content").css("color" , font_color);
		}else{
			$("#err_content").text('');
		}
		
	});
	
	$("#content").blur(function(){
		var content = $('#content').val();

		if(content.length > 0){
			$("#err_content").text('');
		}
	});
	
	// 수업 마감 일자
	$("#enddate").mouseleave(function(){
		var enddate = $('#enddate').val();

		if(enddate == ''){
			$("#err_enddate").text('클래스 개설 마감 일자를 선택하세요!');
			$("#err_enddate").css('color', font_color);
		}else{
			$("#err_enddate").text('');
		}
	});
	
	// 수업 오픈 시간 
	$("#opentime").mouseleave(function(){
		var opentime = $('#opentime').val();

		if(opentime == ''){
			$("#err_opentime").text('클래스 개설 오픈 시간을 선택하세요!');
			$("#err_opentime").css('color', font_color);
		}else{
			$("#err_opentime").text('');
		}
	});
	
	// 수업 마감 시간 
	$("#closetime").mouseleave(function(){
		var opentime = $('#opentime').val();
		var closetime = $('#closetime').val();
		
		if(closetime == ''){
			$("#err_closetime").text('클래스 개설 마감 시간을 선택하세요!');
			$("#err_closetime").css('color', font_color);
		}else if(opentime == closetime){
			$("#err_closetime").text('오픈시간보다 크게 선택하세요!');
			$("#err_closetime").css('color', font_color);
		}else{
			$("#err_closetime").text('');
		}
	});
	
	// 추가 오픈 시간 1
	$("#add_opentime1").mouseleave(function(){
		var add_opentime1 = $('#add_opentime1').val();
		var add_closetime1 = $('#add_closetime1').val();
		
		if(add_opentime1 == '' && add_closetime1 != ''){
			$("#err_add_opentime1").text('추가 클래스 개설 오픈 시간을 확인하세요!');
			$("#err_add_opentime1").css('color', font_color);
		}else if(add_opentime1 != '' && add_closetime1 == ''){
			$("#err_add_closetime1").text('추가 클래스 개설 마감 시간을 확인하세요!');
			$("#err_add_closetime1").css('color', font_color);
		}else{
			$("#err_add_opentime1").text('');
			$("#err_add_closetime1").text('');
		}
	});
	
	// 추가 마감 시간 1
	$("#add_closetime1").mouseleave(function(){
		var add_opentime1 = $('#add_opentime1').val();
		var add_closetime1 = $('#add_closetime1').val();
		
		if(add_opentime1 == '' && add_closetime1 != ''){
			$("#err_add_opentime1").text('추가 클래스 개설 오픈 시간을 확인하세요!');
			$("#err_add_opentime1").css('color', font_color);
		}else if(add_opentime1 != '' && add_closetime1 == ''){
			$("#err_add_closetime1").text('추가 클래스 개설 마감 시간을 확인하세요!');
			$("#err_add_closetime1").css('color', font_color);
		}else{
			$("#err_add_opentime1").text('');
			$("#err_add_closetime1").text('');
		}
	});
	
	// 추가 오픈 시간 2
	$("#add_opentime2").mouseleave(function(){
		var add_opentime2 = $('#add_opentime2').val();
		var add_closetime2 = $('#add_closetime2').val();
		
		if(add_opentime2 == '' && add_closetime2 != ''){
			$("#err_add_opentime2").text('추가 클래스 개설 오픈 시간을 확인하세요!');
			$("#err_add_opentime2").css('color', font_color);
		}else if(add_opentime2 != '' && add_closetime2 == ''){
			$("#err_add_closetime2").text('추가 클래스 개설 마감 시간을 확인하세요!');
			$("#err_add_closetime2").css('color', font_color);
		}else{
			$("#err_add_opentime2").text('');
			$("#err_add_closetime2").text('');
		}
	});
	
	// 추가 마감 시간 2
	$("#add_closetime2").mouseleave(function(){
		var add_opentime2 = $('#add_opentime2').val();
		var add_closetime2 = $('#add_closetime2').val();
		
		if(add_opentime2 == '' && add_closetime2 != ''){
			$("#err_add_opentime2").text('추가 클래스 개설 오픈 시간을 확인하세요!');
			$("#err_add_opentime2").css('color', font_color);
		}else if(add_opentime2 != '' && add_closetime2 == ''){
			$("#err_add_closetime2").text('추가 클래스 개설 마감 시간을 확인하세요!');
			$("#err_add_closetime2").css('color', font_color);
		}else{
			$("#err_add_opentime2").text('');
			$("#err_add_closetime2").text('');
		}
	});
	
	
});
/* -------------------------------------------------------------- */

