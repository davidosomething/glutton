# webdriver = require 'selenium-webdriver'
chai = require('chai')
expect = chai.expect
#
# driver = new webdriver.Builder().
#   withCapabilities(webdriver.Capabilities.chrome()).
#   build()
#
describe 'basic test', ->

  @timeout 5000

  it 'should be on correct page', (done)->
    b = @browser
    b
      .get 'http://google.com'
      .title (e, t)->
        console.log '    - title is ' + t
        expect(t).to.equal('Google')
      .fin ->
        done()

