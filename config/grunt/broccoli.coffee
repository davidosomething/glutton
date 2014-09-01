module.exports = ->

  @loadNpmTasks 'grunt-broccoli'

  ############################################################################
  # SASS through broccoli
  # Note this task cleans the dest dir before run

  @config 'broccoli',
    sass:
      config: 'config/broccoli/sass.js'
      dest: 'static/assets'

