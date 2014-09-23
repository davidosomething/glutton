rollbar = require 'rollbar'

ROLLBAR_CLIENTSIDE_TOKEN = '32244710a5d547649d575a5dbd212fba'

rollbarConfig =
  accessToken: ROLLBAR_CLIENTSIDE_TOKEN
  captureUncaught: true
  payload:
    client:
      javascript:
        source_map_enabled: true,
        code_version: Glutton.revision
        guess_uncaught_frames: true
    environment: Glutton.env

rollbar.init(rollbarConfig)
window.rollbar = rollbar

