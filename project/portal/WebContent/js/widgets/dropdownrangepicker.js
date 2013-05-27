define(function(require) {
  var RangePicker = require('./rangepicker')
    , Dropdown = require('./dropdown')
    , EE = require('../utils/eventemitter')
    , i18n = require('../utils/i18n')

  function DropdownRangePicker(items) {
    this.items = items
    this.range_widget = null
    this.dropdown = null
    EE.call(this)
  }

  var cons = DropdownRangePicker
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.init = function(dropdown_container, range_container) {
    this.dropdown = this.init_dropdown(dropdown_container, range_container)
    this.range_widget = this.init_range_widget(range_container)
    this.range_widget.on('data', this.emit.bind(this, 'data'))
  }

  proto.default_items = function() {
    return [
      ['Last 7 Days', i18n.last7days]
    , ['Last 2 Weeks', i18n.last2weeks]
    , ['Last 30 Days', i18n.last30days]
    , ['Last Month', i18n.lastmonth]
    , ['Last 3 Months', i18n.last3months]
    , ['Last 12 Months', i18n.last12months]
    , ['Today', i18n.today]
    , ['Yesterday', i18n.yesterday]
    ]
  }

  proto.end_dates = {
    'Yesterday': 'Today'
  , 'Today': 'Tomorrow'
  }

  proto.init_dropdown = function(dropdown_container, range_container) {
    var args = (this.items || this.default_items()).slice()
      , dropdown

    args = args.map(function(item) {
      return ['data'].concat(item);
    })
    args.push(['custom', 'Custom Range', i18n.customrange])

    dropdown = new Dropdown(args)

    dropdown.on('data', this.on_dropdown_data.bind(this))
    dropdown.on('custom', this.on_dropdown_custom.bind(this, range_container))

    dropdown.init(dropdown_container)

    return dropdown
  }

  proto.init_range_widget = function(range_container) {
    var start = range_container.find('[name=start]')
      , end = range_container.find('[name=end]')
      , apply = range_container.find('button')
      , widget

    if(!end.val()) {
      end.val('now')
    }

    widget = new RangePicker(start, end, apply)
    widget.init()

    this.widget_container = start.parents('div').eq(0)
    this.widget_container.addClass('ready')

    return widget
  }

  proto.on_dropdown_data = function(human_date_string) {
    var hide = this.widget_container.hide.bind(this.widget_container)
    this.range_widget.set_bounds(human_date_string, this.end_dates[human_date_string] || 'Now')

    // FIXME: this should be in CSS, *not* in JS.
    this.widget_container
      .css({zIndex:0})
      .animate({right:0, opacity:0}, 'fast', hide)
  } 

  proto.on_dropdown_custom = function(range_container) {
    var css = this.widget_container.css.bind(this.widget_container, {zIndex:1000})

    this.widget_container
        .show()
        .animate({right:'290px', opacity:1}, 'fast', css)
  }

  return cons
})
