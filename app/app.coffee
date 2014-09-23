# Glutton App
# main app entry point

# Lib
$        = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $

# Loggers
require './p/rollbar'
require './p/bugsnag'

# App
DefaultRouter = require './r/default'

# App init
app = window.app ||= {}
app.OK = true
app.root = '/'

# Router init
app.router = new DefaultRouter()
Backbone.history.start({
  pushState: true
  root: app.root
})

# @TODO
# Bugsnag.releaseStage = 'development'
