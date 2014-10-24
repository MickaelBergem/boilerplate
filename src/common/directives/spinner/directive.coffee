# Inspired by http://ricostacruz.com/nprogress/
angular.module 'common'
.directive 'spinner', ->
  restrict: 'E'
  templateUrl: 'common/directives/spinner/view.html'
