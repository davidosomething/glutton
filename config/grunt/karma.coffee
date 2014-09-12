module.exports = ->

  @loadNpmTasks 'grunt-karma'

  ############################################################################

  @config 'karma',
    options:
      configFile: 'karma.conf.coffee'
      logLevel: 'ERROR'

    all: # for CI
      autoWatch: false
      singleRun: true
      coverageReporter:
        type: 'text-summary'

    ci: # for CI
      autoWatch: false
      singleRun: true
      coverageReporter:
        dir:    'reports/coverage/'
        reporters: [
          { type: 'lcovonly' }
          { type: 'text-summary' }
        ]

    quick: # for CLI
      autoWatch: false
      singleRun: true
      browsers: ['PhantomJS']
      coverageReporter:
        type: 'text-summary'

    watch: # for dev
      singleRun: false
      autoWatch: true
      browsers: ['PhantomJS']
      coverageReporter:
        type: 'text-summary'

