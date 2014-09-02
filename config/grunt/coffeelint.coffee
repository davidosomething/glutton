module.exports = ->

  @loadNpmTasks 'grunt-coffeelint'

  ############################################################################

  @config 'coffeelint',
    options:
      configFile: 'coffeelint.json'
    tools:  ['Gruntfile.coffee', 'karma.conf.coffee']
    app:    ['app/**/*.coffee']
    tests:  ['test/**/*.coffee']

