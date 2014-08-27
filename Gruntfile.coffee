module.exports = (grunt)->

  _ = require('lodash')

################################################################################

  libs = require('./config/browserify-shim.coffee')

  getBrowserifyAlias = (name)->
    return libs[name].path + ':' + name

  getBrowserifyLibs = (libs)->
    return _.keys(libs)

  getBrowserifyAliases = (libs)->
    aliases = _.reduce(libs, (aliasesArray, path, name)->
      aliasesArray.push getBrowserifyAlias(name)
      return aliasesArray
    , [])

################################################################################

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

################################################################################

    bump:
      options:
        files: [
          'bower.json'
          'composer.json'
          'package.json'
          'style.css'
        ]
        updateConfigs: []
        commit:        false
        createTag:     false
        push:          false

################################################################################
# SASS through broccoli
# Note this task cleans the dest dir before run

    broccoli:
      dist:
        config: 'Brocfile.js'
        dest: 'static'

################################################################################
# CoffeeScript through browserify
# @TODO want to eliminate this step and move to broccoli-browserify
# alternatively run browserify itself through grunt-shell
#
# The "extensions" browserifyOption has to exist for each task
# doesn't inherit from parent options

    browserify:
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

################################################################################

    codo:
      options:
        name: 'Glutton'
      src: [
        'app'
      ]

################################################################################

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      tools:  ['Gruntfile.coffe', 'karma.conf.coffee']
      app:    ['app/**/*.coffee']
      spec:   ['spec/**/*.coffee']

################################################################################
# Copy bower components to paths
# @TODO want to eliminate this step and move to broccoli

    copy:
      dist:
        files:
          'assets/sass/vendor/_normalize.scss': 'bower_components/normalize.css/normalize.css'

################################################################################

    coveralls:
      karma:
        options:
          force: true
        src: 'reports/coverage/PhantomJS 1.9.7 (Linux)/lcov.info',

################################################################################

    karma:
      test:
        configFile: 'karma.conf.coffee'

################################################################################

    scsslint:
      all:
        files: 'assets/sass/**/*.scss'

################################################################################

    shell:
      prebuild:
        command: [
          'npm prune'
        ].join('&&')

################################################################################
# Module loading

  require('load-grunt-tasks')(grunt)

################################################################################
# Multitask configuration

  grunt.registerTask 'lint', 'Lint', [
    'coffeelint'
    'scsslint'
  ]

  grunt.registerTask 'build', 'Build theme for release', [
    'shell:prebuild'
    'newer:copy:dist'
    'broccoli:dist:build'
    'browserify:lib'
    'browserify:app'
  ]

  grunt.registerTask 'test', 'Run test suites', [
    # phpunit
    'karma'
  ]

  grunt.registerTask 'document', 'Run documentation generators', [
  ]

  grunt.registerTask 'release', [
    'lint'
    'build'
    'test'
    'document'
  ]

  grunt.registerTask 'default', [
    'build'
    'broccoli:dist:watch'
    'browserify:watch'
  ]
