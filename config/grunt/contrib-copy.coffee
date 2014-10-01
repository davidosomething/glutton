_    = require 'lodash'
path = require 'path'

module.exports = ->

  bowerJson = @file.readJSON "bower.json"

  # getBowerCssOverrides
  #
  # Get a files array
  #
  # @return {array<object>}
  getBowerCssOverrides = ->
    sassVendorPath = 'assets/sass/vendor/'
    bowerPath = 'assets/bower/'

    # @return {object}
    # @example cssFiles { { "normalize.css": { "css": "normalize.css" } } }
    cssFiles = _.pick bowerJson.exportsOverride, (override)->
      return _.has override, 'css'

    # @return {array<object>}
    # @example [ { 'assets/sass/vendor/_normalize.scss': 'assets/bower/normalize.css/css/normalize.css' } ]
    cssFilesMap = _.map cssFiles, (contents, dir)->
      result = {}
      sassFilename = '_' + path.basename(dir, '.css') + '.scss'
      key          = sassVendorPath + sassFilename
      value        = bowerPath + dir + '/css/' + contents.css
      result[key]  = value
      return result

    return cssFilesMap

  ############################################################################
  # Copy bower components to paths
  # @TODO want to eliminate this step and move to broccoli

  @config 'copy',
    dist:
      files: getBowerCssOverrides()

