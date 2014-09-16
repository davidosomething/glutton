describe 'Google adds www', ->

  before ->
    casper.start 'http://google.com'

  it 'should redirect to google with www', ->
    casper.then ->
      expect(/http:\/\/google.com/).to.not.matchCurrentUrl
      expect(/http:\/\/www.google.com/).to.matchCurrentUrl
