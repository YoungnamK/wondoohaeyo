


/* ===================
	원데이 클래스 목록[시작]
   ===================
*/


// 페이지가 로딩 되면 
function list_loading() {
	// 가격 콤마 찍기
	var oneprice = $('#list_price').text();
	oneprice = addcomma(oneprice);

	function addcomma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	// 최종 가격 문장
	var result_oneprice = '<i class="fas fa-won-sign"></i>&nbsp;' + oneprice;
	$('#list_price').html(result_oneprice);

	$('#search').hide(); // 검색 부분 (===> 원데이 클래스 목록 부분)

}


// 검색 버튼을 누르면 검색 창이 나오게 수정
function search() {
	$('#search').toggle();
}



/* ===================
	원데이 클래스 목록[끝]
   ===================
*/


/* =========================
	원데이 클래스 상세 및 결제[시작]
   =========================
*/


$(document).ready(function() {
	// 1인 기준 가격 콤마 찍기
	var oneprice = $('#oneprice').val();
	oneprice = addcomma(oneprice);
	// 가짜 결제 가격 콤마 찍기
	var fake_totalprice = $('#fake_totalprice').val();
	fake_totalprice = addcomma(fake_totalprice);

	// 진짜 결제 가격 콤마 찍기
	var totalprice = $('#totalprice').val();
	totalprice = addcomma(totalprice);

	function addcomma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	// 최종 가격 문장
	var result_oneprice = oneprice;
	var result_fake_totalprice = fake_totalprice;
	var result_totalprice = totalprice;
	$('#oneprice').val(result_oneprice);
	$('#fake_totalprice').val(result_fake_totalprice);
	$('#totalprice').val(result_totalprice);


	/* ===============================  
		버튼 클릭 시 인원수 , 가격 변동 
	 ==================================*/


	// + 버튼을 누르면 인원수 증가 , 결제 금액 증가
	$('#plusbtn').click(function() {
		// 사업자가 설정한 최대 인원수
		var _max_person = $('#max_person').val();
		var max_person = parseInt(_max_person);

		// 사용자가 선택하는 인원수
		var _person = $('#fake_person').val();
		var person = parseInt(_person);

		// 사업자가 설정한 1인 기준 가격 
		var oneprice = $('#oneprice').val();

		oneprice = removecomma(oneprice); // 페이징 로딩 될때 설정했던 콤마 제거

		function removecomma(pStr) {
			var strCheck = /\,/g;
			pStr = pStr.replace(strCheck, '');
			return pStr;
		}

		var person_result; // 사용자가 선택한 총 인원수
		var totalprice; // 사용자가 선택한 총 가격
		var fake_totalprice; // 사용자가 선택한 총 가격

		if (person < max_person) {// 사용자가 선택하는 인원수가 사업자가 설정한 인원수 미만이면 + 1 처리 
			// 인원수 증가
			person_result = person + 1;

			// 파라미터로 넘어갈 총 금액
			totalprice = oneprice * person_result; // 실제 DB로 넘어갈 결제 총 금액
			totalprice = addcomma(totalprice);

			// 사용자에게 보여줄 가짜 총 금액
			fake_totalprice = oneprice * person_result; // 가짜 총 금액(사용자에게 보여줄 용도)
			fake_totalprice = addcomma(fake_totalprice);

			$('button#plusbtn').removeAttr('data-toggle', 'modal');
		} else {//사용자가 선택하는 인원수가 사업자가 설정한 인원수 초과이면 + 0 처리 
			person_result = person;

			// 파라미터로 넘어갈 총 금액
			totalprice = oneprice * person_result; // 실제 DB로 넘어갈 결제 총 금액
			totalprice = addcomma(totalprice);

			// 사용자에게 보여줄 가짜 총 금액
			fake_totalprice = oneprice * person_result; // 가짜 총 금액(사용자에게 보여줄 용도)
			fake_totalprice = addcomma(fake_totalprice);


			$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
			$('#modal-body').text('인원수 초과 입니다!');
			$('#myModal').modal();

		}

		$('#fake_person').val(person_result);
		$('#person').val(person_result);
		$('#totalprice').val(totalprice);
		$('#fake_totalprice').val(fake_totalprice);
	});

	// - 버튼을 누르면 인원수 감소 , 결제 금액 감소
	$('#minusbtn').click(function() {
		var _person = $('#fake_person').val();
		var person = parseInt(_person);
		var person_result;

		// 사업자가 설정한 1인 기준 가격 
		var oneprice = $('#oneprice').val();

		oneprice = removecomma(oneprice); // 페이징 로딩 될때 설정했던 콤마 제거

		function removecomma(pStr) {
			var strCheck = /\,/g;
			pStr = pStr.replace(strCheck, '');
			return pStr;
		}

		var totalprice; // 사용자가 선택한 총 가격
		var fake_totalprice; // 사용자가 선택한 총 가격

		if (person >= 2) { // 최소값은 1로 남겨놔야함

			person_result = person - 1;


			totalprice = person_result * oneprice;
			totalprice = addcomma(totalprice);

			fake_totalprice = person_result * oneprice;
			fake_totalprice = addcomma(fake_totalprice);
		} else {
			person_result = 1


			totalprice = person_result * oneprice;
			totalprice = addcomma(totalprice);

			fake_totalprice = person_result * oneprice;
			fake_totalprice = addcomma(fake_totalprice);
		}
		$('#fake_person').val(person_result);
		$('#person').val(person_result);

		$('#totalprice').val(totalprice);
		$('#fake_totalprice').val(fake_totalprice);
	});
});

/*=======================================
	원데이 클래스 실 결제 처리 => 아임포트 API
=========================================*/

function payment() {
	// 결제 테이블에 넣을 파라미터
	var code = $('#code').val(); // 주문 클래스
	var cust_email = $('#cust_email').val(); // 회원 이메일
	var sell_email = $('#sell_email').val(); // 사업자 이메일
	var bookdate = $('#bookdate').val(); // 예약 일자 
	var booktime = $('#booktime').val(); // 예약 시간 
	var person = $('#person').val(); // 인원수 
	var totalprice = $('#totalprice').val(); // 결제 총 가격
	
	totalprice = removecomma(totalprice); // 페이징 로딩 될때 설정했던 콤마 제거

	function removecomma(pStr) {
		var strCheck = /\,/g;
		pStr = pStr.replace(strCheck, '');
		return pStr;
	}
	
	// API 용 파라미터 
	var cust_Name = $('#cust_Name').val(); // 회원 이름
	var cust_Contact = $('#cust_Contact').val(); // 회원 연락처
	
	
	
	IMP.init('imp63433419'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명: ' + code + " | 결제 테스트",
	    amount : totalprice, // 결제 금액
	    buyer_email : cust_email,// 결제자 이메일
	    buyer_name : cust_Name, // 결제자 이름
	    buyer_tel : cust_Contact// 결제자 휴대폰 번호
	}, function(rsp) {
	    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "/onedayImportApi.odc", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    		type: 'GET',
    		dataType: 'json',
			contentType: "application/json; charset=UTF-8",
    		data: {
	    		imp_uid : rsp.imp_uid,
	    		//기타 필요한 데이터가 있으면 추가 전달
				code : code,
				cust_email : cust_email,
				sell_email : sell_email,
				bookdate : bookdate,
				booktime : booktime,
				person : person,
				totalprice : totalprice	
    		}
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			console.log("확인 ==> " + data)

    		if ( everythings_fine ) {
	
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else{
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
		
		}
	});
}



/* ===============================  
	   원데이 클래스 삭제
==================================*/
function getContextPath() {
	var offset = location.href.indexOf(location.host) + location.host.length;
	var ctxPath = location.href.substring(offset, location.href.indexOf('/', offset + 1));
	return ctxPath;
}

function delete_check() {
	var code = $('#code').val();
	var oneday_seq = $('#oneday_seq').val();
	alert(oneday_seq);
	location.href = getContextPath() + "/onedayDelete.odc?code=" + code + "&oneday_seq=" + oneday_seq;
}



/* ===============================  
	   원데이 클래스 결제
==================================*/



// pickadate API

function booking_date() {

	

	var enddate = $('#enddate').val();

	$('.datepicker').pickadate({
		monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
		format: 'yyyymmdd', // 데이터 형식
		min: 0, // 오늘날짜 부터
		max: enddate, // 사업자가 지정한 enddate 날짜까지 
		showMonthsShort: true
	});


}


/* ===============================
	 유효성 검사
   ===============================
*/

var font_color = '#5080BF';

// 이용 일자 선택 
function myBookdateCheck(){
	var bookdate = $('#bookdate').val();

	var bookdate = $('#bookdate').val();

	if (bookdate == '') { // 예약일자가 선택이 안되었으면
		$('#err_bookdate').text('예약일자를 선택하세요!');
		$("#err_bookdate").css('color', font_color);
	} else { // 예약일자가 선택이 되었으면
		$('#err_bookdate').text('');

		//현재 시각을 구해주는 함수
		let today = new Date();

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월

		if (month < 10) {
			month = "0" + month;
		} else {
			month = month;
		}

		let day = today.getDate();  // 날짜

		if (day < 10) {
			day = "0" + day;
		} else {
			day = day;
		}


		let date = "" + year + month + day; // 현재 날짜

		let hours = today.getHours(); // 시

		var booktime = $('#booktime').val();

		booktime = booktime.substring(0, 8);

		if (booktime.includes('PM')) {// 오후이면
			booktime = parseInt(booktime.substring(0, 2));
			booktime += 12;

			if (date == bookdate && booktime < hours) {
				$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').html('이미 마감된 수업입니다.<br>이용 시간을 확인하세요!');
				$('#myModal').modal();
				$('#booktime').val('-');
			}
		} else {// 오전이면
			booktime = parseInt(booktime.substring(0, 2));

			if (date == bookdate && booktime < hours) {
				$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').html('이미 마감된 수업입니다.<br>이용 시간을 확인하세요!');
				$('#myModal').modal();
			}
		}
	}
}

// 이용 시간 선택
function myBooktimeCheck() {

	var bookdate = $('#bookdate').val();

	if (bookdate == '') { // 예약일자가 선택이 안되었으면
		$('#err_bookdate').text('예약일자를 선택하세요!');
		$("#err_bookdate").css('color', font_color);
	} else { // 예약일자가 선택이 되었으면
		$('#err_bookdate').text('');

		//현재 시각을 구해주는 함수
		let today = new Date();

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월

		if (month < 10) {
			month = "0" + month;
		} else {
			month = month;
		}

		let day = today.getDate();  // 날짜

		if (day < 10) {
			day = "0" + day;
		} else {
			day = day;
		}


		let date = "" + year + month + day; // 현재 날짜

		let hours = today.getHours(); // 시

		var booktime = $('#booktime').val();

		booktime = booktime.substring(0, 8);

		if (booktime.includes('PM')) {// 오후이면
			booktime = parseInt(booktime.substring(0, 2));
			booktime += 12;

			if (date == bookdate && booktime < hours) {
				$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').html('이미 마감된 수업입니다.<br>이용 시간을 확인하세요!');
				$('#myModal').modal();
				$('#booktime').val('-');
			}
		} else {// 오전이면
			booktime = parseInt(booktime.substring(0, 2));

			if (date == bookdate && booktime < hours) {
				$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
				$('#modal-body').html('이미 마감된 수업입니다.<br>이용 시간을 확인하세요!');
				$('#myModal').modal();
			}
		}
	}


}



/*=========================================
	유효성 검사 - 결제하기버튼 / 최종 결제처리 전 단계
  =========================================*/
function payment_check() {
	// 원데이 클래스 예약 할 때의 유효성 검사
	var bookdate = $('#bookdate').val(); // 예약일자
	var booktime = $('#booktime').val();// 이용시간

	if (bookdate == '' || booktime == '-') {
		$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>');
		$('#modal-body').text('예약 정보를 입력하세요!');
		$('#myModal').modal();
		return false;
	} else {
		return true;
	}

}



/*============================
	원데이 클래스 회원용 결제 취소 
================================*/
function getContextPath() {
	var offset = location.href.indexOf(location.host) + location.host.length;
	var ctxPath = location.href.substring(offset, location.href.indexOf('/', offset + 1));
	return ctxPath;
}

function onedayCancle(){
	var onedayorder_seq = $('#onedayorder_seq').val();
	
	console.log(onedayorder_seq);
	
	location.href = getContextPath() + "/onedayCustCancle.odc?onedayorder_seq=" + onedayorder_seq;
}


/*============================
	원데이 클래스 사업자용 결제 취소 
================================*/
function onedaySellCancle(){
	var onedayorder_seq = $('#onedayorder_seq').val();
	
	console.log(onedayorder_seq);
	
	location.href = getContextPath() + "/onedaySellCancle.odc?onedayorder_seq=" + onedayorder_seq;
}

