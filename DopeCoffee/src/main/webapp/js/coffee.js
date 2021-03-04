/*===========================
	커피 상품 등록 
==============================*/






/*===========================
	유효성 검사  
==============================*/
var font_color = '#5080BF';


$(document).ready(function(){ // 페이지 로딩 될때 

	// 주제
  $("#c_type").click(function(){
   	var c_type = $('#c_type option:selected').val(); 
	// alert(c_type);
	
	if(c_type == '0'){
		$('#err_c_type').text('주제를 선택하세요!');
		$('#err_c_type').css('color' , font_color);
	}else{
		$('#err_c_type').text('');
	}
	
	

  });
	
	// 상품명

	
	$("#c_name").keyup(function(){
		
		
		if(c_name.length < 4 ){
			var c_name = $("#c_name").val();
			$('#err_c_name').text('상품명은 4글자이상으로 해주세요.');
			$('#err_c_name').css('color' , font_color);
		}else {
			$('err_c_name').text('');
		}
	});
	
	var c_name_check = /^[0-9]$/;
	//var c_name_check = /^[a-zA-Z]$/;
	//var c_name_check = /^[가-힣]$/;
	
	$("#c_name").blur(function(){
		var c_name = $("#c_name").val();
		if(c_name.length == 0){
			$('#err_c_name').text('상품명을 입력해주세요.');			
			$('#err_c_name').css('color' , font_color);
		}else if(c_name.length != 0){
			$('err_c_name').text('');
		}
	});
	
	//가격
	
	
	
	$("#c_price").blur(function(){
		var c_price = $("#c_price").val();
		if(c_price.length == 0){
			$('#err_c_price').text('상품의 가격을 입력하여 주세요.');
			$('#err_c_price').css('color' , font_color);
		}else if(c_price.length != 0){
			$('#err_c_price').text('');
		}
	});
	
		$("#c_price").keyup(function(){
		
		if(c_price.length == 0){
			$('#err_c_price').text('상품의 가격을 입력하여 주세요.');
			$('#err_c_price').css('color' , font_color);
		}
	});
	
	//원산지
	
	
	
	$("#c_origin").blur(function(){
		var c_origin = $('#c_origin').val();
			if(c_origin.length == 0){
			$('#err_c_origin').text('원산지를 입력해주세요.');			
			$('#err_c_origin').css('color' , font_color);
		}else if(c_qty.length != 0){
			$('#err_c_origin').text('');
		}
	});
	
	//무게
		
	$('#c_weight').blur(function(){
		var c_weight = $('#c_weight').val();
		if(c_weight.length == 0){
			$('#err_c_weight').text('재고를 입력해주세요.');			
			$('#err_c_weight').css('color' , font_color);	
		}else if(c_weight.length != 0){
			$('#err_c_weight').text('');
		}

		});		
	
	
	//로스팅여부
	var c_roasting = $('#c_roasting').val();
	
	$("#c_roasting").blur(function(){
		var c_roasting = $('#c_roasting').val();
			if(c_origin.length == 0){
			$('#err_c_roasting').text('로스팅여부를 입력해주세요.');			
			$('#err_c_roasting').css('color' , font_color);
		}else if(c_roasting.length != 0){
			$('#err_c_roasting').text('');
		}
	});
	
	//블렌딩종류
	var c_blending = $('#c_blending').val();
	
	$("#c_blending").blur(function(){
		var c_blending = $('#c_blending').val();
			if(c_blending.length == 0){
			$('#err_c_blending').text('블렌딩 종류를 입력해주세요.');			
			$('#err_c_blending').css('color' , font_color);
		}else if(c_blending.length != 0){
			$('#err_c_blending').text('');
		}
	});
	//분쇄타입
	$("#c_crushing_status").click(function(){
		var c_crushing_status = $('#c_crushing_status option:selected').val();
		
		if(c_crushing_status == '-'){
		$('#err_c_crushing_status').text('분쇄타입을 선택하세요!');
		$('#err_c_crushing_status').css('color' , font_color);
	}else{
		$('#err_c_crushing_status').text('');
		}
	});
	
	//재고 수량
	

	$('#c_qty').blur(function(){
			var c_qty = $('#c_qty').val();
		if(c_qty.length == 0){
			$('#err_c_qty').text('재고를 입력해주세요.');			
			$('#err_c_qty').css('color' , font_color);	
		}else if(c_qty.length != 0){
			$('#err_c_qty').text('');
		}

		});		
	
		$('#c_qty').keyup(function(){
				var c_qty = $('#c_qty').val();
			if(c_qty < 10){
			$('#err_c_qty').text('재고수량은 10개이상 입력해주세요.');			
			$('#err_c_qty').css('color' , font_color);
			}else if (c_qty >= 10){
				$('#err_c_qty').text('');				
			}

		});		
		//이미지
	
	
	
});

function insertcheck(){
		var image1 = $('#cf_image').val();
		var valid_check = $('#valid_check').text();
		
		if(image1 == ''){
			$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>'); // 느낌표 아이콘
			$('#modal-body').text('메인 이미지를 등록하세요.');
			$('#myModal').modal();
			
			return false;
		}else if(valid_check != ''){
			$('#modal-title').html('<i class="fas fa-exclamation-circle"></i>'); // 느낌표 아이콘
			$('#modal-body').text('입력 값을 확인하세요.');
			$('#myModal').modal();			
			return false;
		}else{
			return true;
			
			
		}
		
		
		
}


// 페이지가 로딩되었을 때 실행되는 함수 //
function today() {
	$('#search').hide(); // 검색 부분 (===> 상품 리스트 목록 부분)
	
}	
	
	
/* ===================
	원데이 클래스 목록[시작]
   ===================
*/

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});


// 페이지가 로딩 되면 
$(document).ready(function(){
	// 가격 콤마 찍기
	var c_price = $('#list_price').text();
	c_price = addcomma(c_price);
	
	function addcomma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	// 최종 가격 문장
	var result_oneprice = '<i class="fas fa-won-sign"></i>&nbsp;' + c_price;
	$('#list_price').html(result_oneprice);
	
	
});

// 검색 버튼을 누르면 검색 창이 나오게 수정
function search(){
	$('#search').toggle();
}


// 
 function plus(){
	//선택한 수량
	var qty = $('#qty').val();
	qty = parseInt(qty);
	// 현재 재고
	var totalqty = $('#total_qty').val();
	qty = parseInt(qty);
	// 커피상품1개의 가격
	var c_price = $('#c_price').text();	
	 c_price = parseInt(c_price);

	var totalprice = '';			
	var total = '';
	
	if( qty < totalqty ){
		total = qty + 1;
		totalprice = c_price * total ;				
	}else{
		total = qty; 				
	}
	$('#qty').val(total);
	$("#totalprice").text(totalprice + '원');
	
	
	return false;
}

 function minus(){
	//선택한 수량
	
	var qty = $('#qty').val();	
		qty = parseInt(qty);
		
		
	var c_price = $('#c_price').text();	
	 c_price = parseInt(c_price);
	var totalprice = '';
	var total = '';
	if(qty == 1){
		total = qty;
	}else{
		total = qty - 1;
		totalprice = c_price * total;
	}
	$('#qty').val(total);
	$("#totalprice").text(totalprice + '원');
	return false;
	
}
	/* ===============================  
	   커피원두 삭제
==================================*/
function getContextPath() {
	var offset = location.href.indexOf(location.host) + location.host.length;
	var ctxPath = location.href.substring(offset, location.href.indexOf('/', offset + 1));
	return ctxPath;
}

function delete_check() {
	var c_no = $('#c_no').val();
	location.href = getContextPath() + "/cfdelete.cf?c_no=" + c_no;
}



$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
	
		/* ===============================  
	   장바구니 이동
==================================*/

function shop_cart(){
	var c_no = $('#c_no').val();
	var c_qty = $('#c_qty').val();
	var qty = $('#qty').val();	
	location.href = getContextPath() + "/insert.sc?c_no=" + c_no  + "&qty=" + qty;
};



