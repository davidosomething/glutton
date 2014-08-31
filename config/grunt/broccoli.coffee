module.exports = ->

  @loadNpmTasks 'grunt-broccoli'

  ############################################################################
  # SASS through broccoli
  # Note this task cleans the dest dir before run

  @config 'broccoli',
    dist:
      config: 'Brocfile.js'
      dest: 'static'

