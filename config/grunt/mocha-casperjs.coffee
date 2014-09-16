module.exports = ->

  @loadNpmTasks 'grunt-mocha-casperjs'

  @config 'mocha_casperjs',
    all:
      options:
        width:    1024
        height:   768
      files:
        src: [ 'test/e2e/**/*' ]
