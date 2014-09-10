module.exports = ->

  @loadNpmTasks 'grunt-jsonlint'

  @config 'jsonlint',
    config:
      src: [
        'bower.json'
        'coffeelint.json'
        'composer.json'
        'package.json'
      ]

    app:
      src: [
        'assets/json/**/*.json'
      ]

