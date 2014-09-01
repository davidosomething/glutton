module.exports = ->

  @loadNpmTasks 'grunt-contrib-clean'

  @config 'clean',
    static: [ 'static/' ]
