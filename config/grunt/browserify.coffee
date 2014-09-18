module.exports = ->

  @loadNpmTasks 'grunt-browserify'

  ############################################################################

  #
  # Browserify shimming
  #
  _ = require('lodash')

  pkg = @file.readJSON "package.json"

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
    options:
      transform: [ 'coffeeify' ]
    lib:
      options:
        # use this since we use bower instead of NPM for components
        # alphabetically
        alias: getBrowserifyAliases()
        browserifyOptions:
          bundleExternal: false
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
        external: _.keys(pkg.browser)
      files:
        'static/app/app.js': [ 'app/**/*.coffee' ]
    watch:
      options:
        browserifyOptions: '<%= browserify.app.options.browserifyOptions %>'
        external: _.keys(pkg.browser)
        watch: true
      files: '<%= browserify.app.files %>'

