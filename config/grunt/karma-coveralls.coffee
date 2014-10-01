module.exports = ->

  ############################################################################

  @config 'coveralls',
    options:
      coverage_dir: 'reports/coverage/'
      force: true
      recursive: true

