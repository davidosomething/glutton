module.exports = ->

  @loadNpmTasks 'grunt-shell'

  ############################################################################

  @config 'shell',
    prebuild:
      command: [
        'npm prune'
      ].join('&&')

