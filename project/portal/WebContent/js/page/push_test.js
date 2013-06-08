define(function(require) {
  var form = $(".blueform"),
	  testKey = $("#testKey"),
  	  testKeyMsg = $("#testKey_error");
  
  form.submit(function() {
	    if ($.trim(testKey.val()) == "") {
	    	testKeyMsg.html("请输入Test Key.");
	      return false;
	    }
	    return true;
	});
});