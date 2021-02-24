/*===========================
	커피 상품 등록 
==============================*/


/*===========================
	유효성 검사  
==============================*/
var font_color = '#5080BF';


$(document).ready(function(){ // 페이지 로딩 될때 

	// 주제
  $("#p_type").click(function(){
   	var p_type = $('#p_type option:selected').val(); 
	// alert(p_type);
	
	if(p_type == 0){
		$('#err_p_type').text('주제를 선택하세요!');
		$('#err_p_type').css('color' , font_color);
	}else{
		$('#err_p_type').text('');
	}
	

  });
	
	// 상품명

	
	$("#p_name").keyup(function(){
		
		
		if(p_name.length < 4 ){
			$('#err_p_name').text('상품명은 4글자이상으로 해주세요.');
			$('#err_p_name').css('color' , font_color);
		}else {
			$('err_p_name').text('');
		}
	});
	
	var p_name_check = /^[0-9]$/;
	//var p_name_check = /^[a-zA-Z]$/;
	//var p_name_check = /^[가-힣]$/;
	
	$("#p_name").blur(function(){
		var p_name = $("#p_name").val();
		if(p_name.length == 0){
			$('#err_p_name').text('상품명을 입력해주세요.');			
			$('#err_p_name').css('color' , font_color);
		}else if(p_name.length != 0){
			$('err_p_name').text('');
		}else if(!p_name_check.test(p_name)){
			$('#err_p_name').text('상품명은 숫자는 사용할 수 없습니다.');
			$('#err_p_name').css('color' , font_color);			
		}
	});
	
	//가격
	
	
	
	$("#p_price").blur(function(){
		var p_price = $("#p_price").val();
		if(p_price.length == 0){
			$('#err_p_price').text('상품의 가격을 입력하여 주세요.');
			$('#err_p_price').css('color' , font_color);
		}
	});
	
		$("#p_price").keyup(function(){
		
		if(p_price.length == 0){
			$('#err_p_price').text('상품의 가격을 입력하여 주세요.');
			$('#err_p_price').css('color' , font_color);
		}
	});
	
	//원산지
	
	
	
	$("#p_origin").blur(function(){
		var p_origin = $('#p_origin').val();
			if(p_origin.length == 0){
			$('#err_p_origin').text('원산지를 입력해주세요.');			
			$('#err_p_origin').css('color' , font_color);			
			}else if (p_qty.length != 0){
				$('#err_p_origin').text('');				
			}
		
	});
	

	

	
	//재고 수량
	
	
	$('#p_qty').blur(function(){
		var p_qty = $('#p_qty').val();
		if(p_qty.length == 0){
			$('#err_p_qty').text('재고를 입력해주세요.');			
			$('#err_p_qty').css('color' , font_color);	
		}else if(p_qty.length != 0){
			$('#err_p_qty').text('');
		}

		});		
	
		$('#p_qty').keyup(function(){
			var p_qty = $('#p_qty').val();
			if(p_qty < 10){
			$('#err_p_qty').text('재고수량은 10개이상 입력해주세요.');			
			$('#err_p_qty').css('color' , font_color);
			}else if (p_qty.length != 0){
				$('#err_p_qty').text('');				
			}

		});		
	
	
});

