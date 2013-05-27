define(function(require) {
	$("#accountType").change(function() {
		switch($(this).val()) {
		case '1':
			$("#firstNameField").show()
			$("#lastNameField").show()
			$("#companyNameField").hide()
			break;
		case '2':
			$("#firstNameField").hide()
			$("#lastNameField").hide()
			$("#companyNameField").show()
			break
		}
	})
	
	if (Account) $("#country").val(Account.country);

})
