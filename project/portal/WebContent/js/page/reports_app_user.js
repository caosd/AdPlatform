define(function(require) {

  var Report = require('../modules/report')
    , ReportView = require('../modules/reportview')
    , Counters = require('../modules/counters')
    , DropdownRangePicker = require('../widgets/dropdownrangepicker')
    , XHRSource = require('../modules/xhrsource')
    , add_commas = require('../utils/addcommas')
    , i18n = require('../utils/i18n')

  var AppAdds
    , AppOnlines
    , report
    , counters
    , resource = new XHRSource('reports/data/')

  AppAdds = new ReportView('/apps/new/', {
      tooltip:  function(chart) { return add_commas(chart.y) + i18n['report.new_user_axis']}
    , y_axis:   function(chart) { return add_commas(chart.value) }
  }, 'sm_user_new')

  AppOnlines = new ReportView('/apps/online/', {
      tooltip:  function(chart) { return add_commas(chart.y) +i18n['report.online_user_axis'] }
    , y_axis:   function(chart) { return add_commas(chart.value) }
  }, 'sm_user_online')

  report = new Report({
      'report.new_user':     AppAdds('#2D6C8B')
    , 'report.online_user':  AppOnlines('#99261C')
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

  counters.listen(AppAdds)
          .listen(AppOnlines)

  // initialize the report
  report.init(
      resource
    , 'chart'
    , $('#links')
    , $('#search-container')
  )

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

  $('#export-chart').click(function(ev) {
    ev.preventDefault()
    if(report.chart) {
      report.chart.exportChart()
    }
  })
})
