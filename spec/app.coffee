console.log(window.require.list())

App = require('app/app')
describe 'App', ->
  it 'Loads app which sets window.app.OK', ->
    expect(window).to.have.property('app')
    expect(window.app).to.be.an('object')
    expect(window.app).to.have.property('OK')
    expect(window.app.OK).to.be.true
