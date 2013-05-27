define(function(require) {
  var Autocomplete = require('../widgets/autocomplete')
  
  var search_el = $('#appselect_search')
    , url_template = '/apps/app_search/?appselect_search={{ encodeURIComponent(q) }}'
    , target = $('#id_menu_app_list')
    , result_template = require('plugins/plate!templates/includes/app_search_results.html') 
    , autocomplete

  function mutate_data(apps, headers) {
    return [apps.apps, headers]
  }

  autocomplete = new Autocomplete(
      search_el
    , url_template
    , target
    , result_template
  )

  autocomplete.mutate_data = mutate_data
  autocomplete.on('open', function() { $(window).scroll() })

  autocomplete.init()
  
  $('.appselect_button').on('click', function() { $(window).scroll() })

  // prepopulate data from django.
  autocomplete.data = target.find('li [data-key]').map(function(x, el) {
    return {key: $(el).attr('data-key')}
  }).get()

  autocomplete.on('data', function(app) {
    if(!app) {
      return
    }

    window.location = '/apps/'+app.key+'/'
  })

  $('body').on('keyup', function(ev) {
    var target = $(ev.target)

    if(target.is(':input') || target.parents(':input').length) {
      return
    }

    if('A' !== String.fromCharCode(ev.keyCode)) {
      return
    }

    $('.appselect_button').click()
    search_el.focus() 
  })
})
