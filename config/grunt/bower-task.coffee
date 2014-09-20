module.exports = ->

  @loadNpmTasks 'grunt-bower-task'

  @config 'bower',
    install:
      options:
        cleanTargetDir: true
        targetDir:      './assets/bower'
        layout:         'byComponent'
