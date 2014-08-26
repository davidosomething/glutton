app = require '../../app/app.coffee'

describe 'App', ->
  it 'Loads app which exports a function that returns 1', ->
    expect(app).to.be.a 'function'
    expect(app()).to.equal 1
