define(function(require) {
	new DatePicker({ bindTo: $("#startDatestr") });
	new DatePicker({ bindTo: $("#endDatestr") });
	
	$("a[name=confirmRemittance_btn]").click(function() {
		if(confirm("请确认已经成功汇款?")){
			var cur_page = 1;
			var $FORM = $("form:first");
			var action = "/admin/financial/remittance_complete?id="+$(this).attr("id")+"&p=" + cur_page;
			$FORM.attr("action", action).submit();
			return false;
		}
	});
});
