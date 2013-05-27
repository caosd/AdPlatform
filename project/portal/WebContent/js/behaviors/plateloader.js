define(function(require) {
  plate.Template.Meta.registerPlugin(
      'loader'
    , function(template_name, ready) {
        require('plugins/plate!'+template_name, function(tpl) {
          ready(null, tpl)
        })
      }
  )

  var Stream = require('../utils/stream')

  plate.Template.prototype.stream = function() {
    var names = [].slice.call(arguments)
      , stream = new Stream(Stream.READABLE | Stream.WRITABLE)
      , tpl = this

    stream.end = function() {
      stream.emit('end')
    }

    stream.write = function() {
      var args = arguments
        , ctxt = names
            .map(function(n, x) { return [n, args[x]] })
            .reduce(function(l, r) {
              l[r[0]] = r[1]
              return l
            }, {})

      tpl.render(ctxt, function(err, data) {
        if(err) return stream.emit('error', err)

        stream.emit('data', data)
      })
    }

    return stream
  }

  plate.stream = function(str) {
    var names = [].slice.call(arguments, 1)
      , tpl = new plate.Template(str)

    return tpl.stream.apply(tpl, names)
  }

})
