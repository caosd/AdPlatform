define(function(require) {

  var template_source = $('#template_share_user').html()

  if(!template_source) {
    return
  }

  plate.Template.Meta.registerFilter('user_display', function(ready, input) {
    return ready(null, input.username || '')
  })

  var FormValidator = require('../widgets/formvalidator')

  var meta_container = $('#role_meta')
    , open_link = $('#share_link')
    , modal = $('#share_modal')
    , share_form = $('#share_form')
    , email_input = share_form.find('[name=email]')
    , role_input = share_form.find('[name=role]')
    , note_input = share_form.find('[name=note]')
    , cancel_input = share_form.find('[name=cancel]')
    , app_key = share_form.find('[name=app_key]').val()
    , user_template = new plate.Template(template_source)
    , roles = JSON.parse(meta_container.find('input[name=available_roles]').val())
    , reverse = get_url.bind(null, meta_container)
    , lightbox_config = {
          onLoad:once(on_load_lightbox)
        , overlayCSS: { background: '#3b454d', opacity:0.5 }
        , modalCSS: { top:'70px' }
        , appearEffect: 'slideDown'
      }
    , fv = new FormValidator(share_form, reverse('role_base'))
    , open_lightbox = modal.lightbox_me.bind(modal, lightbox_config)
    , users

  fv.init()

  fv.on('data', add_user)

  open_link.click(open_lightbox)
  email_input.focus(on_focus_email_input)
  cancel_input.click(close_share_form)

  var csrf = (document.cookie || '').split(';').map(function(kv) {
    kv = kv.split('=')
    return [decodeURIComponent(kv[0]).replace(/(^\s+|\s+$)/g, ''), decodeURIComponent(kv.slice(1).join('=').replace(/(^\s+|\s+$)/g, ''))]
  }).reduce(function(lhs, rhs) {
    lhs[rhs[0]] = rhs[1]
    return lhs
  }, {}).csrftoken

  return

  function once(fn) {
    var cnt = 0
    return function() {
      ++cnt === 1 && fn.apply(this, [].slice.call(arguments))
    }
  }

  function get_url(container, name) {
    return container.find('input[name='+name+']').val()
  }

  function close_share_form(ev) {
    ev && ev.preventDefault()

    share_form.addClass('collapsed')
  }

  function on_focus_email_input() {
    share_form.removeClass('collapsed')
  }

  function on_load_lightbox() {
    fetch_users(reverse('role_base'), function(err, response) {
      var users = response.data
        , meta = response.meta
        , target = modal.find('.data tbody')

      users.map(function(user) {
        user.username = user.username || ''
        user.full_name = user.full_name || ''
        user.role = user.role || ''
        user.pending = user.pending || false

        user_template.render({user:user, roles:roles}, on_load_user.bind(null, user, target))
      })
    })
  }

  function fetch_users(url, ready) {
    $.getJSON(url, function(data) {
      ready(null, data)
    }).error(function(err) { ready(err) })
  }

  function on_load_user(user, target, err, html) {
    html = $(html)
    target.append(html)

    html.find('form').submit(on_user_modify.bind(null, user, html))

    setTimeout(html.removeClass.bind(html, 'new'))
  }

  function on_user_modify(user, html, ev) {
    ev && ev.preventDefault()

    var value = html.find('form select').val()

    value === 'DELETE' ?
      delete_user(user, html) :
      modify_user(user, html, value)
  }

  function add_user(posted, data) {
    var target = modal.find('.data tbody')
    data.username = data.username || ''
    data.full_name = data.full_name || ''
    data.role = data.role || ''
    note_input.val('')

    user_template.render({user:data, roles:roles, is_new:true}, on_load_user.bind(null, data, target))

    email_input.val('')
    share_form.addClass('collapsed')
  }

  function delete_user(user, html) {
    var xhr = new XMLHttpRequest
    html.fadeOut('fast')

    xhr.open('DELETE', user.modify)

    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest')
    xhr.setRequestHeader('X-CSRFToken', csrf)

    xhr.onreadystatechange = statechange
    return xhr.send('app_key='+encodeURIComponent(app_key))

    function statechange() {
      if(xhr.readyState == 4) {
        ready(xhr.status > 299 && new Error('bad'), xhr.responseText)
      }
    }

    function ready(err, data) {
      if(err) {
        html.fadeIn('fast')
      } else {
        html.remove()
      }
    }
  }

  function modify_user(user, html, value) {
    user.role = value
    user.app_key = app_key

    $.post(user.modify, user, ready)

    function ready() {
      html.find('.role').text(value)
      html.find('.hidden').removeClass('hidden')
      html.find('form').addClass('hidden')
    }
  }

})
