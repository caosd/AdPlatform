define(function(require) {
  var easing = require('./easing')
    , template = require('../utils/simple_template')

  function Counters(actions, output_to, clean_data) {
    this.actions = actions

    Object.keys(this.actions).forEach(function(name) {
      actions[name] = typeof actions[name] === 'function' ? actions[name] : this[actions[name]].bind(this)
    }, this)

    this.clean_data = clean_data || Function('x', 'return x')
    this.output_to = template(output_to)
  }

  var cons = Counters
    , proto = cons.prototype

  proto.ROLL_DURATION = 1000

  proto.listen = function(report_view, divide_by) {
    var span = $(this.view_action_template({view:report_view})).hide()

    Object.keys(this.actions)
          .forEach(this.apply_listener.bind(this, span, report_view, divide_by))

    return this
  }

  proto.apply_listener = function(span, report_view, divide_by, action_name) {
    var this_span = span.clone()
    this_span.appendTo($(this.output_to({name:action_name})))

    report_view.on('data',  this.apply_action.bind(this, report_view, action_name, this_span, divide_by))
    report_view.on('drain', this.hide_action.bind(this, report_view, action_name, this_span))
  }

  proto.apply_action = function(report_view, action_name, span, divide_by, incoming_data) {
    var data = incoming_data.map(this.clean_data)
      , result = this.actions[action_name](data)
      , current = parseFloat(span.text())
      , coerce = divide_by ? 
          function(x) { return (x/divide_by).toFixed(2) } :
          function(x) { return ~~x }

    isNaN(current) && (current = 0)

    span.show()

    if(coerce(result) === coerce(current)) 
      return span.text(coerce(result))

    if(current == coerce(result))
      return

    easing(current, result, this.ROLL_DURATION)
      .on('data', on_data)
      .on('end', on_data)
      
    function on_data(val){
      span.text(coerce(val)).addcommas()
    }
  }


  proto.hide_action = function(report_view, action_name, span) {
    span.hide()
        .text('')
  }

  proto.view_action_template = template('<span class="amount" style="color:{{ view.color }}"></span>')

  proto.aggr_sum = function(data) {
    return data.reduce(function(lhs, rhs) { return lhs + rhs }, 0)
  }

  proto.aggr_avg = function(data) {
    return this.aggr_sum(data) / data.length
  }

  proto.aggr_max = function(data) {
    return Math.max.apply(null, data)
  }

  proto.aggr_min = function(data) {
    return Math.min.apply(null, data)
  }

  return cons
})
