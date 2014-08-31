module.exports = ->

  @loadNpmTasks 'grunt-scsslint'

  ############################################################################

  @config 'scsslint',
    all:
      files: 'assets/sass/**/*.scss'

