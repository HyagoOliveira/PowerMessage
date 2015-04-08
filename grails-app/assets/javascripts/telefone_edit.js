jQuery(function(){	
	applyMask();
});

function applyMask() {
	$('.ddd').mask('99');
	$('.phone').mask('99999-9999');	
}

function addPhone(){
	var row;
	row = "<div id='phone' class='fieldcontain'>";
	row += "<label for='telefone'>Telefone </label>";
	row += "<div class='ui input'>";
	row += "<input class='ddd' name='ddd' size='2' required=''/>";
	row += "</div>";
	row += "<div class='ui input'>";
	row += "<input class='phone' name='numero' required=''/>";
	row += "</div>";
	row += "<div style='margin-left:5px;' class='tiny red labeled ui button' onclick='removePhone(this)'>";
	row += "<i class='icon minus'></i>";
	row += "</div>";
	row += "</div>";
	$("#telefonesTable").append(row);
	applyMask();
}

function removePhone(valor){
	var size = $('#telefonesTable').children().length;
	if(size > 1)
		$(valor).parent().remove();
}
