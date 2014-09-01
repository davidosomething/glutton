module.exports = ->

  @loadNpmTasks 'grunt-autoprefixer'

  @config 'autoprefixer',
    options:
      browsers: [
        'last 2 versions'
        '> 1%'
      ]
      map: true
    build:
      expand:  true
      cwd:     'static/assets/css'
      src:     [ '**/*.css' ]
      dest:    'static/assets/css'

