chai = require('chai')
expect = chai.expect
casper_chai = require('casper-chai')
chai.use(casper_chai)

describe 'Google adds www', ->

  before ->
    casper.start()
    casper.viewport(1024,768)

  it 'should have a 1024 wide window', ->
    casper.then ->
      expect( -> return window.innerWidth ).to.evaluate.to.not.equal(400)
      expect( -> return window.innerWidth ).to.evaluate.to.equal(1024)

  it 'should redirect to google with www', ->
    casper.thenOpen 'http://google.com', ->
      expect(/http:\/\/google.com/).to.not.matchCurrentUrl
      expect(/http:\/\/www.google.com/).to.matchCurrentUrl
