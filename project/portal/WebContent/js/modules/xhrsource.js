define(function(require) {
  var memoize = require('../utils/memoize')
    , qs = require('../utils/qs')
    , EE = require('../utils/eventemitter')
    , make_xhr

  make_xhr = function() { return new XMLHttpRequest() }

  // and for browsers that happen to not garbage-collect XHRs...
  if(window.ActiveXObject) {
    make_xhr = function() { return new ActiveXObject('Microsoft.XMLHTTP') }
  }


  function XHRSource(endpoint, memoized) {
    this.endpoint = endpoint
    this.memoized = memoized === undefined ? true : memoized

    EE.call(this)
  }

  var cons = XHRSource
    , proto = cons.prototype = new EE

  proto.constructor = cons

  proto.fetch = function(get_params, ready) {
    var self = this
      , query = qs(get_params)
      , fn = self.memoized ? self.internal_fetch : self.internal_fetch.original 

    return fn.call(self, query, receive_xhr_result)

    function receive_xhr_result(err, data) {
      err ?
        self.emit('error', err) :
        self.emit('data', data)

      if(ready) {
        ready(err, data)
      } 

    }
  }

  proto.internal_fetch = memoize.async(function(querystring, ready) {
    var xhr = make_xhr()
    xhr.open('GET', this.endpoint + '?' + querystring)
    xhr.onreadystatechange = readystate
    return xhr.send(null)

    function readystate() {
      if(xhr.readyState == 4) try {
        if(xhr.status < 300 && xhr.status > 199) {
          ready(null, JSON.parse(xhr.responseText))
        } else {
          ready(new Error('xhr.status is '+xhr.status))
        }
      } catch(err) {
        ready(err)
      }
    }
  })

  return cons
})
