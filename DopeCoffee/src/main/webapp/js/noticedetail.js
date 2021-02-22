var modalConfirm = function(callback){
  
  $("#delbtn").on("click", function(){
    $("#myModal").modal('show');
  });

  $("#modal-btn-del").on("click", function(){
    callback(true);
    $("#myModal").modal('hide');
  });
  
  $("#modal-btn-no").on("click", function(){
    callback(false);	
    $("#myModal").modal('hide');
  });
};

modalConfirm(function(confirm){
	
  if(confirm){
	location.href="${contextPath}/nodelete.no?num=${bean.num}";
  }else{
    return;
  }
});

