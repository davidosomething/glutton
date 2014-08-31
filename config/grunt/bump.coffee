module.exports = ->

  @loadNpmTasks 'grunt-bump'

  ############################################################################

  @config 'bump',
    options:
      files: [
        'bower.json'
        'composer.json'
        'package.json'
        'style.css'
      ]
      updateConfigs: []
      commit:        false
      createTag:     false
      push:          false

