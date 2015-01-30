_         = require 'lodash'
minifyify = require 'minifyify'

module.exports = ->

  ############################################################################

  #
  # Browserify shimming
  #

  pkg = @file.readJSON 'package.json'

  getBrowserifyAlias = (name)->
    return pkg.browser[name] + ':' + name

  getBrowserifyAliases = ->
    aliases = _.reduce(pkg.browser, (aliasesArray, path, name)->
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
    lib:
      options:
        # use this since we use bower instead of NPM for components
        # alphabetically
        alias: getBrowserifyAliases()
        browserifyOptions:
          bundleExternal: false
          debug: false
          extensions: [ '.js', '.json' ]
          noparse: [ 'jquery' ]
        external: null
        plugin: [
          (b)->
            b.plugin minifyify, { map: false }
        ]
      files:
        'static/app/lib.js': [ '.' ]
    app:
      options:
        browserifyOptions:
          debug: true
          extensions: [ '.coffee', '.js', '.json' ]
        # use things in lib
        external: _.keys(pkg.browser)
        plugin: [
          (b)->
            mapPath = 'static/app/'
            mapFile = 'app.js.map'
            b.plugin minifyify, {
              map:    mapFile #pkg.siteroot + mapFile
              output: mapPath + mapFile
            }
        ]
        transform: [ 'coffeeify' ]
      files:
        'static/app/app.js': [ 'app/**/*.coffee' ]
    watch:
      options:
        browserifyOptions: '<%= browserify.app.options.browserifyOptions %>'
        external: _.keys(pkg.browser)
        watch: true
      files: '<%= browserify.app.files %>'

