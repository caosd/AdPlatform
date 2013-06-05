define(function(require) {
  var allowPush = $(".allow-push a:not(.active)")
    , allowTrustee = $(".allow-trustee a:not(.active)")
    , form = $(".blueform")
    , delayPushInterval = $("#delay_push_interval")
    , delayPushIntervalMsg = $("#delay_push_interval_error");

  allowPush.click(submit_form.bind(allowPush, "allow-push"));
  allowTrustee.click(submit_form.bind(allowTrustee, "allow-trustee"));
  
  form.submit(function() {
    if (delayPushInterval.length == 0) {
      return true;
    }
    if (/^\d+$/.test(delayPushInterval.val())) {
      delayPushIntervalMsg.html("");
      return true;
    } else {
      delayPushIntervalMsg.html("请输入合法的正整数。");
      return false;
    }
  });
  
  function submit_form(name) {
    var b = $(this).attr("data-mode");
    if (b === undefined) {
      return;
    }
    $("input[name="+name+"]").val(b);
    form.submit();
  }
});