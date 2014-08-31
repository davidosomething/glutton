module.exports = ->

  @loadNpmTasks 'grunt-codo'

  ############################################################################

  @config 'codo',
    app:
      options:
        name: 'Glutton'
      src: [
        'app'
      ]
      dest: 'docs/app'

