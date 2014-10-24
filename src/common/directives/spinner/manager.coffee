angular.module 'common'
.factory 'spinnerManager', (storage) ->
  start: ->
    storage.spinning += 1
  stop: ->
    storage.spinning -= 1
