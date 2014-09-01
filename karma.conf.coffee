module.exports = (config)->
  browsers = [ 'Firefox', 'PhantomJS' ]
  if not process.env.TRAVIS
    browsers.push 'Chrome'

  config.set
    basePath: ''
    browsers: browsers
    frameworks: ['mocha', 'chai-sinon']

    files: [
      #
      # bootstrap
      #
      # this is to support commonJs by defining require()
      'bower_components/commonjs-require-definition/require.js'

      # shimmed
      # add to test/shim.coffee
      'bower_components/lodash/dist/lodash.underscore.js'
      'bower_components/backbone/backbone.js'
      'bower_components/jquery/dist/jquery.js'
      'config/browserify-shim.coffee'
      'config/karma-shim.coffee'

      #
      # things to test
      #
      'app/**/*.coffee'

      #
      # specs to test against
      #
      'spec/**/*.coffee'
    ]

    preprocessors:
      # don't touch -- these load the lib shims
      'config/browserify-shim.coffee': ['commonjs', 'coffee']
      'config/karma-shim.coffee': ['coffee']

      # the coverage preprocessor runs Ibrik to compile coffee
      'app/**/*.coffee': ['commonjs', 'coverage']
      'spec/**/*.coffee': ['coffee']

    commonjsPreprocessor:
      options:
        isCoffeeScript: true

    reporters: ['spec', 'coverage']

    coverageReporter:
      dir:    'reports/coverage/'
      #subdir doesn't work
      reporters: [
        { type: 'lcov' }
        { type: 'text-summary' }
      ]

    colors: true
    logLevel: config.LOG_INFO
    autoWatch: true
    singleRun: true
