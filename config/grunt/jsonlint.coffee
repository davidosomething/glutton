module.exports = ->

  @loadNpmTasks 'grunt-jsonlint'

  @config 'jsonlint',
    config:
      src: [
        'bower.json'
        'coffeelint.json'
        'composer.json'
        'Dalekfile.json'
        'package.json'
      ]

    app:
      src: [
        'assets/json/**/*.json'
      ]

