module.exports = ->

  @loadNpmTasks 'grunt-newer'

  @loadTasks 'config/grunt'

  @registerTask 'lint', 'Lint', [
    'coffeelint'
    'scsslint:all'
  ]

  @registerTask 'build', 'Build theme for release', [
    'shell:prebuild'
    'newer:copy:dist'
    'broccoli:dist:build'
    'browserify:lib'
    'browserify:app'
  ]

  @registerTask 'test', 'Run test suites', [
    # phpunit
    'karma'
  ]

  @registerTask 'document', 'Run documentation generators', [
    'codo'
  ]

  @registerTask 'release', [
    'lint'
    'build'
    'test'
    'document'
  ]

  @registerTask 'default', [
    'build'
    'broccoli:dist:watch'
    'browserify:watch'
  ]
