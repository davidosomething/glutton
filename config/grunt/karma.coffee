module.exports = ->

  @loadNpmTasks 'grunt-karma'

  ############################################################################

  @config 'karma',
    test:
      configFile: 'karma.conf.coffee'

