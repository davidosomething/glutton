module.exports = ->

  @loadNpmTasks 'grunt-dalek'

  ############################################################################
  # End-to-end testing with Dalek and webdriver
  @config 'dalek',
    options:
      dalekfile: true

    default:
      src: [ 'test/e2e/index.coffee' ]

    chrome:
      options:
        browser: [ 'chrome' ]
      src: '<%= dalek.default.src %>'

    # known socket hangup error
    # https://github.com/dalekjs/dalek-browser-firefox/issues
    # firefox:
    #   options:
    #     browser: [ 'firefox' ]
    #   src: '<%= dalek.default.src %>'

    ie:
      options:
        browser: [ 'IE' ]
      src: '<%= dalek.default.src %>'

    ios:
      options:
        browser: [ 'ios' ]
      src: '<%= dalek.default.src %>'
