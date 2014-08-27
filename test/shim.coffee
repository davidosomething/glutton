commonJsShims = {}
commonJsShims.backbone = (require, exports, module)->
  module.exports = Backbone

require.register('backbone', commonJsShims.backbone)
