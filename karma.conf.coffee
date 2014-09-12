module.exports = (config)->

  browsers = [ 'PhantomJS' ]

  if process.env.CI
    if not process.env.DRONE
      browsers.push 'Firefox'
    if not process.env.TRAVIS and not process.env.DRONE
      browsers.push 'Chrome'

  config.set
    basePath: ''
    browsers: browsers
    frameworks: ['browserify', 'mocha', 'chai-sinon']

    files: [
      'test/app/**/*.coffee'
    ]

    preprocessors:
      # the coverage preprocessor runs Ibrik to compile coffee
      'test/**/*.coffee': ['browserify']

    browserify:
      extensions: [ '.coffee', '.js', '.json' ]
      debug: true
      transform: [ 'browserify-shim', 'coffeeify', 'istanbulify' ]#'browserify-istanbul' ]

    reporters: ['spec', 'coverage']

    coverageReporter:
      dir:    'reports/coverage/'
      reporters: [
        { type: 'lcovonly' }
        { type: 'text-summary' }
      ]

    colors: true
    logLevel: config.DEBUG
    singleRun: true
