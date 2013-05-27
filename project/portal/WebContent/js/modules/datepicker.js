define(function(require) {
  var EE          = require('../utils/eventemitter')
    , template    = require('../utils/simple_template')
    , DateParser  = require('./dateparser')

  function DatePicker(el, value) {
    this.el    = el && $(el)
    this.value = value || new Date
    EE.call(this)
  }

  var cons = DatePicker
    , proto = cons.prototype = new EE

  proto.constructor = cons

  cons.DAY_NAMES = [
      'Su'
    , 'M'
    , 'T'
    , 'W'
    , 'Th'
    , 'F'
    , 'Sa'
  ]

  cons.MONTH_NAMES = DateParser.MONTHS

  proto.template_framing = template([
    '<div class="date-picker" style="z-index:99; position:absolute; display:none;">'
  , '<h3><a href="#" rel="prev" class="pager prev">&laquo;</a>'
  , '<span class="month">{{ picker.constructor.MONTH_NAMES[picker.offset_date.getMonth()] }}</span>'
  , ' '
  , '<span class="year">{{ picker.offset_date.getFullYear() }}</span>'
  , '<a href="#" rel="next" class="pager next">&raquo;</a></h3>'
  , '{{ picker.render_month() }}'
  , '</div>'
  ].join(''))

  proto.template_month = template([
    '<table cellspacing="0">'
  , '  <thead>'
  , '    <tr><th>'
  ,        cons.DAY_NAMES.map(function(name) { return name })
              .join('</th><th>')
  , '    </th></tr>'
  , '  </thead>'
  , '  <tbody>'
  , '     {{ picker.render_month_data() }}'
  , '  </tbody>'
  , '</table>'
  ].join(''))

  proto.template_month_day = template([
    '<td class="{{ picker.is_selected(month_data) ? "selected" : "" }}">'
  , '  {{ month_data }}'
  , '</td>'
  ].join(''))

  proto.init = function() {
    this.offset_date  = this.value || new Date
    this.framing      = $(this.template_framing({picker:this}))
    this.framing.click(this.click_dispatcher.bind(this))
    this.el.after(this.framing)
    this.el.click(this.show.bind(this))
  }

  proto.click_dispatcher = function(ev) {
    var target  = $(ev.srcElement || ev.target)
      , routes  = Object.keys(this.routes)
      , found   = null

    routes.some(function(route) {
      return target.is(route) && (found = route)
    })
   
    if(found && this[this.routes[found]])
      this[this.routes[found]](ev, target)
  }

  proto.routes = {
      'td'      : 'click_day'
    , 'a[rel]'  : 'click_page'
  }

  proto.click_hide = function(ev) {
    var next = $(ev.srcElement || ev.target)
      , needle = this.framing.get()[0]
      , el_needle = this.el.get()[0]
      , whitelist = [needle, el_needle].concat(this.click_hide_whitelist)

    while(next.length > 0 && !~whitelist.indexOf(next.get()[0])) {
      next = next.parent()
    }
    // if we didn't find any element in the target's
    // parents matching our framing, we clicked somewhere
    // outside of the frame and we should hide our framing.

    if(!next.length)
      this.hide()
  }

  proto.click_hide_whitelist = []

  proto.click_day = function(ev, target) {
    ev.preventDefault()
    ev.stopPropagation()

    var val = ~~target.text()

    if(!val)
      return this.emit('error', new Error("user selected -"), target)

    this.framing.find('td').removeClass('selected')
    target.addClass('selected')
    this.hide()

    this.value = this.offset_date
    this.value.setDate(~~val)

    this.emit('data', this.value, target)
  }

  proto.click_page = function(ev, target) {
    ev.preventDefault()

    if(target.is('[rel=next]')) {
      this.offset_date = new Date(this.offset_date)
      this.offset_date.setDate(32) 
    } else if(target.is('[rel=prev]')) {
      this.offset_date = new Date(this.offset_date)
      this.offset_date.setDate(0)
    }

    this.rebuild()
  }

  proto.rebuild = function() {
    var tbl

    this.emit('change_offset', this.offset_date)

    // set the new year and month.
    this.framing.find('.year')
        .text(this.offset_date.getFullYear())

    this.framing.find('.month')
        .text(this.constructor.MONTH_NAMES[this.offset_date.getMonth()])

    // rerender the table.
    tbl = this.framing.find('table')
    tbl.after(this.render_month())
    tbl.remove()
  }

  proto.set = function(date) {
    this.value = date
    this.offset_date = date
    this.rebuild()
  }

  proto.generate_month_data = function(at_date) {
    var current           = at_date || this.offset_date
      , first_of_month    = new Date(current.getFullYear(), current.getMonth(), 1)
      , last_of_month     = new Date(new Date(current.getFullYear(), current.getMonth()+1, 1) - (24*60*60*1000))
      , first_day_of_week = first_of_month.getDay()
      , last_day_of_month = last_of_month.getDay()
      , days      = 1 + last_of_month.getDate() - first_of_month.getDate() 
      , output    = []

    // add dashes until we get to the first day of the week of the month
    for(var i = 0; i < first_day_of_week; ++i)
      output.push('-')

    // then add numbers for all the days
    for(var i = 0; i < days; ++i)
      output.push(i+1)

    // and add dashes until the end of the last week of the month
    for(var i = 0; i < 6 - last_day_of_month; ++i)
      output.push('-') 

    return output
  }

  proto.render_month = function() {
    return this.template_month({picker:this})
  }

  proto.render_month_data = function(data) {
    data = data || this.generate_month_data()

    var self = this
      , ctxt = {picker:self}

    return '<tr>'+data.map(render_datum).join('')+'</tr>'

    function render_datum(datum, idx) {
      ctxt.month_data = datum
      return self.template_month_day(ctxt) + (idx && (idx+1) % 7 === 0 ? '</tr><tr>' : '')
    }
  }

  proto.is_selected = function(datum) {
    return !isNaN(datum) && 
      [this.offset_date.getFullYear(), this.offset_date.getMonth(), datum].join('-') ===
      [this.value.getFullYear(), this.value.getMonth(), this.value.getDate()].join('-')
  }

  proto.show = function(ev) {
    ev && ev.preventDefault && ev.preventDefault()
    this.framing.show()
  }

  proto.hide = function() {
    this.framing.hide()
  }

  return cons
})
