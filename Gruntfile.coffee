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

  @registerTask 'release', [
    'clean'
    'build'
  ]

  @registerTask 't', 'Run test suites, quick', [
    # phpunit
    'karma:quick'
  ]
  @registerTask 'test', 'Run test suites, all browsers', [
    # phpunit
    'karma:all'
  ]

  @registerTask 'e2e', 'Run end-to-end test suites', [
    'mocha_casperjs'
  ]

  @registerTask 'report', 'Run reporters against a successful build', [
    'stylestats'
    #'pagespeed' not configured
    #'yslow' not configured
    #'wpt' not configured
  ]

  @registerTask 'document', 'Run documentation generators', [
    'codo'
    'sassdoc'
  ]

  @registerTask 'artifacts', 'Generate build artifacts', [
    'document'
    'report'
  ]

  @registerTask 'w', [
    'karma:watch:start'
    'watch'
  ]

  @registerTask 'default', [
    'build'
    'w'
  ]
