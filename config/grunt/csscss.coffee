module.exports = ->

  @config 'csscss',
    options:
      bundleExec: true
      outputJson: true
    static:
      files:
        'reports/csscss/csscss.json': [ 'static/assets/css/main.css' ]

