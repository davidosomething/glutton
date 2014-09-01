module.exports = ->

  @loadNpmTasks 'grunt-csswring'

  @config 'csswring',
    options:
      map: true
      report: 'min'
    release:
      expand: true
      cwd:  'static/assets/css/'
      src:  '**/*.css'
      dest: 'static/assets/css/'

