define(function(require) {
  var EE = require('../utils/eventemitter')

  function ObjectState() {
    this.state = {}
    EE.call(this)
  }

  var cons = ObjectState
    , proto = cons.prototype = new EE

  proto.constructor = cons
  
  proto.wait = function(fn) {
    var emit = this.emit
      , should_emit = 0

    // shadow the prototype property
    this.emit = function() { ++should_emit }

    try {
      fn()
    } finally {
      this.emit = emit
      should_emit && this.emit('data', this.state)
    }
  }

  proto.listen = function(ee, name, params) {
    ee.on(name, this.receive_event.bind(this, params))

    return this
  }

  proto.receive_event = function(params) {
    var values = [].slice.call(arguments, 1)
      , context = params.reduce(function(lhs, rhs) {
          var value = values.shift() 
          if(rhs !== null)
            lhs[rhs] = value
          return lhs          
        }, {})

    Object.keys(context).forEach(function(key) {
      if(context[key] === undefined)
        delete this.state[key]
      else
        this.state[key] = context[key]
    }, this)

    this.emit('data', this.state)
  }

  return cons
})
