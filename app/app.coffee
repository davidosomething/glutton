# Glutton App
# main app entry point

Backbone = require('backbone')
$ = require('jquery')
Backbone.$ = $

DefaultRouter = require('./r/default')

app = window.app ||= {}
app.OK = true
app.root = '/'

app.router = new DefaultRouter()
Backbone.history.start({
  pushState: true
  root: app.root
})

# @TODO
# Bugsnag.releaseStage = 'development'
