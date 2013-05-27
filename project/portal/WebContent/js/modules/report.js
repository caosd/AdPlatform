define(function(require) {
  var EE = require('../utils/eventemitter')
    , DateParser = require('../modules/dateparser')
    , RangeWidget = require('../widgets/rangepicker')
    , pillbutton = require('../widgets/pillbutton')
    , ObjectState = require('./objectstate')
    , easing = require('./easing')
    , DataRepr = require('./datarepr')
    , EE = require('../utils/eventemitter')
    , qs = require('../utils/qs')
    , TimeDelta = require('../utils/timedelta')
    , routes = require('./router')

  function pad(num) {
    num = ''+num
    return num.length < 2 ? '0'+num : num
  }

  function format(date) {
    return [date.getFullYear(), pad(date.getMonth()+1), pad(date.getDate())].join('-')
  }

  function slugify(name) {
    return name;//.toLowerCase().replace(/[^\s\w\d\-]/g, '').replace(/\s+/g, '-').replace(/[\-]+/g, '-')
  }

  function Report(views) {
    var self = this
   
    self.views = {}
    self.object_state = new ObjectState

    Object.keys(views).forEach(function(view_name) {
      views[view_name](self, view_name)  
    })

    EE.call(self)
  }

  var cons = Report
    , proto = cons.prototype = new EE

  proto.constructor = cons

  cons.MONTH = 4
  cons.WEEK = 3
  cons.DAY = 2 
  cons.HOUR = 1 

  cons.Default = {}

  proto.register = function(name, instance) {
    var slug = slugify(name)

    this.views[slug] = instance

    instance.slug = slug
    instance.name = name

    instance.emit('init', instance)
    instance.on('activate',   this.activate_instance.bind(this, slug))
    instance.on('deactivate', this.deactivate_instance.bind(this, slug))
  }

  proto.format_date = format

  proto.get_view = function(view_cons) {
    return this.views[view_cons.instance.slug]
  }

  proto.is_enabled = function(view) {
    return !!~(this.object_state.state.views || []).indexOf(view.slug)
  }

  proto.activate_instance = function(view_slug) {
    var btn = this.pillbutton.el.parent().find('[rel='+view_slug+']')
    if(!btn.is('.active'))
      btn.click()
  }

  proto.deactivate_instance = function(view_slug) {
    var btn = this.pillbutton.el.parent().find('[rel='+view_slug+']')
    if(btn.is('.active'))
      btn.click()
  }

  proto.build_range_widget = function() {
    var lhs = $('<input type="text" />')
      , rhs = $('<input type="text" />')
      , target = $('<div></div>')
      , widget
      , val_lhs = new Date(new Date - new TimeDelta({days:7}))
      , val_rhs = new Date

    target.append(lhs).append(rhs)

    lhs.val(format(val_lhs))
    rhs.val(format(val_rhs))

    widget = new RangeWidget(lhs, rhs)

    widget.el = target

    widget.init()

    return widget
  }

  proto.build_pillbutton = function() {
    // build {slug:Human Name} mapping.
    var pb = new pillbutton(
      Object.keys(this.views).map(function(view_name) {
        return [view_name, this.views[view_name].name]
      }, this)
      .reduce(function(lhs, rhs) {
        lhs[rhs[0]] = rhs[1]
        return lhs
      }, {})
    )
    return pb
  }

  proto.build_repr = function() {
    var repr = new DataRepr(this.get_title(), this.get_graph_library())
      , self = this

    repr.init()
    repr.config.configure('tooltip.formatter', 
        function() { return self.tooltip_formatter(this) })
        
    repr.config.configure('xAxis.labels.style.fontSize', '9px')

    if(self.repr_options) {
      Object.keys(self.repr_options).forEach(function(opt_key) {
        repr.config.configure(opt_key, self.repr_options[opt_key])
      })
    }

    return repr 
  }

  proto.x_axis_formatter = function(chart) {
    var date = new Date(chart.value)
      , precision = this.get_precision()
      , hour = date.getHours()

    return precision === cons.MONTH ? DateParser.MONTHS_ABBR[date.getUTCMonth()] :
           precision === cons.DAY ?   date.getUTCDate() :
           hour > 12 ? hour-12+'pm' :
           hour === 12 ? '12pm' :
           hour === 0 ? '12am' :
           hour+'am'
  }

  proto.tooltip_date_formatter = function(x) {
    var precision = this.get_precision()
      , curdate = new Date(x)
      , hour = curdate.getUTCHours()

    return precision === cons.MONTH ? DateParser.MONTHS[curdate.getUTCMonth()] +' '+curdate.getFullYear() :
           precision === cons.DAY ? DateParser.MONTHS_ABBR[curdate.getUTCMonth()] +' '+ curdate.getUTCDate() :
           hour > 12 ? DateParser.WEEKDAYS_ABBR[curdate.getDay()] + ' ' + (hour-12)+'pm' :
           hour === 12 ? DateParser.WEEKDAYS_ABBR[curdate.getDay()] + ' ' +  '12pm' :
           hour === 0 ? DateParser.WEEKDAYS_ABBR[curdate.getDay()] + ' ' +  '12am' :
           DateParser.WEEKDAYS_ABBR[curdate.getDay()] + ' ' + hour+'am'
  }

  proto.tooltip_formatter = function(chart) {
    var view_name = slugify(chart.series.name)
      , view = this.views[view_name]

    return view ? this.tooltip_date_formatter(chart.x)+': '+view.formatters.tooltip.call(view, chart, this) : chart.y + ' ' + chart.series.name
  }

  proto.get_graph_library = function() {
    var self = this
      , chart

    return {
        init:update
      , update:update
    }

    function update(config, data) {
      if(data) {
        self.chart = chart = self.update_chart(chart, config, data)
      }
    }
  }

  proto.create_chart = function(conf) {
    return new Highcharts.Chart(conf)
  }

  proto.update_chart = function(chart, config, data) {
    var self = this
      , end = +self.get_end_date()
      , start = +self.get_start_date()
      , incoming_data_keys = Object.keys(data)
      , known_view_slugs = Object.keys(self.views)
      , x_axis_categories = []
      , y_axis_items = []
      , chart
      , series

    // all non-participating views should emit 'drain'
    known_view_slugs.forEach(function(view_slug) {
      if(!~incoming_data_keys.indexOf(view_slug))
        self.views[view_slug].emit('drain')
    })

    incoming_data_keys = incoming_data_keys.sort(function(lhs, rhs) {
      lhs = known_view_slugs.indexOf(lhs)
      rhs = known_view_slugs.indexOf(rhs)

      if(lhs < rhs) return -1
      if(lhs > rhs) return 1
      return 0
    })

    series = incoming_data_keys.map(function(view_slug, idx) {
      var view = self.views[view_slug]
        , view_data = data[view_slug].map(function(tuple) { return [tuple[0], Math.max(tuple[1], 0)] })

      // have this view contribute to the y-axis
      contribute_to_y_axis(view, idx)

      view.emit('data', view_data)

      return format_data_for_view(view, view_data, idx)
    })

    config.configure('yAxis', y_axis_items)
    config.configure('xAxis.type', 'datetime')
    config.configure('xAxis.type', 'datetime')
    config.configure('xAxis.labels', {
      'overflow':'justify'
    })
    config.configure('global.useUTC', true)
    config.configure('xAxis.dateTimeLabelFormats', {
      'day': '%b %e'
    , 'week': '%b %e'
    , 'hour': '%l:%M%p'
    })

    var start_date = self.get_start_date()

    config.configure('title.text', self.get_title())
    config.configure('series', series)

    if(chart) chart.destroy()

    return self.create_chart(config.config())

    function is_time_inside_bounds(time) {
      return time[0] <= end && time[0] >= start
    }

    function contribute_to_y_axis(view, idx) {
      y_axis_items.push({
          opposite:idx > 0 && !(idx % 2 || idx % 3)
        , gridLineColor:'#CCCCCC'
        , startOnTick:false
        , title:{text:null}
        , labels: {
            style:      { color: view.color, fontSize:'9px' }
          , formatter:  function() {
              return view.formatters.y_axis.call(view, this)
            }
          }
      })
    }

    function format_data_for_view(view, view_data, idx) {
      var extra = view.chart_conf
        , conf = {
            color:view.color
          , data:view.formatters.map ? view_data.map(view.formatters.map) : view_data
          , type:view.chart_conf.type
          , name:view.name
          , marker: { symbol:'circle', lineColor:view.color }
          , yAxis: view.formatters.use_axis ? view.formatters.use_axis(idx) : idx
          , point: { events: { click: function() { return self.on_click_chart(this) } } }
        } 

      Object.keys(extra).forEach(function(key) {
        conf[key] = extra[key]
      })

      return conf
    }
  }

  proto.on_click_chart = function(chart, ev) {
    var utc = new Date(chart.category)
      , month = utc.getUTCMonth()
      , year = utc.getUTCFullYear()
      , date = utc.getUTCDate()
      , precision = this.get_precision()
      , start = null
      , end = null

    // FIXME: using precisions is somewhat dumb
    if(precision === cons.DAY) {
      start = new Date(year, month, date, 0, 0)
      end = new Date(year, month, date + 1, 0, 0)
    } else if(precision === cons.MONTH) {
      start = new Date(year, month, 1)
      end = new Date(year, month+1, 0)
    }

    if(start && end) {
      this.range_widget.set_bounds(start, end)
    }
  }

  proto.get_precision = function(start, end) {
    end = end || this.get_end_date()
    start = start || this.get_start_date()

    var diff = (+end - +start)
      , precision = diff <  +new TimeDelta({days:3}) ? cons.HOUR :
                    diff >= +new TimeDelta({days:60})? cons.MONTH : cons.DAY 

    return precision
  }

  proto.get_end_date = function() {
    return this.object_state.state.end
  }

  proto.get_start_date = function() {
    return this.object_state.state.start
  }

  proto.get_timezone_offset = function() {
    return new TimeDelta({minutes:-this.get_start_date().getTimezoneOffset()})
  }

  proto.init = function(resource, graph_id, pillbutton_target, rangepicker_target, router) {
    var self = this

    this.resource = resource
    this.range_widget = this.build_range_widget()
    this.pillbutton = this.build_pillbutton()

    this.object_state.listen(this.range_widget, 'data', ['start', 'end'])
    this.object_state.listen(this.pillbutton,   'data', ['views'])

    this.object_state.on('data', this.on_new_state.bind(this))
    this.object_state.on('data', this.update_hash.bind(this))

    this.repr = this.build_repr()
    this.repr.config.configure('chart.renderTo', graph_id)

    this.repr.listen(this)

    pillbutton_target.prepend(this.pillbutton.el)
    this.range_widget.el && rangepicker_target.append(this.range_widget.el)

    this.router = router || this.default_router
    this.collect_initial_data_from_router(this.router)
  }

  proto.default_router = routes(
      ['#report-:slug/from-:start/to-:end', 'report_start_end']
    , ['#report-:slug/from-:start', 'report_start']
    , ['#report-:slug', 'report']
    , [/.*/, 'init']
  )

  proto.update_hash = function(state, target) {
    var start = format(state.start)
      , end = format(state.end)
      , today = format(new Date)
      , seven_days = format(new Date(new Date - new TimeDelta({days:7})))
      , name

    name = end != today ? 'report_start_end' :
           start != seven_days ? 'report_start' :
           'report'

    target = target || window.location

    this.hash_change = true
    target.hash = this.router.reverse(name, (state.views || []).join(','), start, end)
    this.hash_change = false
  }

  proto.set_active_reports = function(slugs) {
    var self = this
    if(slugs instanceof RegExp)
      slugs = Object.keys(self.views).filter(slugs.test.bind(slugs))

    self.object_state.wait(function() {
      Object.keys(self.views).forEach(function(slug) {
        !!~slugs.indexOf(slug) ?
          self.activate_instance(slug) :
          self.deactivate_instance(slug)
      })
    })
  }

  proto.collect_initial_data_from_router = function(router, loc) {
    var self = this

    router.on('report_start_end', on_report_start_end)
    router.on('report_start', on_report_start)
    router.on('report', on_report)
    router.on('init', on_init)
    router.match(loc || window.location.hash)
    router.listen(window)

    function on_report_start_end(slug, start, end) {
      if(self.hash_change) {
        return self.hash_change = false
      }

      self.object_state.wait(function() {
        self.range_widget.set_bounds(start, end)
        self.set_active_reports(slug.split(','))
      })
    }

    function on_report_start(slug, start) {
      return on_report_start_end(slug, start, format(new Date))
    }

    function on_report(slug) {

      return on_report_start(slug, format(new Date(new Date - new TimeDelta({days:7}))))
    }

    function on_init() {
      return on_report(Object.keys(self.views)[0] || '')
    }
  }

  proto.on_new_state = function(state) {
    if(!state.views || !state.start || !state.end)
      return

    state.precision = this.get_precision()

    var self = this
      , ready_count = state.views.length
      , results = {}

    self.emit('state', state)

    state.views.forEach(function(view) {

      self.resource.fetch({
            url: self.views[view].url
          , start: format(state.start)
          , end: format(state.end)
          , precision: state.precision
          }
        , got_resource
      )
      
      function got_resource(err, data) {
        if(err) return

        // unwrap 'dat.
        results[view] = self.views[view].lookup(data)
        !--ready_count && ready()
      } 
    })

    if(!ready_count) ready()

    function ready() {
      self.emit('data', results)
    }
  }

  proto.get_title = function() {
    var lhs = this.object_state.state.start || new Date(new Date - new TimeDelta({days:7}))
      , rhs = this.object_state.state.end || new Date
      , matched_year = lhs.getFullYear() === rhs.getFullYear()
    if (matched_year) {
      return DateParser.MONTHS_ABBR[lhs.getUTCMonth()] + ' ' + lhs.getUTCDate() + 
           ' - ' + DateParser.MONTHS_ABBR[rhs.getUTCMonth()] + ' '  + rhs.getUTCDate()
    } else {
      return DateParser.MONTHS_ABBR[lhs.getUTCMonth()] + ' ' + lhs.getUTCDate() + ', ' + lhs.getFullYear() + 
           ' - ' + DateParser.MONTHS_ABBR[rhs.getUTCMonth()] + ' '  + rhs.getUTCDate() + ', ' + rhs.getFullYear()
    }
  }

  return cons
})
