angular.module 'common'

.factory 'spinnerInterceptor', ($q, spinnerManager) ->
  request: (config) ->
    spinnerManager.start()
    return config
  response: (res) ->
    spinnerManager.stop()
    return res
  responseError: (res) ->
    spinnerManager.stop()
    $q.reject res

.config ($httpProvider) ->
  $httpProvider.interceptors.push 'spinnerInterceptor'
