module.exports = (grunt)->
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
# Copy bower components to paths
# @TODO want to eliminate this step and move to broccoli
    copy:
      dist:
        files:
          'assets/sass/vendor/_normalize.scss': 'bower_components/normalize.css/normalize.css'

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

    browserify:
      options:
        browserifyOptions:
          debug: true
          extensions: [ '.coffee' ]

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
    'browserify:dist'
  ]

  grunt.registerTask 'test', 'Run test suites', [
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
