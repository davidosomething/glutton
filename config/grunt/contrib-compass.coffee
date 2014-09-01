module.exports = ->

  @loadNpmTasks 'grunt-contrib-compass'

  ###
  # compass
  ###
  @config 'compass',
    build:
      options:
        bundleExec:     true
        cssPath:        'static/assets/css'
        noLineComments: true
        outputStyle:    'expanded'
        relativeAssets: true
        require:        [ 'sassy-maps', 'sass-json-vars' ]
        sassPath:       'assets/sass'
        sourcemap:      true
