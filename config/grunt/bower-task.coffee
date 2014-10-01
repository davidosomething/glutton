module.exports = ->

  @config 'bower',
    install:
      options:
        cleanTargetDir: true
        targetDir:      './assets/bower'
        layout:         'byComponent'
