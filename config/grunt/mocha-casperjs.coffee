module.exports = ->

  @loadNpmTasks 'grunt-mocha-casperjs'

  @config 'mocha_casperjs',
    all:
      options:
        'mocha-path':       'node_modules/mocha'
        'chai-path':        'node_modules/chai'
        'casper-chai-path': 'node_modules/casper-chai'
        width:    1024
        height:   768
      files:
        src: [ 'test/e2e/**/*' ]
