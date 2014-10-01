module.exports = ->

  ############################################################################

  @config 'shell',
    prebuild:
      command: [
        'npm prune'
      ].join('&&')

