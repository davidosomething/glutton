$ = require('jquery')(window)
_ = require('underscore')
Backbone = require('backbone')

module.exports = class DefaultRouter extends Backbone.Router

  routes: {
    '': 'index'
    'jsonplaceholder/:resource': 'jsonplaceholder'
  }

  index: ->
    return

  jsonplaceholder: (resource)->
    console.log(resource)
    return
