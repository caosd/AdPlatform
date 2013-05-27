define(function(require) {
  var datewidget = require('./datetime')
    , EE = require('../utils/eventemitter')

  function RangePicker(start_el, end_el, apply_el, pivot) {
    this.start_el = $(start_el)
    this.end_el = $(end_el)
    this.apply_el = $(apply_el)

    this.pivot = pivot || new Date

    this.range = [null, null]

    EE.call(this)
  } 

  var cons = RangePicker
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.datewidget = cons.datewidget = datewidget

  proto.init = function() {
    this.start_date = new this.datewidget(this.start_el, this.pivot)
    this.end_date = new this.datewidget(this.end_el, this.pivot)

    this.start_date.on('data', this.got_data.bind(this, this.start_date))
    this.end_date.on('data', this.got_data.bind(this, this.end_date))
    this.start_date.on('tabnext', this.show_next.bind(this))

    this.apply_el.click(this.click_apply.bind(this))

    this.start_date.picker && 
      this.start_date.picker.on('data', this.end_date.show.bind(this.end_date))
  }

  proto.set_bounds = function(start, end) {
    this.start_el.val(start)
    this.end_el.val(end)

    // trigger on_input_change on both to update the calendar-based picker.
    this.start_date.on_input_change()
    this.end_date.on_input_change()
    this.emit('data', this.range[0], this.range[1] || this.pivot)
  }

  proto.show_next = function(ev) {
    this.end_date.el.click()
  }

  proto.got_data = function(from_picker, date) {
    this.range[from_picker === this.start_date ? 0 : 1] = date
  }

  proto.click_apply = function(ev) {
    ev && ev.preventDefault()
    this.emit('data', this.range[0], this.range[1] || this.pivot)    
  }

  return cons
})
