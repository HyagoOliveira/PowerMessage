var divPhone;

$(function(){	
	applyMask();
	divPhone = $("#phonediv").clone();
	var size = $('#telefonesTable').children().length;
	if(size > 2)
		$('.red').removeClass('disabled');
});

function applyMask() {
	$('.ddd').mask('99');
	$('.phone').mask('99999-9999');	
}

function addPhone(){
	var size = $('#telefonesTable').children().length;

	if(size == 2)
		$('.red').removeClass('disabled');
	
	divPhone.children().each(function (index, value) {
		if ($(value).prop("id") == "numero")
			$(value).val("");
			$(value).removeClass('disabled')
	});
	$("#telefonesTable").append($(divPhone).clone());
	applyMask();
	
}

function removePhone(valor){
	
	var size = $('#telefonesTable').children().length;

	if(size > 2)
		$(valor).parent().remove();
	if(size == 3)
		$('.red').addClass('disabled');
	
}
