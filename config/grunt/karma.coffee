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
      singleRun: true

    ci: # for CI
      coverageReporter:
        dir:    'reports/coverage/'
        reporters: [
          { type: 'lcovonly' }
          { type: 'text-summary' }
        ]
      singleRun: true

    quick: # for CLI
      browsers: ['PhantomJS']
      singleRun: true

    watch: # for dev
      background: true
      browsers: ['PhantomJS']
      reporters: 'dots'
      singleRun: false

