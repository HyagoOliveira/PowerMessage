jQuery(function(){
	addPhone();
	applyMask();
});

function applyMask() {
	$('.ddd').mask('99');
	$('.phone').mask('99999-9999');	
}

function addPhone(){
	var row;
	row = "<div id='phone' class='fieldcontain'>";
	row += "<label for='telefone'>Telefone</label>";
	row += "<input class='ddd' name='ddd' id='ddd' size='2'/>";
	row += "<input class='phone' name='numero'/>";
	row += "<input type='button' class='button' value=' - ' onclick='removePhone(this)'/>";
	row += "</div>";
	$("#telefonesTable").append(row);
	applyMask();
}

function removePhone(valor){
	$(valor).parent().remove();
}
