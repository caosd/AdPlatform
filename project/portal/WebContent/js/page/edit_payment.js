define(function(require) {
	$("#paypalRdo").click(function() {
		$(".blueform input").not("[type=radio]").parent().hide()
		$("#paypalLoginGroup").show()
	})
	
	$("#wireRdo").click(function() {
		$(".blueform input").not("[type=radio]").parent().show()
		$("#paypalLoginGroup").hide()
	})
})
