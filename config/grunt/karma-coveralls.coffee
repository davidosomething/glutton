module.exports = ->

  @loadNpmTasks 'grunt-karma-coveralls'

  ############################################################################

  @config 'coveralls',
    options:
      coverage_dir: 'reports/coverage/'
      force: true
      recursive: true

