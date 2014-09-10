module.exports = ->

  @loadNpmTasks 'grunt-sassdoc'

  ############################################################################

  @config 'sassdoc',
    default:
      options:
        config: 'config/sassdoc.json'
      src: 'assets/sass'
      dest: 'docs/sass'

