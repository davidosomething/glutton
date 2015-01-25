module.exports = ->

  ############################################################################

  @config 'bump',
    options:
      files: [
        'bower.json'
        'package.json'
        'style.css'
      ]
      updateConfigs: []
      commit:        false
      createTag:     true
      push:          false

