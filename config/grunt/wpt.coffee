module.exports = ->

  ############################################################################
  # Note this runs against a deployment

  @config 'wpt',
    options:
      locations: [ 'SanJose_IE9' ]
      key: process.env.WPT_API_KEY

    default:
      options:
        url: [
          'http://www.google.com'
        ]
      dest: 'reports/wpt/default/'
