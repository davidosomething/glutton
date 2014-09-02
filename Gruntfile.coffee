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
    'lint'
    'clean'
    'build'
  ]

  @registerTask 'test', 'Run test suites', [
    # phpunit
    'karma'

    # @TODO dalek needs to run against local port, switch to dynamic
    # Dalekfile.js
    # @TODO dynamic browser selection based on ENV
    'dalek:default'
  ]

  @registerTask 'report', 'Run reporters against a successful build', [
    'stylestats'
    #'pagespeed' not configured
    #'yslow' not configured
    #'wpt' not configured
  ]

  @registerTask 'document', 'Run documentation generators', [
    'codo'
  ]

  @registerTask 'default', [
    'build'
    'browserify:watch'
  ]
