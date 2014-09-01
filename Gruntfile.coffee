module.exports = ->

  require('time-grunt')(this)

  @loadTasks 'config/grunt'

  @registerTask 'lint', 'Lint', [
    'coffeelint'
    'jsonlint'
    'scsslint:all'
  ]

  @registerTask 'css', 'Build css', [
    'copy:dist'
    'compass'
    'autoprefixer'
    'csswring'
  ]

  @registerTask 'js', 'Build theme', [
    'browserify:lib'
    'browserify:app'
  ]

  @registerTask 'build', 'Build theme', [
    'shell:prebuild'
    'css'
    'js'
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
    'clean'
    'build'
    'test'
    'document'
  ]

  @registerTask 'default', [
    'build'
    'browserify:watch'
  ]
