define(function(require) {
  var EE = require('../utils/eventemitter')
    , template = require('../utils/simple_template')

  /*
    Usage:

    var dd = new Dropdown([
      ['event_name', 'Human Text']
    , ['event_name_2', 'Human Text'] 
    ])

    dd.init($('#container'))

    dd.on('event_name', function(text) {
      // doooo something.
    })

    // where container ===
    <div>
      <div rel="label>Current Selected</div>
      <ul></ul>
    </div>
  */

  function Dropdown(items) {
    EE.call(this)
    this.items = items
    this.list = null
    this.title = null
    this.default_item = null
  }

  var cons = Dropdown
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.init = function(container) {
    var current = container.find('[rel="label"]')
      , list = container.find('ul')
      , self = this

    self.title = current
    self.list = list
    self.list.hide()

    self.title.parent().click(self.show.bind(self))
    self.items.forEach(create_list_element)
    $(document).click(self.on_click_document.bind(self, container))

    if(self.default_item) {
      setTimeout(self.set_active.bind(self, self.default_item), 0) 
    }

    function create_list_element(item_tuple) {
      var el = $(self.item_template({name:item_tuple[2]}))
      el.find('a').click(self.on_click_item.bind(self, item_tuple))
      list.append(el)
    }
  }

  proto.on_click_item = function(item_tuple, ev) {
    this.set_active(item_tuple)
    ev.preventDefault()
  }

  proto.on_click_document = function(root, ev) {
    var src = ev.srcElement || ev.target
      , needle = root.get()[0]

    while(src) {
      src = src.parentNode
      if(src === needle)
        break
    }

    if(!src)
      this.hide()
  }

  proto.set_active = function(tuple) {
    this.emit(tuple[0], tuple[1])
    this.title.text(tuple[2])
    this.hide()
  }

  proto.set_default = function(tuple) {
    this.default_item = tuple 
  }

  proto.hide = function() {
    if(this.list.is(':visible')) {
      this.list.fadeOut('fast')
    }
  }

  proto.show = function() {
    if(this.list.is(':hidden')) {
      this.list.fadeIn('fast')
    }
  }

  proto.item_template = template('<li><a href="#">{{ name }}</a></li>')

  return cons
})
