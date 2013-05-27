define(function(require) {
  // also, make the constructor properly inherit from
  // EventEmitter instead of reimplementing it.

  Function.prototype.bind = function(){}.bind || function(to) {
    var self = this
      , args = [].slice.call(arguments, 1)

    return function() {
      return self.apply(to, args.concat([].slice.call(arguments)))
    }
  } 

  var has = Function().call.bind({}.hasOwnProperty)

  function ValidForm(target, endpoint) {
    this.form = target && $(target)
    this.endpoint = endpoint

    this._listeners = {}
  }
  
  var cons = ValidForm
    , proto = cons.prototype

  proto.error_classes = [
      '.errorlist'
  ]

  proto.errored_input_class = 'error'

  proto.error_message = 'There was a problem contacting the server.'

  proto.errorlist_template = function() {
    return $('<ul class="'+this.error_classes[0].slice(1)+'"></ul>')
  }

  proto.error_template = function(message) {
    return $('<li>'+message+'</li>')
  }

  proto.errorlist_placement = function(input, errorlist) {
    return input.parent().append(errorlist)
  }

  proto.find_form_error = function() {
    return this.form.find('ul >'+this.error_classes.join('> ul'))
  }

  proto.init = function() {
    this.form.submit(this.on_submit.bind(this))
  }

  proto.on_submit = function(ev) {
    ev && ev.preventDefault()

    var serialized = this.form.serialize()
      
    this.form.find(this.error_classes.join(', '))
        .hide()

    this.form.find('.'+this.errored_input_class)
        .removeClass(this.errored_input_class)

    this.find_form_error().hide()

    $.post(this.endpoint, serialized)
      .done(this.on_recv_data.bind(this, serialized))
      .fail(this.on_recv_fail.bind(this, serialized))
  }

  proto.on_recv_data = function(posted, received) {
    if(!received.errors) {
      return this.emit('data', posted, received)
    }
    this.emit('error', posted, received.errors)
    return this.apply_errors(received.errors)
  }

  proto.on_recv_fail = function(posted, err) {
    if(err.status < 500 && err.status > 399) {
      return this.on_recv_data(posted, JSON.parse(err.responseText))
    }
    this.emit('error', posted, err)

    var form_wide_error = this.find_form_error()
   
    !form_wide_error.length &&
      (form_wide_error = this.errorlist_template().appendTo(this.form))

    form_wide_error.hide()

    form_wide_error.html(
      this.error_template(this.error_message)
    )

    form_wide_error.show()

  }

  proto.apply_errors = function(error_hash) {
    var target
      , errorlist

    for(var key in error_hash) if(has(error_hash, key)) {
      target = $('#id_'+key)
      errorlist = target.parent().find('ul'+this.error_classes.join(', ul'))

      if(!errorlist.length) {
        errorlist = this.errorlist_template()
        this.errorlist_placement(target, errorlist)
      }

      target.addClass(this.errored_input_class)

      errorlist.html('').hide()

      for(var i = 0, len = error_hash[key].length; i < len; ++i) {
        errorlist.append(
          this.error_template(error_hash[key][i])
        )
      }

      errorlist.show()
    }
  }

  proto.on = function(ev, fn) {
    ;(this._listeners[ev] = this._listeners[ev] || []).push(fn)
    return this
  }

  proto.emit = function(ev) {
    var args = [].slice.call(arguments, 1)
      , list = this._listeners[ev] || []

    for(var i = 0, len = list.length; i < len; ++i)
      list[i].apply(null, args)

    return this
  }

  return cons
})
