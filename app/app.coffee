# Glutton App
# main app entry point

Backbone = require('backbone')
$ = require('jquery')
Backbone.$ = $

app = window.app ||= {}
app.OK = true

console.log('app loaded')

# @TODO
# Bugsnag.releaseStage = 'development'
