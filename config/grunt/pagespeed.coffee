module.exports = ->

  ############################################################################
  # Note this runs against a deployment

  @config 'pagespeed',
    options:
      nokey: true
    pages:
      options:
        locale: 'en_US'
        url: 'http://www.google.com'
        strategy: 'mobile'
        threshhold: 80

    # @TODO
