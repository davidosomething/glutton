### istanbulify ignore file ###
DefaultRouter = require('../../app/r/default')

describe 'DefaultRouter', ->
  it 'Is a function', ->
    expect(DefaultRouter).to.be.a 'function'

  describe 'Routes', ->
    beforeEach  ->
      @router = new DefaultRouter()
      @routerSpy = sinon.spy()
      Backbone.history.start({
        silent: true
        pushState: true
      })

    it 'should call the index route by default', ->
      @router.on 'route:index', @routerSpy
      @router.navigate '', { trigger: true }

      expect(@routerSpy).to.have.been.calledOnce
