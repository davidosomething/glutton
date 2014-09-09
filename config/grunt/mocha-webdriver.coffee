module.exports = ->

  @loadNpmTasks 'grunt-mocha-webdriver'

  ############################################################################

  @config 'mochaWebdriver',
    options:
      usePhantom: true
      usePromises: true
    e2e:
      src: 'test/e2e/index.coffee'
