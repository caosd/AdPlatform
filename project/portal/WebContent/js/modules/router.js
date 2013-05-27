define(function(require) {
  var EE = require('../utils/eventemitter')

  function Router(routes) {
    this.routes = routes
    EE.call(this)
  }

  var cons = Router
    , proto = cons.prototype = new EE

  proto.constructor = cons

  cons.to_regex = function(string) {
    string = string.replace(/\//g, '\\/')
                   .replace(/:([^\/]+)/g, '([^\\/]+)')

    return new RegExp(string)
  }

  proto.reverse = function(ev) {
    var args = [].slice.call(arguments, 1)
      , potential = this.routes.filter(function(route) { return route[1] === ev })
      , match = null


    if(!potential.length)
      return null

    potential.some(function(route) {
      var source = (''+route[0]).slice(1, -1)
        , attempt = args.slice()
        , okay = true

      attempt = source.replace(/(\(\[\^\\\/\]\+\))/g, function(all, m) {
        okay = attempt.length

        return attempt.shift()
      })

      match = attempt.replace(/\\\//g, '/') 
      return okay
    })

    return match
  }

  proto.listen = function(to_object) {
    if(to_object === window) {
      var ee = new EE
      window.onhashchange = function() {
        ee.emit('data', window.location.hash)
      }
      to_object = ee
    }
    to_object.on('data', this.on_change.bind(this))
  }

  proto.on_change = function(path) {
    var self = this
      , match

    self.routes.some(function(route) {
      match = route[0].exec(path)
      if(match)
        self.emit.apply(self, [route[1]].concat(match.slice(1)))
      return match
    })
  }

  proto.match = proto.on_change

  function router() {
    var routes = [].slice.call(arguments)
    routes.map(function(route) {
      if(typeof route[0] === 'string') {
        route[0] = cons.to_regex(route[0])
      }
      return route
    })

    return new Router(routes) 
  }

  router.Router = Router
  return router
})
