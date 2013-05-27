define(function(require) {
  var EE = require('../utils/eventemitter')
    , simple_template = require('../utils/simple_template')

  function PillButton(options, exclusive) {
    this.exclusive = exclusive
    this.selected = [] 
    this.options = options
    this.el = null

    EE.call(this)
  }

  var cons = PillButton
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.init = function() {
    var self = this
      , html = $('<div></div>')

    Object.keys(this.options)
          .map(create_button)
          .reduce(append_button, html)

    return self.el = html

    function create_button(key, idx, all) {
      var button = $(self.button_template({
          is_first:idx === 0
        , is_last:idx === all.length-1
        , event_name:key
        , name:self.options[key]
      }))
      
      button.click(self.on_click.bind(self, button, key))
      return button
    }

    function append_button(lhs, rhs) {
      lhs.append(rhs)
      return lhs
    }
  }

  proto.on_click = function(html, key, ev) {
    ev.preventDefault()

    if(html.is('.'+this.active_class) && !this.exclusive) {
      html.removeClass(this.active_class)
      this.selected.splice(this.selected.indexOf(key), 1)
    } else if(this.exclusive) {
      this.el.find('.'+this.active_class).removeClass(this.active_class) 
      html.addClass(this.active_class)
      this.selected = [key]
    } else {
      html.addClass(this.active_class)
      this.selected.push(key)
    }

    this.emit('data', this.selected)
  }

  proto.button_template = simple_template([''
  , '<a href="#" class="{{ is_first ? "first" : is_last ? "last" : "" }}" rel="{{ event_name }}">{{ name }}</a>'
  ].join(''))

  proto.active_class = 'active'

  function pillbutton(options, exclusive) {
    var pb = new PillButton(options, exclusive)
    pb.init()
    return pb
  }

  pillbutton.PillButton = cons

  return pillbutton
})
