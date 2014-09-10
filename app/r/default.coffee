Backbone = require('backbone')
console.log(Backbone)
console.log(jQuery)
console.log(_)

module.exports = class DefaultRouter extends Backbone.Router

  routes: {
    '': 'index'
    'jsonplaceholder/:resource': 'jsonplaceholder'
  }

  index: ->
    console.log('index')
    return

  jsonplaceholder: (resource)->
    console.log(resource)
    return
