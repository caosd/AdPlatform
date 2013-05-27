define(function(require) {

  var Report = require('../modules/report')
    , ReportView = require('../modules/reportview')
    , DateParser = require('../modules/dateparser')
    , Counters = require('../modules/counters')
    , DropdownRangePicker = require('../widgets/dropdownrangepicker')
    , XHRSource = require('../modules/xhrsource')
    , add_commas = require('../utils/addcommas')
    , i18n = require('../utils/i18n')

  var Earnings
    , report
    , counters
    , router
    , source
    , resource = new XHRSource('../reports/data/')


  Earnings = new ReportView('/apps/earnings/', {
      tooltip:  function(chart) { return add_commas(chart.y) + i18n['report.earnings_axis'] }
    , y_axis:   function(chart) { return add_commas(chart.value) }
  }, 'sm_earnings', i18n['report.earnings'])

  report = new Report({
      'report.earnings':       Earnings('#178020')
  })

  // override the default datepicker
  report.build_range_widget = function() {
    var dropdown_range_picker = new DropdownRangePicker()

    dropdown_range_picker.init($('#search-container'), $('#date-range'))

    return dropdown_range_picker.range_widget
  }

  // create the report counters
  counters = new Counters({
        'total':    'aggr_sum'
      , 'average':  'aggr_avg'
      , 'high':     'aggr_max'
      , 'low':      'aggr_min'
      }
    , '#{{ name }}-container'
    , Function('x', 'return x[1]')
  )

  counters.listen(Earnings)

  // initialize the report
  report.init(
      resource
    , 'chart'
    , $('#links')
    , $('#search-container')
  )
  
  $("#links a.first").addClass("last");

  var report_overlay = $('.report-overlay')
    , report_type_help = $('#report-type-help')

  $('#help-btn').click(function(ev) {
    ev.preventDefault()
    $(this).toggleClass('open')
    report_overlay.is(':visible') ?
      report_overlay.fadeOut('fast') :
      report_type_help.fadeIn('fast')
  })

  $('#print-chart').click(function(ev) {
    ev.preventDefault()
    window.print()
  })
})
