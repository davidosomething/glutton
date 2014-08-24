module.exports = (grunt)->
  grunt.initConfig
    pkg:    grunt.file.readJSON('package.json')

################################################################################

    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %>\n' +
      '<%= pkg.homepage ? " * " + pkg.homepage + "\\n" : "" %>' +
      ' * Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>' +
      ' */\n'

################################################################################

    broccoli:
      dev:
        config: 'Brocfile.js'
        dest: 'static'

################################################################################

    coffeelint:
      gruntfile:
        options:
          configFile: 'coffeelint.json'
        files:
          src: 'Gruntfile.coffee'

################################################################################

    scsslint:
      all:
        files: 'assets/sass/**/*.scss'

################################################################################

  require('load-grunt-tasks')(grunt)

################################################################################

  grunt.registerTask 'lint', 'Lint', [
    'coffeelint'
    'scsslint'
  ]

  grunt.registerTask 'build', 'Build theme for release', [
    'broccoli:dev:build'
  ]

  grunt.registerTask 'default', [
    'build'
    'broccoli:dev:watch'
  ]
