define(function(require) {
  var cookie = require('./cookie')
  	, cookie_name = 'org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE'
  
  switch (cookie(cookie_name).toLowerCase()) {
    case 'zh_cn':
      return require('../i18n/zh_cn')
    default:
      return require('../i18n/en_us')
  }
  
})