################################################################################
# Pick out the globals when loaded in the karma.conf.coffee files array

shims = {
  backbone: Backbone
  jquery: jQuery
}

################################################################################
# Register shims into require object

for shim, globalObject of shims
  require.register shim, (require, exports, module)->
    module.exports = globalObject

