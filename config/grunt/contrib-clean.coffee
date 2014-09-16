module.exports = ->

  @loadNpmTasks 'grunt-contrib-clean'

  @config 'clean',
    docs:     [ 'docs/*' ]
    reports:  [ 'reports/*' ]
    static:   [ 'static/*' ]
    temp:     [ '.sass-cache/*', 'temp/*', 'tmp/*' ]
