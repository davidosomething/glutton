module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

################################################################################
# SASS through broccoli
# Note this task cleans the dest dir before run

    broccoli:
      dist:
        config: 'Brocfile.js'
        dest: 'static/assets'

################################################################################
# CoffeeScript through browserify

    browserify:
      options:
        browserifyOptions:
          extensions: [ '.coffee' ]
        bundleOptions:
          debug: true

        # use this since we use bower instead of NPM for components
        # alphabetically
        alias: [
          './bower_components/backbone/backbone.js:backbone'
          './bower_components/jquery/dist/jquery.js:jquery'
          './bower_components/lodash/dist/lodash.underscore.js:underscore'
        ]

        transform: [
          'coffeeify'
          # 'browserify-shim'
          #'uglifyify'
        ]
      dist:
        files:
          'static/app/app.js': [ 'app/app.coffee' ]
      watch:
        options:
          watch: true
        files: '<%= browserify.dist.files %>'

################################################################################

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      app:
        files:
          src: 'app/**/*.coffee'
      gruntfile:
        files:
          src: 'Gruntfile.coffee'

################################################################################

    scsslint:
      all:
        files: 'assets/sass/**/*.scss'

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
    'broccoli:dist:build'
    'browserify:dist'
  ]

  grunt.registerTask 'default', [
    'build'
    'broccoli:dist:watch'
    'browserify:watch'
  ]
