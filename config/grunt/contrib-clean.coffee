module.exports = ->

  @config 'clean',
    docs:     [ 'docs/*' ]
    reports:  [ 'reports/*' ]
    static:   [ 'static/*' ]
    temp:     [ '.sass-cache/*', 'temp/*', 'tmp/*' ]
