module.exports = ->

  @loadNpmTasks 'grunt-scss-lint'

  ############################################################################

  @config 'scsslint',
    options:
      bundleExec: true
      config: '.scss-lint.yml'
    all:
      src: [
        'assets/sass/*.scss'
        '!assets/sass/vendor/*.scss'
      ]
    report:
      options:
        colorizeOutput: false
        reporterOutput: 'reports/junit-scsslint.xml'
      src: '<%= scsslint.all.src %>'
