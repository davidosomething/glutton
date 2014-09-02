module.exports = ->

  @loadNpmTasks 'grunt-yslow'

  ############################################################################
  # Note this runs against a deployment

  @config 'yslow',
    options:
      thresholds:
        weight: 180
        speed: 1000
        score: 80
        requests: 15
    pages:
      files: [
        {
          src: 'http://www.google.com'
          #thresholds:
        }
      ]

    # @TODO
