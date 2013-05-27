define(function(require) {
  var request = require('../modules/request')
    , EE = require('../utils/eventemitter')
    , debounce = require('../utils/debounce')
    , i18n = require('../utils/i18n')
  
  var wrap = $('#user-imei-list')
  var init = debounce(init_view)
    , templates = {}
    , ee = new EE
    , app_key = wrap.attr('data-key')
    , cache_data = {}

  init()

  templates.addview = new plate.Template(
    '<form class="blueform">'+
    '<ul><li><label>{{label_imei}}:</label><input type="text" name="imei" /></li><li><label>{{label_description}}:</label><input type="text" name="description"/></li></ul>'+
    '<ul><li><button type="button" class="add">{{btn_add_imei}}</button>  &nbsp;&nbsp;  <a href="javascript:void(0)" class="cancel">{{btn_cancel}}</a></li><li><span class="error"></span></li></ul>'+
    '</form>'
  )

  templates.imeiview = new plate.Template(
    '<div class="bluebox" data-id="{{id}}" data-value="{{imei}}:false">'+
    '<dl><dt>{{description}}:</dt>'+
    '<dd><span class="code imei">IMEI:{{imei}}</span><a class="button-link switch start">{{btn_start}}</a><a class="button-link fantacy hide delete">{{btn_delete}}</a></dd></dl>'+
    '</div>'
  )

  templates.errview = new plate.Template(
    '<span class="code red error">{{errmsg}}</span>'
  )
  
  function init_view() {
    if (wrap.find('.bluebox').length == 0) {
      render_add_view()
    }
    ee.on('assign_decorations', assign_decorations)
    assign_decorations()

    ee.on('render_error', function(err) {if (err) {wrap.html('page render error')}})
  }

  function assign_decorations() {
    var list = wrap.find('.bluebox:not(.assigned)')
    list.each(function(i, el) {
        el = $(el)
        var view_id = el.attr('data-id')
        el.hover(
            function() {$(this).find('.button-link.fantacy').show()}, 
            function() {$(this).find('.button-link.fantacy').hide()})
        el.find('.button-link.switch').bind('click', on_switch.bind(this, view_id))
        el.find('.button-link.delete').bind('click', on_delete.bind(this, view_id))
        el.addClass('assigned')

        if (i == list.length-1) {
          function assign_add_btn(el) {
            var add_link = $('<span class="code corner">'+i18n['label.add_imei']+'</span>').bind('click', render_add_view)
            el.append(add_link)
          }
          assign_add_btn(el)
          ee.on('assign_add_btn', assign_add_btn)
        }
        
        var values = el.attr('data-value').split(':')
        cache_data[view_id] = [values[0], values[1] == 'true']
    })
  }
  
  function render_add_view() {
    if (wrap.find('.bluebox:not(.assigned)').length >= 1) {
      return
    }
    var data = {
        label_imei: i18n['label.imei']
      , label_description: i18n['label.description']
      , btn_add_imei: i18n['btn.add_imei']
      , btn_cancel: i18n['btn.cancel']
    }
    templates['addview'].render(data, function(err, htmltext) {
      ee.emit('render_error', err)

      var addview = $(htmltext)
      addview.find('button.add').bind('click', function() {
        var imei = wrap.find('input[name=imei]').val()
          , description = wrap.find('input[name=description]').val()
          , self = $(this)

        if (/^[0-9a-zA-Z_-]{10,24}$/.test(imei) == false) {
          return wrap.find('.error').text(i18n['error.imei'])
        } else {
          wrap.find('.error').text('')
        }
        
        for (var k in cache_data) {
          if (cache_data[k][0] == imei) {
            return alert(i18n['imei_is_existed'])
          }
        }
        
        self.attr('disabled', 'disabled').text(i18n['sending'])

        post_data('/ajax_add_user_imei'
          , {imei: imei, description: description}
          , function(err, data) {
              if (err) self.removeAttr('disabled').text(i18n['btn.add_imei'])
              apply_imei_view.call(this, err, data, imei, description)
            })
      })
      addview.find('a.cancel').bind('click', function() {
        var emptyObj = true
        for (var k in cache_data) {
          emptyObj = false
          break
        }
        if (!emptyObj) {
          ee.emit('remove_add_view')
          ee.emit('assign_add_btn', wrap.find('.bluebox:last-child'))
        }
      })

      ee.once('remove_add_view', function() {
        addview.remove()
      })

      wrap.append(addview)
    })
    
    if (this !== window)  $(this).remove()
  }

  function on_switch(viewId) {
    var el = $(this)
      , button = $(this).find('.button-link.switch')

    var run_start = button.is('.start')
      , urls = {'true': '/ajax_start_user_imei', 'false': '/ajax_stop_user_imei'}
      , btns = {'true': 'btn.start_push', 'false': 'btn.stop_push'}
      , klas = {'true': 'start', 'false': 'stop'}

    button.unbind('click').text(i18n['sending'])
    post_data(urls[run_start]
      , {id: viewId}
      , function(err, errcode) {
        if (errcode != undefined) {
          var errmsg = i18n['push.'+errcode]
          el.find('span.error').remove()
          templates['errview'].render({errmsg: errmsg}
            , function(err, htmltext) {
              var errview = $(htmltext).css({position: 'absolute', bottom: '-12px', left: '0px'})
              el.append(errview)
              if (errcode == 0 || errcode == 1) {
                run_start = !run_start
                cache_data[viewId][1] = (errcode == 0)
                errview.removeClass('red')
                button.text(i18n[btns[run_start]]).removeClass(klas[!run_start]).addClass(klas[run_start])
              }

              debounce(function() {errview.remove()}, 6000)()
            })
        }
        button.bind('click', on_switch.bind(el, viewId)).text(i18n[btns[run_start]])
      })
  }

  function on_delete(viewId) {
    var el = $(this)
      , button = $(this).find('.button-link.delete')
    
    if (cache_data[viewId][1]) {
      return alert(i18n['stop_should_be_first'])
    }
    
    if (!confirm(i18n['sure_to_delete_imei'])) {
      return
    }
    
    button.unbind('click').text(i18n['sending'])
    post_data('/ajax_delete_user_imei'
      , {id: viewId}
      , function(err, data) {
        if (err) {
          button.bind('click', on_delete.bind(el, viewId)).text(i18n['btn_delete'])
        } else {
          data && el.remove()
          delete cache_data[viewId]
          
          var emptyObj = true
          for (var k in cache_data) {
            emptyObj = false
            break
          }
          emptyObj && render_add_view()
          ee.emit('assign_add_btn', wrap.find('.bluebox:last-child'))
        }
      })
  }

  function apply_imei_view(err, viewId, imei, description) {
    if (viewId != false && viewId >= 0) {
      var data = {
          id: viewId
        , imei: imei
        , description: description
        , btn_start: i18n['btn.start_push']
        , btn_update: i18n['btn.update']
        , btn_delete: i18n['btn.delete']
      }
      templates['imeiview'].render(data, function(err, htmltext) {
        ee.emit('render_error', err)
        ee.emit('remove_add_view')

        wrap.append(htmltext)
        ee.emit('assign_decorations')
        
        cache_data[viewId] = [imei, false]
      })
    }
  }

  function post_data(url, data, ready) {
    request.post('/apps/'+app_key+url, null, data, ready)
  }
  
})
