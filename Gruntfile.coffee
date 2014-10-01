module.exports = (grunt)->

  require('time-grunt')(this)
  require('load-grunt-config')(this, {
    jitGrunt:
      scsslint:       'grunt-scss-lint'
      mocha_casperjs: 'grunt-mocha-casperjs'
  })

  @initConfig
    pkg: grunt.file.readJSON('package.json')

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
    'version'
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
    'csscss'
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

  @registerTask 'version', 'Save the version.json file', ->
    done = @async()
    grunt.util.spawn {
      cmd: 'git'
      args: [ 'describe', '--always' ]
    }, (err, result)->
      grunt.file.write 'version.json', JSON.stringify({
        version:  grunt.config('pkg.version')
        revision: String(result)
        date:     grunt.template.today()
      })
      done(result)
    return @

  @registerTask 'w', 'The real watch task', [
    'karma:watch:start'
    'watch'
  ]

  @registerTask 'default', [
    'build'
    'w'
  ]

