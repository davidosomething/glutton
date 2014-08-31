module.exports = ->

  @loadNpmTasks 'grunt-coveralls'

  ############################################################################

  @config 'coveralls',
    karma:
      options:
        force: true
      src: 'reports/coverage/PhantomJS 1.9.7 (Linux)/lcov.info',

