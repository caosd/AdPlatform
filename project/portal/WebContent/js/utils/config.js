define(function(require) {

  function Config(base) {
    this.configuration = {}

    base = base || {}
    for(var key in base) {
      this.configure(key, base[key])
    }
  }

  var cons = Config
    , proto = cons.prototype

  proto.configure = function(path, value) {
    var parts = path.split('.')
      , current = this.configuration
      , last
      , part

    while(parts.length) {
      part = parts.shift()
      current[part] = current[part] || {}
      last = current
      current = current[part]
    }

    last[part] = value
    return this
  } 

  proto.config = function() {
    return this.configuration
  }

  return cons
})
