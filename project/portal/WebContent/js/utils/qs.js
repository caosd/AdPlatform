define(function(require) {
  // docs: ./docs/js/utils/qs.md

  function qs(obj) {
    return Object.keys(obj)
      .map(function(key) {
        return [encodeURIComponent(key), encodeURIComponent(obj[key])].join('=')
      })
      .join('&')
  }

  return qs
})
