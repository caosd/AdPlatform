define(function(require) {
  var request = require('../modules/request')
    , EE = require('../utils/eventemitter')
    , qs = require('../utils/qs')
  
  var form = $('#appForm')
    , input = $('#pkg')
    , name = $('#name')
    , inputTip = $('#tip_package')
    , submit = $('#btn_sub')
    , verified

  form.on('submit', function() {
    submit.attr("disabled", "disabled");
    if (!input.val() || !name.val() || verified) 
      return true
    
    verified = false;
    inputTip.html('verifying package...').removeClass('error')
    fetch_validate_pkg(input.val(), function(err, data) {
      verified = data;
      if (verified) {
        input.removeClass("error")
        inputTip.html("package can use").removeClass('error')
        form.submit()
      }
      if (err || !verified){
        input.addClass("error")
        inputTip.html("package has been used").addClass('error')
        submit.removeAttr("disabled")
      }
    })
    return false
  })

  function fetch_validate_pkg(pkg, ready) {
    request.get('/apps/validation?'+qs({
      pkg: pkg
    }), ready)
  }

})
