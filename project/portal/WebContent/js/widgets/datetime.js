define(function(require) {
  var EE = require('../utils/eventemitter')
    , DatePicker = require('../modules/datepicker')
    , DateParser = require('../modules/dateparser')

  function DateWidget(el, pivot) {
    el && (el.placeholder = 'E.g., 2 days from now')
    this.el = el && $(el)

    if(el && !this.el.is('input')) {
      throw new Error('DateWidget only accepts elements of type `input`')
    }

    this.pivot = pivot || new Date

    this.picker_mutex = false

    EE.call(this)
  }

  var cons = DateWidget
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.calendar_text = ''

  proto.parser_class = cons.parser_class = DateParser
  proto.picker_class = cons.picker_class = DatePicker
  proto.debounce_timeout = 200

  proto.init = function() {
    var starting_value = this.parse_value()
      , picker_el = $('<a href="#" class="cal" tabindex="100000"></a>')

    picker_el.text(this.calendar_text)

    this.el.after(picker_el)
    this.picker_el = picker_el
    this.picker = new this.picker_class(this.picker_el, starting_value)
    this.picker.click_hide_whitelist = this.picker.click_hide_whitelist.concat([this.el.get()[0]])

    this.el.on('mouseup', this.picker.show.bind(this.picker))

    this.picker.on('data', this.on_picker_change.bind(this))
    this.el.on('keyup', this.debounced.bind(this))
    this.el.on('keydown', this.hide_on_tab.bind(this))

    $(document).click(this.picker.click_hide.bind(this.picker))

    this.picker.init() 
  }

  proto.hide_on_tab = function(ev) {
    if(ev.keyCode === 9) {
      this.picker.hide()
      return this.emit('tabnext', ev)
    }
  }
  
  proto.debounced = function(ev) {
    if(ev.keyCode === 13) {
      this.picker.hide()
      return this.emit('tabnext', ev)
    } else {
      this.picker.show()
    }

    if(this.timeout) {
      clearTimeout(this.timeout)
    }
    this.timeout = setTimeout(this.on_input_change.bind(this), this.debounce_timeout)
  }

  proto.parse_value = function(val) {
    val = val || this.el.val()
    return new this.parser_class(val, this.pivot).parse()
  }

  proto.on_input_change = function(ev) {
    var val = this.el.val()
      , date = this.parse_value(val)

    if(date) {
      this.emit('data', date)

      if(!this.picker_mutex) 
        this.picker.set(date)
    }
  }

  proto.on_picker_change = function(data) {
    var val = [data.getFullYear(), pad(data.getMonth()+1), pad(data.getDate())].join('-')

    this.picker_mutex = true
    this.el.val(val)
    this.on_input_change()
    this.picker_mutex = false

    function pad(n) {
      var str = ''+n
      return str.length === 1 ? '0'+str : str
    }
  }

  proto.show = function() {
    this.picker.show()
    this.picker_el.show()
    this.el.show()
  }

  proto.hide = function() {
    this.picker.hide()
    this.picker_el.hide()
    this.el.hide()
  }

  function widget(el, pivot) {
    var w = new DateWidget(el, null, null, pivot)
    w.init()
    return w
  }

  widget.DateWidget = cons

  return widget
})
