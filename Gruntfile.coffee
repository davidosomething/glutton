module.exports = (grunt)->
  grunt.initConfig
    pkg:    grunt.file.readJSON('package.json')

################################################################################

    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %>\n' +
      '<%= pkg.homepage ? " * " + pkg.homepage + "\\n" : "" %>' +
      ' * Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>' +
      ' */\n'

################################################################################
    clean:
      static:
        css:  [ 'static/assets/js/*' ]
        js:   [ 'static/assets/css/*' ]

################################################################################

    coffeelint:
      gruntfile:
        options:
          configFile: 'coffeelint.json'
        files:
          src: 'Gruntfile.coffee'

################################################################################

    sass:
      options:
        debugInfo:  true
        trace:      true
        loadPath:   [ 'assets/json' ]
        precision:  9
        require:    [ 'sass-json-vars' ]
        sourcemap:  true
        style:      'compact'
      all:
        files: [
          expand:   true
          cwd:      'assets/sass/'
          src:      '**/*.scss'
          dest:     'static/assets/css'
          ext:      '.css'
        ]

################################################################################

    scsslint:
      all:
        files: 'assets/sass/**/*.scss'

################################################################################

    watch:
      sass:
        files: '<%= scsslint.all.files %>'
        tasks: [ 'scsslint', 'sass', 'autoprefixer' ]

################################################################################

  require('load-grunt-tasks')(grunt)

################################################################################

  grunt.registerTask 'lint', 'Lint', [
    'coffeelint'
    'scsslint'
  ]

  grunt.registerTask 'css', 'Build CSS', [
    'sass'
    'autoprefixer'
  ]

  grunt.registerTask 'build', 'Build theme for release', [
    'coffee'
    'sass'
  ]

  grunt.registerTask 'default', [
    'build'
    'watch'
  ]

  grunt.registerTask 'release', 'Build and imageoptim', [
    'build'
    'newer:imageoptim'
  ]
