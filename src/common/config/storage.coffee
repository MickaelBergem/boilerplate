angular.module 'common'
.value 'storage', {}

.run ($rootScope, storage) ->
  $rootScope.storage = storage
