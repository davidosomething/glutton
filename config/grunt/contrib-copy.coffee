module.exports = ->

  @loadNpmTasks 'grunt-contrib-copy'

  ############################################################################
  # Copy bower components to paths
  # @TODO want to eliminate this step and move to broccoli

  @config 'copy',
    dist:
      files:
        'assets/sass/vendor/_normalize.scss': 'assets/bower/normalize.css/css/normalize.css'
        'assets/sass/vendor/_normalize-opentype.scss': 'assets/bower/normalize-opentype.css/css/normalize-opentype.css'

