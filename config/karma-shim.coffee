browserifyShims = require('config/browserify-shim')
for shim, data of browserifyShims
  window.require.register shim, (require, exports, module)->
    module.exports = data.exports
