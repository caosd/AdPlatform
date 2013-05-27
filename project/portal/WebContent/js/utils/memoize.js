define(function(require) {
  // docs: ./docs/js/utils/memoize.md

  var EE = require('./eventemitter')

  function memoize(fn) {
    var memo = {} // {num_args:[{args:[arg1, arg2], result:result}]}

    ret.original = fn

    return ret

    function ret () {
      var args = [].slice.call(arguments)
        , search = memo[args.length] || []
        , result

      for(var i = 0, len = search.length; i < len; ++i)
        if(search[i].args.every(function(el, idx) { return el === args[idx] }))
          return search[i].result

      result = fn.apply(this, args)

      search.push({args:args, result:result})
      memo[args.length] = search

      return result
    }
  }

  memoize.async = function (fn) {
    var memo = {}

    ret.original = fn

    return ret

    function ret () {
      var args = [].slice.call(arguments)
        , search = memo[args.length-1] || []
        , result
        , cb = args.slice(-1)[0]
        , ee = new EE

      args = args.slice(0, -1)

      for(var i = 0, len = search.length; i < len; ++i)
        if(search[i].args.every(function(el, idx) { return el === args[idx] })) {
          if(!search[i].result) {
            return search[i].ee.on('end', function() { cb.apply(null, search[i].result) })
          } else {
            return setTimeout(function() { cb.apply(null, search[i].result) }, 0)
          }
        }

      result = {args:args, ee:ee}
      search.push(result)
      memo[args.length] = search

      return fn.apply(this, args.concat([function() {
        result.result = [].slice.call(arguments)

        result.ee.emit('end')

        delete result.ee
        cb.apply(null, result.result) 
      }]))
    }
  }

  return memoize
})
