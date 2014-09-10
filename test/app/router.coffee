DefaultRouter = require('app/r/default')

describe 'DefaultRouter', ->

  beforeEach  ->
    @router = new DefaultRouter()
    @routerSpy = sinon.spy()
    Backbone.history.start({
      silent: true
      pushState: true
    })

  it 'should call the index route by default', ->
    @router.listenToOnce 'route:index', @routerSpy
    @router.navigate '', { trigger: true }

    expect(@routerSpy).to.have.been.calledOnce()
