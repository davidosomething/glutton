module.exports = (grunt)->

  require('load-grunt-tasks')(grunt)

  ############################################################################

  @config 'bump',
    options:
      files: [
        'bower.json'
        'composer.json'
        'package.json'
        'style.css'
      ]
      updateConfigs: []
      commit:        false
      createTag:     false
      push:          false

  ############################################################################
  # SASS through broccoli
  # Note this task cleans the dest dir before run

  @config 'broccoli',
    dist:
      config: 'Brocfile.js'
      dest: 'static'

  ############################################################################

  @config 'codo',
    options:
      name: 'Glutton'
    src: [
      'app'
    ]

  ############################################################################

  @config 'coffeelint',
    options:
      configFile: 'coffeelint.json'
    tools:  ['Gruntfile.coffe', 'karma.conf.coffee']
    app:    ['app/**/*.coffee']
    spec:   ['spec/**/*.coffee']

  ############################################################################
  # Copy bower components to paths
  # @TODO want to eliminate this step and move to broccoli

  @config 'copy',
    dist:
      files:
        'assets/sass/vendor/_normalize.scss': 'bower_components/normalize.css/normalize.css'

  ############################################################################

  @config 'coveralls',
    karma:
      options:
        force: true
      src: 'reports/coverage/PhantomJS 1.9.7 (Linux)/lcov.info',

  ############################################################################

  @config 'karma',
    test:
      configFile: 'karma.conf.coffee'

  ############################################################################

  @config 'scsslint',
    all:
      files: 'assets/sass/**/*.scss'

  ############################################################################

  @config 'shell',
    prebuild:
      command: [
        'npm prune'
      ].join('&&')

