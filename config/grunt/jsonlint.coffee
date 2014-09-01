module.exports = ->

  @loadNpmTasks 'grunt-jsonlint'

  @config 'jsonlint',
    config:
      src: [
        'bower.json'
        'coffeelint.json'
        'package.json'
      ]

    app:
      src: [
        'assets/json/**/*.json'
      ]

