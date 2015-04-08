var divPhone;

$(function(){	
	applyMask();
	divPhone = $("#phonediv").clone();
});

function applyMask() {
	$('.ddd').mask('99');
	$('.phone').mask('99999-9999');	
}

function addPhone(){
	divPhone.children().each(function (index, value) {
		if ($(value).prop("id") == "numero")
			$(value).val("");
	});
	$("#telefonesTable").append($(divPhone).clone());
	applyMask();
}

function removePhone(valor){
	var size = $('#telefonesTable').children().length;
	if(size > 2)
		$(valor).parent().remove();
}
