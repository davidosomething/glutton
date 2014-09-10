module.exports = ->

  @loadNpmTasks 'grunt-karma'

  ############################################################################

  @config 'karma',
    all:
      configFile: 'karma.conf.coffee'
    quick:
      configFile: 'karma.conf.coffee'
      browsers: ['PhantomJS']
