module.exports = {

  name: 'Index'

  'Can test': (test)->
    test
      .open('http://google.com')
      .assert.title().is('Google', 'It has a title')
      .done()

}
