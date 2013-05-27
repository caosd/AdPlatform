define(function(require) {
  var EE = require('../utils/eventemitter')
    , i18n = require('../utils/i18n')

  function ReportView(url, formatters, lookup) {
    var ee = new EE
      , view = function (color, chart_conf) {
        view.color = color
        view.chart_conf = chart_conf

        return function(report, name) {
          name = i18n[name]
          var instance = new ReportViewInstance(name, color, url, formatters, lookup, chart_conf)
          report.register(name, instance)
          instance.on('data', ee.emit.bind(ee, 'data'))
          instance.on('drain', ee.emit.bind(ee, 'drain'))
          instance.on('init', ee.emit.bind(ee, 'init'))
          ee.on('activate', instance.emit.bind(instance, 'activate'))
          ee.on('deactivate', instance.emit.bind(instance, 'deactivate'))
          ee.on('fetch', instance.emit.bind(instance, 'fetch'))

          view.instance = instance
        }
      }

    view.once = ee.once.bind(ee)
    view.on = ee.on.bind(ee)
    view.emit = ee.emit.bind(ee)
    view.formatters = formatters
    view.lookup = lookup

    return view
  }

  ReportView.Instance = ReportViewInstance

  function ReportViewInstance(name, color, url, formatters, lookup, chart_conf) {
    this.name = name
    this.color = color
    this.url = url
    this.formatters = formatters
    this.chart_conf = chart_conf || {'type':'area'}
    this.lookup = 
                  typeof lookup === 'function' ? lookup :
                  typeof lookup === 'string' ? function(lookup, ctxt) { return ctxt[lookup] }.bind(null, lookup) :
                  function(ctxt) { return ctxt[Object.keys(ctxt)[0]] }
                  
    EE.call(this)
  } 

  var cons = ReportViewInstance
    , proto = ReportViewInstance.prototype = new EE

  proto.constructor = cons

  return ReportView
})
