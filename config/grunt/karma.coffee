module.exports = ->

  @loadNpmTasks 'grunt-karma'

  ############################################################################

  @config 'karma',
    options:
      configFile: 'karma.conf.coffee'
      logLevel: 'ERROR'
      coverageReporter:
        type: 'text-summary'

    all: # for CI
      autoWatch: false
      singleRun: true

    ci: # for CI
      autoWatch: false
      coverageReporter:
        dir:    'reports/coverage/'
        reporters: [
          { type: 'lcovonly' }
          { type: 'text-summary' }
        ]
      singleRun: true

    quick: # for CLI
      autoWatch: false
      browsers: ['PhantomJS']
      singleRun: true

    watch: # for dev
      autoWatch: true
      background: true
      browsers: ['PhantomJS']
      singleRun: false

