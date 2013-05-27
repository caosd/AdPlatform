define(function(require) {
  var request = require('../modules/request')
    , debounce = require('../utils/debounce')
    , EE = require('../utils/eventemitter')

  var migrate = require('../modules/migrations')

  var fetch_data = debounce(fetch_visible)
    , PREFIX_KEY = migrate('stats', '0.0.1')
    , stats_elements

  fetch_data()

  function fetch_visible() {
    stats_elements = $('.app_summary_ajax:visible:not(.populated)')

    for(var i = 0, len = stats_elements.length; i < len; ++i) {
      fetch(stats_elements.eq(i))
    }
  }

  function fetch(el) {
    var key = el.attr('data-key')
      , type = el.attr('data-type')

    el.addClass('populated')

    load_data([key, type], function(err, data) {
      if(err) {
        return el.find('.app_amounts').text('Data Error')
      }

      var sm;
      for (var i=0, len=data.length; i<len; i++) {
        if (data[i].app_key == key) {
        	sm = data[i];
          break;
        }
      }
      
      if (!sm) return
      
      el.find('.app_amounts').html(sm.amounts)
      el.find('.app_online').html(sm.online_today + ' / ' + sm.online_yesterday)
      el.find('.app_new').html(sm.new_today + ' / ' + sm.new_yesterday)
      el.find('.app_earnings').html(sm.earnings)

    })
  }

  function load_data(key_bits, ready) {
    key_bits.unshift(PREFIX_KEY)

    var key = key_bits.join(':')
      , data = load_data.cache[key]
      , now = Date.now()
      , ee

    if(data && data.once) {
      return data.once('ready', ready)
    }

    if(data) {
      return ready(null, data)
    }

    ee = new EE
    load_data.cache[key] = ee

    request.get('/apps/ajax_summary/', got_data) 

    function got_data(err, data) {
      ee.emit('ready', err, data)
      ready(err, data)
    }
  }

  load_data.cache = {}
})
