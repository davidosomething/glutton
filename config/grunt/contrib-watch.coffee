module.exports = ->

  @loadNpmTasks 'grunt-contrib-watch'

  ############################################################################

  @config 'watch',
    options:
      interrupt: true

    app:
      files: [
        'app/**/*.coffee'
      ]
      tasks: [
        'browserify:watch'
        'karma:watch:run'
      ]

    sass:
      files: [
        'assets/sass/**/*.scss'
      ]
      tasks: [
        'css'
      ]

