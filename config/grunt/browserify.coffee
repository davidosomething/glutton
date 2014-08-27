module.exports = ->

  @loadNpmTasks 'grunt-browserify'

  #
  # Browserify shimming
  #
  _ = require('lodash')
  libs = require('../browserify-shim.coffee')

  getBrowserifyAlias = (name)->
    return libs[name].path + ':' + name

  getBrowserifyLibs = (libs)->
    return _.keys(libs)

  getBrowserifyAliases = (libs)->
    aliases = _.reduce(libs, (aliasesArray, path, name)->
      aliasesArray.push getBrowserifyAlias(name)
      return aliasesArray
    , [])

  #
  # Config
  #
  # @TODO want to eliminate this step and move to broccoli-browserify
  # alternatively run browserify itself through grunt-shell
  #
  # The "extensions" browserifyOption has to exist for each task
  # doesn't inherit from parent options
  @config 'browserify',
    options:
      transform: [ 'coffeeify' ]
    lib:
      options:
        # use this since we use bower instead of NPM for components
        # alphabetically
        alias: getBrowserifyAliases(libs)
        browserifyOptions:
          debug: false
          extensions: [ '.coffee', '.js', '.json' ]
          noparse: [ 'jquery' ]
        external: null
      files:
        'static/app/lib.js': [ '.' ]
    app:
      options:
        browserifyOptions:
          debug: true
          extensions: [ '.coffee', '.js', '.json' ]
        # use things in lib
        external: getBrowserifyLibs(libs)
      files:
        'static/app/app.js': [ 'app/**/*.coffee' ]
    watch:
      options:
        watch: true
      files: '<%= browserify.app.files %>'

