define(function(require) {
  $('#fileCtrl').change(function() {
    var filePath = $(this).val()
    var tipCtrl = $('#fileCtrlVal')
    if (filePath.lastIndexOf(".apk") != filePath.length-4) {
      tipCtrl.html('<span style="color:red">' + $('#fileCtrl').attr('title') + '</span>')
      $(this).val('')
    } else {
      tipCtrl.html(filePath)
    }
  })

})
