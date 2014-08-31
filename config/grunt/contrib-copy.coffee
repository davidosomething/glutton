module.exports = ->

  @loadNpmTasks 'grunt-contrib-copy'

  ############################################################################
  # Copy bower components to paths
  # @TODO want to eliminate this step and move to broccoli

  @config 'copy',
    dist:
      files:
        'assets/sass/vendor/_normalize.scss': 'bower_components/normalize.css/normalize.css'

